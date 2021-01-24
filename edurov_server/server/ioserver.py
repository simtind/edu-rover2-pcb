import json
import logging
import multiprocessing
import asyncio
import time

import websockets as websockets

from edurov_server.hardware import arduino
from edurov_server.hardware import system
from edurov_server.utility import get_host_ip


class IOServer(multiprocessing.Process):
    """ Creates a new process that Exposes the ROV sensors and actuators as a websocket data stream """
    def __init__(self, arduino_serial_port='/dev/ttyACM0', arduino_baud_rate=115200, loglevel="INFO", port=8081):
        self.port = port
        self.serial_port = arduino_serial_port
        self.baud_rate = arduino_baud_rate
        self.loglevel = loglevel
        self.sensors = dict()
        self.actuators = dict()
        self.start_time = time.time()
        self.sensor_condition = None
        self.actuator_lock = None
        self.ready = multiprocessing.Event()

        super().__init__(target=self._runner, daemon=True)
        self.start()

    async def _collect_arduino_sensors(self, arduino, server):
        while True:
            await asyncio.sleep(1)
            # Don't get arduino data if we're not serving clients.
            if server.ws_server.websockets:
                self.logger.debug("Get arduino data")
                async with self.sensor_condition:
                    self.sensors.update(await arduino.get_sensors())
                    self.sensor_condition.notify_all()

    async def _collect_system_sensors(self, server):
        raspberry = system.SystemMonitor()
        while True:
            await asyncio.sleep(10)
            # Don't get arduino data if we're not serving clients.
            if server.ws_server.websockets:
                self.logger.debug("Get system data")
                async with self.sensor_condition:
                    self.sensors.update(await raspberry.get_sensors())
                    self.sensors.update(await raspberry.get_system_data())
                    self.sensor_condition.notify_all()

    async def _send_sensors(self, websocket):
        while True:
            self.logger.debug("Wait for sensor data to arrive")
            async with self.sensor_condition:
                await self.sensor_condition.wait()
                await websocket.send(json.dumps(self.sensors))

    async def _receive_input(self, websocket):
        while True:
            self.logger.debug("Wait for incoming websocket data")
            data = await websocket.recv()
            data = json.loads(data)
            self.logger.debug(f"Got websocket data {data}")
            async with self.actuator_lock:
                self.actuators.update(data)
                await self.arduino.set_actuators(self.actuators)

    async def _handler(self, websocket, path):
        self.logger.info(f"I/O server received connection from {path}")
        start_cmd = await websocket.recv()
        send = asyncio.get_event_loop().create_task(self._send_sensors(websocket))
        receive = asyncio.get_event_loop().create_task(self._receive_input(websocket))
        await websocket.wait_closed()
        send.cancel()
        receive.cancel()

    def _runner(self):
        logging.basicConfig(level=self.loglevel)
        self.logger = logging.getLogger("IOServer")
        self.sensor_condition = asyncio.Condition()
        self.actuator_lock = asyncio.Lock()

        server = websockets.serve(self._handler, get_host_ip(), self.port)
        self.logger.info(f"I/O websocket server started at ws://{get_host_ip()}:{self.port}")

        self.arduino = arduino.Arduino(self.serial_port, self.baud_rate)
        asyncio.get_event_loop().create_task(self._collect_arduino_sensors(self.arduino, server))
        asyncio.get_event_loop().create_task(self._collect_system_sensors(server))
        self.logger.debug("Ready to send sensor data")

        self.ready.set()

        asyncio.get_event_loop().run_until_complete(server)
        asyncio.get_event_loop().run_forever()

        self.logger.info('Shutting down i/o server')
        finish = time.time()
        seconds = finish - self.start_time
        self.logger.debug(f'I/O server was live for {seconds:.1f} seconds')
