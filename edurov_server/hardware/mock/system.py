import logging
import multiprocessing
import asyncio
import random

import psutil

from utility import is_linux


class SystemMonitor(object):
    """ Utility functions to read Raspberry pi system state and Sense Hat data asynchronously """
    def __init__(self):
        self.logger = logging.getLogger("SystemMonitor")
        random.seed()
        self.sensors = {
                            'temp': 50.0,
                            'pressure': 1.0,
                            'humidity': .1,
                            'pitch': 0,
                            'roll': 0,
                            'yaw': 0
                        }

    async def get_system_data(self):
        return {
                    'free_space': psutil.disk_usage("/").free / 1024 / 1024,
                    'cpu_temp': "N/A" if not is_linux() else psutil.sensors_temperatures()[0],
                    'cpu_load': psutil.cpu_percent()
                }

    async def get_sensors(self):
        self.sensors['temp'] += random.uniform(-.1, .1)
        self.sensors['pressure'] += random.uniform(-.1, .1)
        self.sensors['humidity'] += random.uniform(-.1, .1)
        self.sensors['pitch'] += random.uniform(-.1, .1)
        self.sensors['roll'] += random.uniform(-.1, .1)
        self.sensors['yaw'] += random.uniform(-.1, .1)
        await asyncio.sleep(0.2)
        return self.sensors
