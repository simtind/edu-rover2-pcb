import logging
import threading
import cv2

from utility import StreamingOutput


class Camera(object):
    def __init__(self, video_resolution, fps):
        self.logger = logging.getLogger("Camera")
        self.fps = fps
        self.stream = StreamingOutput()
        self.resolution = video_resolution
        self.capture = None
        self.timer = None

    def open(self):
        try:
            self.capture = cv2.VideoCapture(0)
            self.capture.set(cv2.CAP_PROP_FRAME_WIDTH, self.resolution[0])
            self.capture.set(cv2.CAP_PROP_FRAME_HEIGHT, self.resolution[1])
            self.capture.set(cv2.CAP_PROP_SATURATION, 0.2)
            self.capture_frame()
        except Exception as e:
            self.logger.warning(e)
            self.logger.warning("Camera initialization failed, camera is not available")
            self.capture = None

    def close(self):
        if self.timer is not None:
            self.timer.cancel()
            self.timer.join()
            self.timer = None
        if self.capture is not None:
            self.capture.release()
            self.capture = None

    def capture_frame(self):
        self.timer = threading.Timer(1 / self.fps, self.capture_frame)
        self.timer.start()
        try:
            rc, img = self.capture.read()
            if not rc:
                return

            rc, buffer = cv2.imencode('.jpg', img)
            if not rc:
                return
            self.stream.write(buffer.tobytes())
        except KeyboardInterrupt:
            self.timer.cancel()

    def __enter__(self):
        self.open()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()
