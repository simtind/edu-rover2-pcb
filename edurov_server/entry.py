import argparse
import logging

from edurov_server.utility import get_host_ip
from edurov_server.server.cameraserver import CameraServer
from edurov_server.server.ioserver import IOServer
from edurov_server.server.webserver import WebpageServer


def edurov_web():
    parser = argparse.ArgumentParser(
        description='Start the Engage eduROV web server')
    parser.add_argument(
        '-r',
        metavar='RESOLUTION',
        type=str,
        default='1024x768',
        help='''resolution, use format WIDTHxHEIGHT (default 1024x768)''')
    parser.add_argument(
        '-fps',
        metavar='FRAMERATE',
        type=int,
        default=30,
        help='framerate for the camera (default 30)')
    parser.add_argument(
        '-port',
        metavar='SERVER_PORT',
        type=int,
        default=80,
        help="which port the server should serve it's main page (default 80)")
    parser.add_argument(
        '-serial',
        metavar='SERIAL_PORT',
        type=str,
        default='/dev/ttyACM0',
        help="which serial port the script should try to use to communicate with the Arduino module")
    parser.add_argument(
        '--loglevel',
        type=str,
        default='DEBUG',
        help='Set log level')

    args = parser.parse_args()

    logging.basicConfig(level=args.loglevel)

    camera = CameraServer(args.r, args.fps, args.loglevel)
    io = IOServer(args.serial, args.loglevel)

    logging.info("Waiting for websocket servers to go online before starting web server")
    camera.ready.wait()
    io.ready.wait()

    with WebpageServer(server_address=('', args.port)) as s:
        print(f'Visit the webpage at {get_host_ip()}:{args.port}')
        s.serve_forever()


if __name__ == '__main__':
    edurov_web()
