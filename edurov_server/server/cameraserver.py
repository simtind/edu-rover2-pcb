import base64
import logging
import multiprocessing
import asyncio
import time

import websockets

from ..hardware import camera
from ..utility import get_host_ip


class CameraServer(multiprocessing.Process):
    """ Creates a new process that Exposes the raspberry pi camera as a websocket image stream """
    def __init__(self, video_resolution='1024x768', fps=30, loglevel="INFO", port=8081):
        self.port = port
        self.video_resolution = [int(value) for value in video_resolution.split('x')]
        self.fps = fps
        self.loglevel = loglevel
        self.start_time = time.time()
        self.server = None
        self.ready = multiprocessing.Event()
        self.stop_event = multiprocessing.Event()

        super().__init__(target=self._runner, daemon=True)
        self.start()

    async def stop(self):
        self.stop_event.set()
        self.join()
        logging.debug("Camera process terminated")

    async def _wait_for_stop_event(self):
        while not self.stop_event.is_set():
            await asyncio.sleep(2)
        self.server.ws_server.close()

    async def _send_frames(self, websocket):
        if self.camera is None:
            return
        while not self.stop_event.is_set():
            with self.camera.stream.condition:
                self.camera.stream.condition.wait()
                if self.camera.stream.frame is not None:
                    await websocket.send("data:image/jpg;base64," + base64.b64encode(self.camera.stream.frame).decode())

    async def _handler(self, websocket, path):
        self.logger.info(f"Camera server received connection from {path}")
        start_cmd = await websocket.recv()
        send = asyncio.create_task(self._send_frames(websocket))
        await websocket.wait_closed()
        send.cancel()

    def _runner(self):
        asyncio.run(self._task())

    async def _task(self):
        logging.basicConfig(level=self.loglevel)
        self.logger = logging.getLogger("CameraServer")
        logging.getLogger("websockets.protocol").setLevel(logging.INFO)
        with camera.Camera(self.video_resolution, self.fps) as self.camera:
            self.server = websockets.serve(self._handler, get_host_ip(), self.port)
            stop_task = asyncio.create_task(self._wait_for_stop_event())

            self.logger.info(f"Camera websocket server started at ws://{get_host_ip()}:{self.port}")
            self.ready.set()

            await self.server
            await stop_task

        self.logger.info('Shutting down camera server')
        finish = time.time()
        seconds = finish - self.start_time
        if self.camera is not None:
            framerate = self.camera.stream.count / (finish - self.start_time)
        else:
            framerate = 0
        self.logger.debug(f'Sent {self.camera.stream.count} images in {seconds:.1f} seconds at {framerate:.2f} fps')

