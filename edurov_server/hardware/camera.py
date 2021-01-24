import logging
import picamera

from edurov_server.utility import StreamingOutput


class Camera(object):
    def __init__(self, video_resolution, fps):
        self.logger = logging.getLogger("Camera")
        try:
            self.camera = picamera.PiCamera(resolution=video_resolution, framerate=fps)
            self.stream = StreamingOutput()
            self.camera.start_recording(self.stream, format='mjpeg')
        except Exception as e:
            self.logger.warning(e)
            self.logger.warning("Camera initialization failed, camera is not available")
            self.camera = None

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        if self.camera is not None:
            self.camera.close()
