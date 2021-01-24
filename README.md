# edurov-simple
This repository aims to improve on the [eduROV](https://github.com/trolllabs/eduROV) project. 
It lends heavily from the original eduROV project, and as such is distributed under the same license.

## Changes from [eduROV](https://github.com/trolllabs/eduROV)
### Hardware 
The pcb folder contains a kiCad project that simplifies the original system design in the following ways:
- The Raspberry PI is now directly attached to the main PCB by a 2x20 pin header. 
  - This removes the need for splicing a USB cable for powering the PI, especially useful when using a RPi 4 which uses USB-C
  - Allows direct connection to Arduino via PCB in stead of via USB cable
  - Generally tightens up packaging by removing wires.
- The Raspberry PI sense hat is placed above the main PCB
  - This makes it possible to use the RGB matrix
  - Keeps the sense hat away from the bottom of the case in case of leaks
- The motor relays have been replaced with L6203 motor drivers
  - This allows PWM-control of the actuators
- Additional solder points for 5v regulator
  - Previous layout was hard to use as there were multiple wires in same screw terminal.
  - Layout is designed for iFlight Micro BEC, but works with others too.
- Added optional current sensing for motors
- Added optional resistor location for 3s lithium battery

### Software
The python server is redesigned from scratch with the aim of removing unnecessary functionality, and reorganizing functions.
By doing this, we can improve performance and simplify making changes to the code. 
Performance is improved by allocating more I/O tasks on the client side, and making use of the multiprocessing 
capabilities of python to separate camera streaming, sensor and actuator communication, and the general web site hosting.  
 
The web site keeps the original design, but the javascript is redesign to communicate with the update server interface.

The web site no longer passes key presses back to the raspberry pi for processing. 
This design lead to keys hanging, and caused unnecessary coupling between the python code and javascript.
The web page javascript code now is made aware that it controls an ROV, and sends actuator requests to the python server.

Camera, sensor, and actuator data is now streamed via web sockets between the server and client. 
This should allow more clients to connect to the ROV at a time, and decouples the three data streams from each other 
since they're running on separate processes. This should improve response times.

A hardware simulation system has been set up to allow SW development without the actual hardware available. 
The python/hardware/mock folder contains the test libraries. Arduino code is emulated by providing random sensor data,
 and printing any sent messages.
 
## Hardware