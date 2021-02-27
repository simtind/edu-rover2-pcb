import asyncio
import logging
import serial_asyncio
from serial.tools import list_ports


class Arduino(object):
    """ Utility functions to perform Arduino communication asynchronously """
    def __init__(self, serial_port, baud_rate=115200):
        self.logger = logging.getLogger("Arduino")
        self.baud_rate = baud_rate

        if serial_port is None:
            self.logger.debug("Attempt to auto-detect Arduino serial port")
            coms = list_ports.comports()
            self.logger.debug(f"Available serial ports: {str(coms)}")
            arduino = [com for com in coms if "Arduino" in com.description]
            if arduino:
                serial_port = arduino[0]
            else:
                serial_port = coms[0]
            serial_port = serial_port.device

        self.serial_port = serial_port
        self._reader = None
        self._writer = None

    async def open(self):
        self._reader, self._writer \
            = await serial_asyncio.open_serial_connection(url=self.serial_port, baudrate=self.baud_rate)

    async def close(self):
        self._writer.close()

    async def __aenter__(self):
        await self.open()
        return self

    async def __aexit__(self, exc_type, exc, tb):
        await self.close()

    async def get_sensors(self):
        received = (await self._reader.readline()).decode("ascii", errors="ignore").strip()
        self.logger.debug(f"Received data from Arduino: {received}")
        sensors = received.split(',')
        if len(sensors) != 7:
            return dict()
        sensors = [int(sensor)/100 for sensor in sensors]
        return {
                   "batteryVoltage":    sensors[0],
                   "pressureWater":     sensors[1],
                   "tempWater":         sensors[2],
                   "motorCurrents":     sensors[3:6]
               }

    async def set_interval(self, interval):
        message = f"interval={interval}".encode('ascii')
        self.logger.debug(f"Sent interval to Arduino: {message}")
        await self._writer.write(message)

    async def set_actuators(self, values):
        vertical  = int(round(1000 * values["vertical"]))
        starboard = int(round(1000 * values["starboard"]))
        port      = int(round(1000 * values["port"]))
        lights    = int(round(1000 * values['lights']))

        message = f"{starboard}, {port}, {vertical}, {lights}".encode('ascii')
        self.logger.debug(f"Sent data to Arduino: {message}")
        await self._writer.write(message)
