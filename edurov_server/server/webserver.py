"""
Sever classes used in the web method
"""
import asyncio
import json
import logging
import signal
import time
from aiohttp import web
import ssl
from pathlib import Path

from aiohttp.web_runner import GracefulExit
from aiortc import RTCSessionDescription, RTCPeerConnection
from aiortc.contrib.media import MediaPlayer

from ..utility import get_host_ip, is_osx, is_linux, is_windows


class WebServer:
    async def on_shutdown(self, event):
        await self.camera_server.stop()
        await self.io_server.stop()
        self.logger.info('Shutting down http server')
        finish = time.time()
        self.logger.debug(f'HTTP server was live for {finish - self.start:.1f} seconds')

    async def serve_camera(self, request):
        return web.Response(text=f"ws://{self.server_address}:{self.camera_server.port}")

    async def serve_io(self, request):
        return web.Response(text=f"ws://{self.server_address}:{self.io_server.port}")

    async def serve_entry(self, request):
        raise web.HTTPFound(location="/index.html")

    async def stop(self, request):
        if not self.is_shutdown.is_set():
            self.is_shutdown.set()
            await self.app.shutdown()
            await self.app.cleanup()
            # Force aioHTTP to exit
            # signal.raise_signal(signal.SIGINT)
            raise KeyboardInterrupt()

    async def index_handler(self, request):
        return web.FileResponse(self.root_dir / "index.html")

    def __init__(self,
                 server_address=None,
                 port=80, index_file=Path(__file__).parent.parent / "web" / "index.html",
                 log_level="INFO",
                 camera_server=None,
                 io_server=None):
        logging.basicConfig(level=log_level)
        self.logger = logging.getLogger("WebpageServer")
        self.root_dir = index_file.parent
        self.start = time.time()
        self.app = web.Application()
        self.app.on_shutdown.append(self.on_shutdown)
        self.camera_server = camera_server
        self.io_server = io_server
        self.pcs = set()
        self.is_shutdown = asyncio.Event()

        self.app.add_routes(
            [
                web.get("/cameraserver", self.serve_camera),
                web.get("/ioserver", self.serve_io),
                web.get("/stop", self.stop),
                web.get("/", self.serve_entry),
                web.static("/", self.root_dir),
                web.static("/scripts", self.root_dir / "scripts"),
                web.static("/static", self.root_dir / "static")
            ]
        )

        if server_address is None:
            server_address = get_host_ip()
        self.server_address = server_address
        self.port = port

    def run(self):
        print(f'Visit the webpage at {self.server_address}:{self.port}')
        try:
            web.run_app(self.app, host=self.server_address, port=self.port)
        except KeyboardInterrupt:
            pass
        finally:
            logging.debug("Web server terminated")

