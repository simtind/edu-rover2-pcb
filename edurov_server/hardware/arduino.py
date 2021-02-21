import asyncio
import logging
import serial_asyncio


class Arduino(object):
    """ Utility functions to perform Arduino communication asynchronously """
    def __init__(self, serial_port, baud_rate=115200):
        self.logger = logging.getLogger("Arduino")
        self.serial_port = serial_port
        self.baud_rate = baud_rate
        self._reader, self._writer \
            = asyncio.run(serial_asyncio.open_serial_connection(port=self.serial_port, baudrate=self.baud_rate))

    async def get_sensors(self):
        received = await self._reader.readline()
        sensors = received.split(',')
        return {
                   'batteryVoltage': float(sensors[0] / 100),
                   'pressureWater': float(sensors[1] / 100),
                   'tempWater': float(sensors[2] / 100),
                   'motorCurrents': [float(sensor / 100) for sensor in sensors[3:7]]
               }

    async def set_actuators(self, values):

        vertical  = int(round(1000 * values["vertical"]))
        starboard = int(round(1000 * values["starboard"]))
        port      = int(round(1000 * values["port"]))
        lights    = int(round(1000 * values['lights']))

        message = f"{starboard}, {port}, {vertical}, {lights}".encode('ascii')
        await self._writer.write(message)
