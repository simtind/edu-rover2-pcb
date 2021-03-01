
# Import mock interfaces if not running on raspberry pi.
from ..utility import is_raspberrypi

if not is_raspberrypi():
    from .mock import system as system
    from .mock import camera as camera
else:
    from . import system as system
    from . import camera as camera

from . import arduino as arduino
