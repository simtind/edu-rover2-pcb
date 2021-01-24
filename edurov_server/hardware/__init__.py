
# Import mock interfaces if not running on raspberry pi.
from edurov_server.utility import is_raspberrypi

if not is_raspberrypi():
    from .mock import system as system
    from .mock import arduino as arduino
    from .mock import camera as camera
else:
    from . import system as system
    from . import arduino as arduino
    from . import camera as camera
