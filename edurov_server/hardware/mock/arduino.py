import asyncio
import random
import logging


class Arduino(object):
    """ Utility functions to test Arduino sensor read outside of RoV """
    def __init__(self, serial_port, baud_rate=115200):
        self.logger = logging.getLogger("Arduino")
        random.seed()
        # Set some reasonable default values
        self.sensors = {
                   'tempWater': 30.0,
                   'pressureWater': 100.0,
                   'batteryVoltage': 12.2
               }

        self.logger.debug(f"Opening mock serial port on {serial_port} at {baud_rate} baud.")

    async def get_sensors(self):
        self.sensors['tempWater'] += random.uniform(-.1, .1)
        self.sensors['pressureWater'] += random.uniform(-.1, .1)
        self.sensors['batteryVoltage'] += random.uniform(-.1, .1)
        await asyncio.sleep(0.2)
        return self.sensors

    async def set_actuators(self, values):
        vertical  = int(round(100 * values["vertical"]))
        starboard = int(round(100 * values["starboard"]))
        port      = int(round(100 * values["port"]))
        lights    = int(round(values['lights']))

        self.logger.debug(f"vertical={vertical};starboard={starboard};port={port};lights={lights}".encode('ascii'))
        await asyncio.sleep(.2)
