import logging
import psutil
import sense_hat


class SenseHat(object):
    """ Utility functions to read Sense Hat data asynchronously """
    def __init__(self):
        self.logger = logging.getLogger("SenseHat")
        self.sense = None
        try:
            self.sense = sense_hat.SenseHat()
            self.sense.show_message("Hello World")
        except Exception as e:
            self.logger.warning("Sense hat is not available",  exc_info=True)

    async def get_sensors(self):
        if self.sense is None:
            return dict()
        
        orientation = self.sense.get_orientation()
        return {
                    'temp':     self.sense.get_temperature(),
                    'pressure': self.sense.get_pressure() / 10,
                    'humidity': self.sense.get_humidity(),
                    'pitch':    orientation['pitch'],
                    'roll':     orientation['roll'],
                    'yaw':      orientation['yaw']
                }


class SystemMonitor(object):
    """ Utility functions to read Raspberry pi system state and Sense Hat data asynchronously """
    def __init__(self):
        self.logger = logging.getLogger("SystemMonitor")

    async def get_system_data(self):
        temps = psutil.sensors_temperatures()
        free_disk = psutil.disk_usage("/").free / 1024 / 1024
        cpu_usage = psutil.cpu_percent() 
        try:
            temp = list(temps.values())[0][0].current
        except:
            temp = "N/A"
        
        return {
                    'free_space': free_disk,
                    'cpu_temp': temp,
                    'cpu_load': cpu_usage
                }
