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
        water_temp, water_pressure, battery_voltage = received.split(':')
        return {
                   'tempWater': float(water_temp),
                   'pressureWater': float(water_pressure),
                   'batteryVoltage': float(battery_voltage)
               }

    async def set_actuators(self, values):

        vertical  = int(round(100 * values["vertical"]))
        starboard = int(round(100 * values["starboard"]))
        port      = int(round(100 * values["port"]))
        lights    = int(round(values['lights']))

        message = f"vertical={vertical};starboard={starboard};port={port};lights={lights}".encode('ascii')
        await self._writer.write(message)
