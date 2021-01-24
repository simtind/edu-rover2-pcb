import base64
import logging
import multiprocessing
import asyncio
import time

import websockets as websockets

from edurov_server.hardware import camera
from edurov_server.utility import get_host_ip


class CameraServer(multiprocessing.Process):
    """ Creates a new process that Exposes the raspberry pi camera as a websocket image stream """
    def __init__(self, video_resolution='1024x768', fps=30, loglevel="INFO", port=8080):
        self.port = port
        self.video_resolution = [int(value) for value in video_resolution.split('x')]
        self.fps = fps
        self.loglevel = loglevel
        self.start_time = time.time()
        self.ready = multiprocessing.Event()

        super().__init__(target=self._runner, daemon=True)
        self.start()

    async def _send_frames(self, websocket):
        while True:
            with self.camera.stream.condition:
                self.camera.stream.condition.wait()
                if self.camera.stream.frame is not None:
                    self.logger.debug("Send frame")
                    await websocket.send("data:image/jpg;base64," + base64.b64encode(self.camera.stream.frame).decode())

    async def _handler(self, websocket, path):
        self.logger.info(f"Camera server received connection from {path}")
        start_cmd = await websocket.recv()
        send = asyncio.get_event_loop().create_task(self._send_frames(websocket))
        await websocket.wait_closed()
        send.cancel()

    def _runner(self):
        logging.basicConfig(level=self.loglevel)
        self.logger = logging.getLogger("CameraServer")
        with camera.Camera(self.video_resolution, self.fps) as self.camera:
            server = websockets.serve(self._handler, get_host_ip(), self.port)
            self.logger.info(f"Camera websocket server started at ws://{get_host_ip()}:{self.port}")

            self.ready.set()

            asyncio.get_event_loop().run_until_complete(server)
            asyncio.get_event_loop().run_forever()

        self.logger.info('Shutting down camera server')
        finish = time.time()
        seconds = finish - self.start_time
        framerate = self.camera.stream.count / (finish - self.start_time)
        self.logger.debug(f'Sent {self.camera.stream.count} images in {seconds:.1f} seconds at {framerate:.2f} fps')

