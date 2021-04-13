import json
import logging
import multiprocessing
import asyncio
import time

import websockets as websockets

from ..hardware import arduino
from ..hardware import system
from ..utility import get_host_ip


class IOServer(multiprocessing.Process):
    """ Creates a new process that Exposes the ROV sensors and actuators as a websocket data stream """
    def __init__(self, arduino_serial_port='/dev/ttyACM0', arduino_baud_rate=115200, loglevel="INFO", port=8082):
        self.port = port
        self.serial_port = arduino_serial_port
        self.baud_rate = arduino_baud_rate
        self.loglevel = loglevel
        self.sensors = dict()
        self.actuators = dict(sensor_interval=1)
        self.start_time = time.time()
        self.sensor_condition = None
        self.sensor_event = None
        self.actuator_lock = None
        self.server = None
        self.ready = multiprocessing.Event()
        self.stop_event = multiprocessing.Event()

        super().__init__(target=self._runner, daemon=True)
        self.start()

    async def stop(self):
        self.stop_event.set()
        self.join()
        logging.debug("IO process terminated")

    async def _wait_for_stop_event(self):
        while not self.stop_event.is_set():
            await asyncio.sleep(2)
        self.server.ws_server.close()

    async def _collect_arduino_sensors(self):
        while not self.stop_event.is_set():
            # Don't get arduino data if we're not serving clients.
            if self.server.ws_server.websockets:
                self.logger.debug("Get arduino data")
                async with self.sensor_condition:
                    self.sensors.update(await self.arduino.get_sensors())
                    self.sensor_condition.notify_all()
                await self.sensor_event.wait()
            else:
                await asyncio.sleep(1)

    async def _collect_sense_hat_sensors(self):
        raspberry = system.SenseHat()
        while not self.stop_event.is_set():
            # Don't get arduino data if we're not serving clients.
            if self.server.ws_server.websockets:
                self.logger.debug("Get sense hat data")
                async with self.sensor_condition:
                    await asyncio.sleep(self.actuators["sensor_interval"])
                    self.sensors.update(await raspberry.get_sensors())
                    self.sensor_condition.notify_all()
                await self.sensor_event.wait()
            else:
                await asyncio.sleep(1)

    async def _collect_system_data(self):
        raspberry = system.SystemMonitor()
        while not self.stop_event.is_set():
            await asyncio.sleep(10)
            # Don't get arduino data if we're not serving clients.
            if self.server.ws_server.websockets:
                self.logger.debug("Get system data")
                async with self.sensor_condition:
                    self.sensors.update(await raspberry.get_system_data())
                    self.sensor_condition.notify_all()
                await self.sensor_event.wait()

    async def _send_sensors(self, websocket):
        while not self.stop_event.is_set():
            self.sensor_event.clear()
            async with self.sensor_condition:
                await self.sensor_condition.wait()
                await websocket.send(json.dumps(self.sensors))
                self.sensor_event.set()
        # Free other threads so they may exit.
        self.sensor_event.set()

    async def _receive_input(self, websocket):
        while not self.stop_event.is_set():
            self.logger.debug("Wait for incoming websocket data")
            data = await websocket.recv()
            data = json.loads(data)
            self.logger.debug(f"Got websocket data {data}")
            async with self.actuator_lock:
                if data["sensor_interval"] != self.actuators["sensor_interval"]:
                    await self.arduino.set_interval(data["sensor_interval"])
                self.actuators.update(data)
                await self.arduino.set_actuators(self.actuators)

    async def _handler(self, websocket, path):
        self.logger.info(f"I/O server received connection from {path}")
        await websocket.recv()
        send = asyncio.create_task(self._send_sensors(websocket))
        receive = asyncio.create_task(self._receive_input(websocket))
        await websocket.wait_closed()
        await send
        await receive

    def _runner(self):
        asyncio.run(self._task())

    async def _task(self):
        logging.basicConfig(level=self.loglevel)
        self.logger = logging.getLogger("IOServer")
        self.sensor_condition = asyncio.Condition()
        self.sensor_event = asyncio.Event()
        self.actuator_lock = asyncio.Lock()

        self.server = websockets.serve(self._handler, get_host_ip(), self.port)
        self.logger.info(f"I/O websocket server started at ws://{get_host_ip()}:{self.port}")

        async with arduino.Arduino(self.serial_port, self.baud_rate) as self.arduino:
            arduino_task = asyncio.create_task(self._collect_arduino_sensors())
            arduino_task = asyncio.create_task(self._collect_sense_hat_sensors())
            system_task = asyncio.create_task(self._collect_system_data())
            self.logger.debug("Ready to send sensor data")

            self.ready.set()

            await self.server
            await arduino_task
            await system_task

        self.logger.info('Shutting down i/o server')
        finish = time.time()
        seconds = finish - self.start_time
        self.logger.debug(f'I/O server was live for {seconds:.1f} seconds')
