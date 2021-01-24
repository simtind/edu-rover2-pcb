import logging
import psutil


class SystemMonitor(object):
    """ Utility functions to read Raspberry pi system state and Sense Hat data asynchronously """
    def __init__(self):
        self.logger = logging.getLogger("SystemMonitor")
        self.sense = SenseHat()

    async def get_system_data(self):
        return {
                    'free_space': psutil.disk_usage("/").free,
                    'cpu_temp': psutil.sensors_temperatures()[0],
                    'cpu_load': psutil.cpu_percent()
                }

    async def get_sensors(self):
        orientation = self.sense.get_orientation()
        return {
                    'temp':     self.sense.get_temperature(),
                    'pressure': self.sense.get_pressure() / 10,
                    'humidity': self.sense.get_humidity(),
                    'pitch':    orientation['pitch'],
                    'roll':     orientation['roll'] + 180,
                    'yaw':      orientation['yaw']
                }
