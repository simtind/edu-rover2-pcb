EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 5
Title "eduROV motherboard"
Date ""
Rev "A"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x03 P102
U 1 1 59CD089E
P 6075 7675
F 0 "P102" H 6075 7875 50  0000 C CNN
F 1 "Ext press" V 6175 7675 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 6075 7675 50  0001 C CNN
F 3 "" H 6075 7675 50  0000 C CNN
F 4 "PRPC003SBAN-M71RC" H 6075 7675 50  0001 C CNN "Part number"
F 5 "2.54mm pitch 3-pin header" H 6075 7675 50  0001 C CNN "Description"
F 6 "Sullins Connector Solutions" H 6075 7675 50  0001 C CNN "Manufacturer"
F 7 "S1111EC-03-ND" H 6075 7675 50  0001 C CNN "Digikey reference"
	1    6075 7675
	1    0    0    -1  
$EndComp
Text GLabel 7200 7775 0    60   Input ~ 0
GND
Text GLabel 5875 7775 0    60   Input ~ 0
GND
Text GLabel 9600 6900 2    60   Input ~ 0
+Bat1
Text GLabel 9550 7850 0    60   Input ~ 0
BattMonitor
Text GLabel 7200 7575 0    60   Input ~ 0
TempMonitor
Text GLabel 5875 7575 0    60   Input ~ 0
PressMonitor
$Comp
L Connector_Generic:Conn_01x02 2Pscrew103
U 1 1 59CD3D3E
P 13825 4525
F 0 "2Pscrew103" H 14175 4475 50  0000 C CNN
F 1 "Channel 3" H 14125 4575 50  0000 C CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 13825 4525 50  0001 C CNN
F 3 "" H 13825 4525 50  0000 C CNN
F 4 "691137710002" H 13825 4525 50  0001 C CNN "Part number"
F 5 "732-10955-ND" H 13825 4525 50  0001 C CNN "Digikey reference"
F 6 "2-position terminal block, 12-30 AWG, 5mm pitch" H 13825 4525 50  0001 C CNN "Description"
F 7 "Wurth" H 13825 4525 50  0001 C CNN "Manufacturer"
	1    13825 4525
	1    0    0    1   
$EndComp
Text GLabel 12225 7500 0    60   Input ~ 0
IO_LED
Text GLabel 12225 7800 0    60   Input ~ 0
GND
Text GLabel 12225 6925 0    60   Input ~ 0
+Bat1
$Comp
L Edurov:IRL540NPBF Q101
U 1 1 5A60C2A4
P 13075 7500
F 0 "Q101" H 13325 7575 50  0000 L CNN
F 1 "IRL540NPBF" H 13325 7500 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 13325 7425 50  0001 L CIN
F 3 "" H 13075 7500 50  0001 L CNN
F 4 "IRL540NPBF" H 13075 7500 50  0001 C CNN "Part number"
F 5 "IRL540NPBF-ND" H 13075 7500 50  0001 C CNN "Digikey reference"
F 6 "MOSFET, >2A, Vgth = 2V" H 13075 7500 50  0001 C CNN "Description"
F 7 "Infineon Technologies" H 13075 7500 50  0001 C CNN "Manufacturer"
	1    13075 7500
	1    0    0    -1  
$EndComp
Text GLabel 9600 8200 2    60   Input ~ 0
-Batt
Text Notes 12155 10350 0    59   ~ 0
PCB is made with 2oz copper layer due to cross-section requirement
Text GLabel 2125 1725 1    60   Input ~ 0
+5V
Text GLabel 2025 1725 1    60   Input ~ 0
+5V
Text GLabel 1975 4475 3    60   Input ~ 0
GND
Wire Wire Line
	2325 4325 2325 4425
Wire Wire Line
	2325 4425 2225 4425
Wire Wire Line
	1975 4425 1975 4475
Wire Wire Line
	2225 4325 2225 4425
Connection ~ 2225 4425
Wire Wire Line
	2225 4425 2125 4425
Connection ~ 2125 4425
Wire Wire Line
	2125 4425 2025 4425
Wire Wire Line
	2025 4325 2025 4425
Connection ~ 2025 4425
Wire Wire Line
	2025 4425 1975 4425
Wire Wire Line
	1925 4325 1925 4425
Wire Wire Line
	1925 4425 1975 4425
Connection ~ 1975 4425
Wire Wire Line
	1925 4425 1825 4425
Wire Wire Line
	1825 4425 1825 4325
Connection ~ 1925 4425
Wire Wire Line
	1825 4425 1725 4425
Wire Wire Line
	1725 4425 1725 4325
Connection ~ 1825 4425
Wire Wire Line
	1725 4425 1625 4425
Wire Wire Line
	1625 4425 1625 4325
Connection ~ 1725 4425
Wire Wire Line
	9600 6900 9550 6900
Wire Wire Line
	9550 6900 9550 6950
Wire Wire Line
	9550 8150 9550 8200
Wire Wire Line
	9550 8200 9600 8200
Wire Wire Line
	2125 4325 2125 4425
Text GLabel 12075 5625 0    60   Input ~ 0
IO4A
Text GLabel 12075 5725 0    60   Input ~ 0
IO4B
Text GLabel 5175 2675 3    60   Input ~ 0
GND
Text GLabel 12075 5475 0    60   Input ~ 0
IOEN
Text GLabel 6725 2925 2    60   Input ~ 0
BattMonitor
Text GLabel 6725 2825 2    60   Input ~ 0
PressMonitor
Text GLabel 6725 2725 2    60   Input ~ 0
TempMonitor
Wire Wire Line
	12225 7800 12425 7800
Connection ~ 12425 7800
Wire Wire Line
	12225 7500 12425 7500
Connection ~ 12425 7500
Wire Wire Line
	12425 7500 12875 7500
Text Label 13225 4425 0    60   ~ 0
Mot3+
Text Label 13225 4525 0    60   ~ 0
Mot3-
$Comp
L Connector_Generic:Conn_01x02 2Pscrew101
U 1 1 59CD3B58
P 13825 2175
F 0 "2Pscrew101" H 14175 2125 50  0000 C CNN
F 1 "Channel 1" H 14125 2225 50  0000 C CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 13825 2175 50  0001 C CNN
F 3 "" H 13825 2175 50  0000 C CNN
F 4 "691137710002" H 13825 2175 50  0001 C CNN "Part number"
F 5 "732-10955-ND" H 13825 2175 50  0001 C CNN "Digikey reference"
F 6 "2-position terminal block, 12-30 AWG, 5mm pitch" H 13825 2175 50  0001 C CNN "Description"
F 7 "Wurth" H 13825 2175 50  0001 C CNN "Manufacturer"
	1    13825 2175
	1    0    0    1   
$EndComp
$Sheet
S 12075 5325 1050 700 
U 5FFEC45F
F0 "MotorController_4" 60
F1 "MotorController.sch" 60
F2 "ENABLE" I L 12075 5475 60 
F3 "IN1" I L 12075 5625 60 
F4 "IN2" I L 12075 5725 60 
F5 "SENSE" I L 12075 5875 60 
F6 "GND" I R 13125 5875 60 
F7 "+Bat" I R 13125 5475 60 
F8 "MOT+" I R 13125 5625 60 
F9 "MOT-" I R 13125 5725 60 
$EndSheet
Text GLabel 13125 5875 2    60   Input ~ 0
GND
Text GLabel 13125 5475 2    60   Input ~ 0
+Bat1
Text GLabel 12075 4675 0    60   Input ~ 0
Sense3
$Sheet
S 12075 4125 1050 700 
U 6003A868
F0 "MotorController_3" 60
F1 "MotorController.sch" 60
F2 "ENABLE" I L 12075 4275 60 
F3 "IN1" I L 12075 4425 60 
F4 "IN2" I L 12075 4525 60 
F5 "SENSE" I L 12075 4675 60 
F6 "GND" I R 13125 4675 60 
F7 "+Bat" I R 13125 4275 60 
F8 "MOT+" I R 13125 4425 60 
F9 "MOT-" I R 13125 4525 60 
$EndSheet
Text GLabel 13125 4675 2    60   Input ~ 0
GND
Text GLabel 13125 4275 2    60   Input ~ 0
+Bat1
$Sheet
S 12075 2925 1050 700 
U 6003F027
F0 "MotorController_2" 60
F1 "MotorController.sch" 60
F2 "ENABLE" I L 12075 3075 60 
F3 "IN1" I L 12075 3225 60 
F4 "IN2" I L 12075 3325 60 
F5 "SENSE" I L 12075 3475 60 
F6 "GND" I R 13125 3475 60 
F7 "+Bat" I R 13125 3075 60 
F8 "MOT+" I R 13125 3225 60 
F9 "MOT-" I R 13125 3325 60 
$EndSheet
Text GLabel 13125 3475 2    60   Input ~ 0
GND
Text GLabel 13125 3075 2    60   Input ~ 0
+Bat1
$Sheet
S 12075 1775 1050 700 
U 60043462
F0 "MotorController_1" 60
F1 "MotorController.sch" 60
F2 "ENABLE" I L 12075 1925 60 
F3 "IN1" I L 12075 2075 60 
F4 "IN2" I L 12075 2175 60 
F5 "SENSE" I L 12075 2325 60 
F6 "GND" I R 13125 2325 60 
F7 "+Bat" I R 13125 1925 60 
F8 "MOT+" I R 13125 2075 60 
F9 "MOT-" I R 13125 2175 60 
$EndSheet
Text GLabel 13125 2325 2    60   Input ~ 0
GND
Text GLabel 13125 1925 2    60   Input ~ 0
+Bat1
$Comp
L Connector_Generic:Conn_01x02 2Pscrew104
U 1 1 59CD3CF4
P 13825 5725
F 0 "2Pscrew104" H 14175 5675 50  0000 C CNN
F 1 "Channel 4" H 14125 5775 50  0000 C CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 13825 5725 50  0001 C CNN
F 3 "" H 13825 5725 50  0000 C CNN
F 4 "691137710002" H 13825 5725 50  0001 C CNN "Part number"
F 5 "732-10955-ND" H 13825 5725 50  0001 C CNN "Digikey reference"
F 6 "2-position terminal block, 12-30 AWG, 5mm pitch" H 13825 5725 50  0001 C CNN "Description"
F 7 "Wurth" H 13825 5725 50  0001 C CNN "Manufacturer"
	1    13825 5725
	1    0    0    1   
$EndComp
Wire Wire Line
	13125 4425 13625 4425
Wire Wire Line
	13125 4525 13625 4525
Text Label 13225 5625 0    60   ~ 0
Mot4+
Text Label 13225 5725 0    60   ~ 0
Mot4-
Wire Wire Line
	13125 5625 13625 5625
Wire Wire Line
	13125 5725 13625 5725
Text Label 13225 3225 0    60   ~ 0
Mot2+
Text Label 13225 3325 0    60   ~ 0
Mot2-
Wire Wire Line
	13125 3225 13625 3225
Wire Wire Line
	13125 3325 13625 3325
Text Label 13225 2075 0    60   ~ 0
Mot1+
Text Label 13225 2175 0    60   ~ 0
Mot1-
Wire Wire Line
	13125 2075 13625 2075
Wire Wire Line
	13125 2175 13625 2175
$Comp
L MCU_Module:Arduino_Nano_v3.x A101
U 1 1 60095748
P 6225 2725
F 0 "A101" H 5325 3725 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5625 3675 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 6225 2725 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 6225 2725 50  0001 C CNN
F 4 "ABX00033" H 6225 2725 50  0001 C CNN "Part number"
F 5 "1050-ABX00033-ND" H 6225 2725 50  0001 C CNN "Digikey reference"
F 6 "ARDUINO NANO EVERY with headers" H 6225 2725 50  0001 C CNN "Description"
F 7 "Arduino" H 6225 2725 50  0001 C CNN "Manufacturer"
	1    6225 2725
	1    0    0    -1  
$EndComp
Text GLabel 6725 3425 2    60   Input ~ 0
Sense1
Text GLabel 6725 3325 2    60   Input ~ 0
Sense2
Text GLabel 6725 3225 2    60   Input ~ 0
Sense3
Text GLabel 6725 3125 2    60   Input ~ 0
Sense4
Text GLabel 5725 2725 0    60   Input ~ 0
IO2B
Text GLabel 5725 2825 0    60   Input ~ 0
IO2A
Text GLabel 5025 2325 0    60   Input ~ 0
IOEN
Text GLabel 5725 2625 0    60   Input ~ 0
IO1A
Text GLabel 5725 2525 0    60   Input ~ 0
IO1B
Text GLabel 5725 3025 0    60   Input ~ 0
IO3A
Text GLabel 5725 2925 0    60   Input ~ 0
IO3B
Text GLabel 5725 3225 0    60   Input ~ 0
IO4A
Text GLabel 5725 3125 0    60   Input ~ 0
IO4B
Text GLabel 5725 2425 0    60   Input ~ 0
IO_LED
Text GLabel 6325 3725 3    60   Input ~ 0
GND
Text GLabel 6225 3725 3    60   Input ~ 0
GND
Wire Wire Line
	5025 2325 5175 2325
Wire Wire Line
	5175 2375 5175 2325
Connection ~ 5175 2325
Wire Wire Line
	5175 2325 5725 2325
Text GLabel 6425 1725 1    60   Input ~ 0
+5V
Text GLabel 12075 5875 0    60   Input ~ 0
Sense4
Text GLabel 12075 2325 0    60   Input ~ 0
Sense1
Text GLabel 12075 3475 0    60   Input ~ 0
Sense2
Text GLabel 12075 1925 0    60   Input ~ 0
IOEN
Text GLabel 12075 3075 0    60   Input ~ 0
IOEN
Text GLabel 12075 4275 0    60   Input ~ 0
IOEN
Text GLabel 12075 3225 0    60   Input ~ 0
IO2A
Text GLabel 12075 2175 0    60   Input ~ 0
IO1B
Text GLabel 12075 3325 0    60   Input ~ 0
IO2B
Text GLabel 12075 2075 0    60   Input ~ 0
IO1A
Text GLabel 12075 4525 0    60   Input ~ 0
IO3B
Text GLabel 12075 4425 0    60   Input ~ 0
IO3A
$Comp
L Device:C C102
U 1 1 5FC68142
P 12600 7200
F 0 "C102" H 12475 7250 50  0000 R CNN
F 1 "100nF" H 12475 7175 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 12638 7050 50  0001 C CNN
F 3 "~" H 12600 7200 50  0001 C CNN
F 4 "FG18X7R1H104KNT00" H 12600 7200 50  0001 C CNN "Part number"
F 5 "445-FG18X7R1H104KNT00-ND" H 12600 7200 50  0001 C CNN "Digikey reference"
F 6 "100nF, 50V X7R, 2.5mm pitch" H 12600 7200 50  0001 C CNN "Description"
F 7 "TDK Corporation" H 12600 7200 50  0001 C CNN "Manufacturer"
	1    12600 7200
	-1   0    0    -1  
$EndComp
Wire Notes Line
	3375 1975 4525 1975
Wire Notes Line
	3375 3125 3375 1975
Wire Notes Line
	4525 3125 3375 3125
Wire Notes Line
	4525 1975 4525 3125
Text Notes 3675 2625 0    39   ~ 0
These resistors connects \nArduino serial port to \nRaspberry PI serial port \nin a safe manner.
Connection ~ 3575 2225
Wire Wire Line
	2725 2225 3575 2225
Wire Wire Line
	3575 2125 2725 2125
Wire Wire Line
	3875 2225 5725 2225
Text GLabel 3575 2825 3    60   Input ~ 0
GND
Wire Wire Line
	5725 2125 3875 2125
$Comp
L Connector_Generic:Conn_01x03 P103
U 1 1 60763419
P 7400 7675
F 0 "P103" H 7400 7875 50  0000 C CNN
F 1 "Ext press" V 7500 7675 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 7400 7675 50  0001 C CNN
F 3 "" H 7400 7675 50  0000 C CNN
F 4 "PRPC003SBAN-M71RC" H 7400 7675 50  0001 C CNN "Part number"
F 5 "2.54mm pitch 3-pin header" H 7400 7675 50  0001 C CNN "Description"
F 6 "Sullins Connector Solutions" H 7400 7675 50  0001 C CNN "Manufacturer"
F 7 "S1111EC-03-ND" H 7400 7675 50  0001 C CNN "Digikey Reference"
F 8 "S1111EC-03-ND" H 7400 7675 50  0001 C CNN "Digikey reference"
	1    7400 7675
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 P104
U 1 1 60771AD7
P 8400 7675
F 0 "P104" H 8400 7875 50  0000 C CNN
F 1 "Ext press" V 8500 7675 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Horizontal" H 8400 7675 50  0001 C CNN
F 3 "" H 8400 7675 50  0000 C CNN
F 4 "PRPC004SBAN-M71RC" H 8400 7675 50  0001 C CNN "Part number"
F 5 "2.54mm pitch 4-pin header" H 8400 7675 50  0001 C CNN "Description"
F 6 "Sullins Connector Solutions" H 8400 7675 50  0001 C CNN "Manufacturer"
F 7 "S1111EC-04-ND" H 8400 7675 50  0001 C CNN "Digikey reference"
	1    8400 7675
	1    0    0    -1  
$EndComp
Text GLabel 8200 7875 0    60   Input ~ 0
GND
Text GLabel 8200 7575 0    60   Input ~ 0
SCL
Text GLabel 8200 7675 0    60   Input ~ 0
SDA
Text GLabel 1125 2425 0    60   Input ~ 0
SCL
Text GLabel 1125 2525 0    60   Input ~ 0
SDA
Text GLabel 1725 1725 1    60   Input ~ 0
+3V3
Text GLabel 1825 1725 1    60   Input ~ 0
+3V3
$Comp
L Connector_Generic:Conn_01x02 2Pscrew102
U 1 1 59CCD414
P 13825 3325
F 0 "2Pscrew102" H 14175 3275 50  0000 C CNN
F 1 "Channel 2" H 14125 3375 50  0000 C CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 13825 3325 50  0001 C CNN
F 3 "" H 13825 3325 50  0000 C CNN
F 4 "691137710002" H 13825 3325 50  0001 C CNN "Part number"
F 5 "732-10955-ND" H 13825 3325 50  0001 C CNN "Digikey reference"
F 6 "2-position terminal block, 12-30 AWG, 5mm pitch" H 13825 3325 50  0001 C CNN "Description"
F 7 "Wurth" H 13825 3325 50  0001 C CNN "Manufacturer"
	1    13825 3325
	1    0    0    1   
$EndComp
Text GLabel 6325 1725 1    60   Input ~ 0
+3V3
Wire Notes Line
	475  5775 10700 5775
Wire Notes Line
	10700 475  10675 475 
Wire Notes Line
	10700 475  10700 11200
Text GLabel 2775 7600 3    60   Input ~ 0
GND
Text GLabel 2675 7600 3    60   Input ~ 0
+Bat1
Text GLabel 2975 7600 3    60   Input ~ 0
+5V
Text GLabel 2875 7600 3    60   Input ~ 0
GND
Text Notes 2600 7300 0    47   ~ 0
Connect 5v regulator here
Text Notes 975  7150 0    47   ~ 0
Connect battery here
Text Notes 650  1075 0    394  ~ 0
Computing
Text Notes 550  6325 0    394  ~ 0
Power in\n
Text Notes 5200 6275 0    394  ~ 0
Sensors
Text Notes 5875 7375 0    47   ~ 0
Pressure
Text Notes 7050 7375 0    47   ~ 0
Temperature
Text Notes 8025 7375 0    47   ~ 0
I2C bus
Text Notes 9375 6725 0    47   ~ 0
Battery level
Text Notes 10975 1050 0    394  ~ 0
Actuators
Text Notes 13400 6825 0    47   ~ 0
Headlights
Wire Wire Line
	13175 7800 13175 7700
Wire Wire Line
	12425 7800 12600 7800
Wire Wire Line
	13375 7025 13175 7025
Wire Wire Line
	12600 6925 12600 7050
Connection ~ 12600 6925
Wire Wire Line
	12600 6925 12225 6925
Wire Wire Line
	12600 7350 12600 7800
Connection ~ 12600 7800
Wire Wire Line
	12600 7800 13175 7800
Text Notes 5925 8150 0    60   ~ 0
Sensor connectors compatible with Adafruit Stemma system.
Text GLabel 5875 7675 0    60   Input ~ 0
+5V
Text GLabel 7200 7675 0    60   Input ~ 0
+5V
Text GLabel 8200 7775 0    60   Input ~ 0
+3V3
$Comp
L Device:R R111
U 1 1 5F76240D
P 9550 8000
F 0 "R111" V 9630 8000 50  0000 C CNN
F 1 "10k" V 9550 8000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 8000 50  0001 C CNN
F 3 "" H 9550 8000 50  0000 C CNN
F 4 "CF14JT10K0" V 9550 8000 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 9550 8000 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 9550 8000 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 9550 8000 50  0001 C CNN "Manufacturer"
	1    9550 8000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R110
U 1 1 59CD15CB
P 9550 7700
F 0 "R110" V 9630 7700 50  0000 C CNN
F 1 "10k" V 9550 7700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 7700 50  0001 C CNN
F 3 "" H 9550 7700 50  0000 C CNN
F 4 "CF14JT10K0" V 9550 7700 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 9550 7700 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 9550 7700 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 9550 7700 50  0001 C CNN "Manufacturer"
	1    9550 7700
	-1   0    0    1   
$EndComp
$Comp
L Device:R R109
U 1 1 59CD11FD
P 9550 7400
F 0 "R109" V 9630 7400 50  0000 C CNN
F 1 "10k" V 9550 7400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 7400 50  0001 C CNN
F 3 "" H 9550 7400 50  0000 C CNN
F 4 "CF14JT10K0" V 9550 7400 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 9550 7400 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 9550 7400 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 9550 7400 50  0001 C CNN "Manufacturer"
	1    9550 7400
	-1   0    0    1   
$EndComp
$Comp
L Edurov:Generic U1
U 1 1 60C9E470
P 3750 10200
F 0 "U1" H 3928 10041 50  0001 L CNN
F 1 "Arduino header" H 3928 9996 50  0001 L CNN
F 2 "" H 3750 10200 50  0001 C CNN
F 3 "" H 3750 10200 50  0001 C CNN
F 4 "15 pin female through-hole header" H 3928 9905 50  0001 L CNN "Description"
F 5 "SSW-115-01-T-S" H 3750 10200 50  0001 C CNN "Part number"
F 6 "SAM1213-15-ND" H 3750 10200 50  0001 C CNN "Digikey reference"
F 7 "Samtec Inc." H 3750 10200 50  0001 C CNN "Manufacturer"
	1    3750 10200
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U5
U 1 1 60CA6BBB
P 900 9800
F 0 "U5" H 1078 9641 50  0001 L CNN
F 1 "Pressure sensor" H 1078 9596 50  0000 L CNN
F 2 "" H 900 9800 50  0001 C CNN
F 3 "" H 900 9800 50  0001 C CNN
F 4 "MPX4250AP 0-250kPa pressure sensor" H 1078 9505 50  0000 L CNN "Description"
F 5 "MPX4250AP" H 900 9800 50  0001 C CNN "Part number"
F 6 "MPX4250AP-ND" H 900 9800 50  0001 C CNN "Digikey reference"
F 7 "NXP" H 900 9800 50  0001 C CNN "Manufacturer"
	1    900  9800
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U4
U 1 1 60CA2DB7
P 900 9400
F 0 "U4" H 1078 9241 50  0001 L CNN
F 1 "Temp sensor" H 1078 9196 50  0000 L CNN
F 2 "" H 900 9400 50  0001 C CNN
F 3 "" H 900 9400 50  0001 C CNN
F 4 "LM35 temperature sensor" H 1078 9105 50  0000 L CNN "Description"
F 5 "LM35DZ/NOPB" H 900 9400 50  0001 C CNN "Part number"
F 6 "LM35DZ/NOPB-ND" H 900 9400 50  0001 C CNN "Digikey reference"
F 7 "Texas Instruments" H 900 9400 50  0001 C CNN "Manufacturer"
	1    900  9400
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U3
U 1 1 60CA2003
P 3750 9400
F 0 "U3" H 3928 9241 50  0001 L CNN
F 1 "Raspberry PI stacking header" H 3928 9196 50  0000 L CNN
F 2 "" H 3750 9400 50  0001 C CNN
F 3 "" H 3750 9400 50  0001 C CNN
F 4 "2x20 female through-hole header with extra long pins for stacking" H 3928 9105 50  0000 L CNN "Description"
F 5 "1979" H 3750 9400 50  0001 C CNN "Part number"
F 6 "1528-1783-ND" H 3750 9400 50  0001 C CNN "Digikey reference"
F 7 "Adafruit Industries LLC" H 3750 9400 50  0001 C CNN "Manufacturer"
	1    3750 9400
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U2
U 1 1 60CA1AFC
P 3775 10225
F 0 "U2" H 3953 10066 50  0001 L CNN
F 1 "Arduino header" H 3953 10021 50  0000 L CNN
F 2 "" H 3775 10225 50  0001 C CNN
F 3 "" H 3775 10225 50  0001 C CNN
F 4 "15 pin female through-hole header" H 3953 9930 50  0000 L CNN "Description"
F 5 "SSW-115-01-T-S" H 3775 10225 50  0001 C CNN "Part number"
F 6 "SAM1213-15-ND" H 3775 10225 50  0001 C CNN "Digikey reference"
F 7 "Samtec Inc." H 3775 10225 50  0001 C CNN "Manufacturer"
	1    3775 10225
	1    0    0    -1  
$EndComp
Text Notes 550  9275 0    394  ~ 0
Extra components
Wire Notes Line
	450  8775 10700 8775
$Comp
L Connector:Raspberry_Pi_2_3 RaspberryPI101
U 1 1 5F72663B
P 1925 3025
F 0 "RaspberryPI101" H 1175 4375 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 1275 4275 50  0000 C CNN
F 2 "EduRov:RaspBerry_PI" H 1925 3025 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 1925 3025 50  0001 C CNN
F 4 "Raspberry PI 3 or 4" H 1925 3025 50  0001 C CNN "Part number"
F 5 "" H 1925 3025 50  0001 C CNN "DigiKey reference"
F 6 "Raspberry PI 3 or 4" H 1925 3025 50  0001 C CNN "Description"
F 7 "1690-RASPBERRYPI4B/4GB-ND" H 1925 3025 50  0001 C CNN "Digikey reference"
F 8 "Raspberry Pi" H 1925 3025 50  0001 C CNN "Manufacturer"
	1    1925 3025
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R101
U 1 1 6015A2BD
P 3575 2375
F 0 "R101" V 3475 2425 50  0000 C CNN
F 1 "10k" V 3575 2375 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3505 2375 50  0001 C CNN
F 3 "" H 3575 2375 50  0000 C CNN
F 4 "CF14JT10K0" V 3575 2375 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 3575 2375 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 3575 2375 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 3575 2375 50  0001 C CNN "Manufacturer"
	1    3575 2375
	1    0    0    1   
$EndComp
$Comp
L Device:R R104
U 1 1 600D04E5
P 3725 2225
F 0 "R104" V 3675 2025 50  0000 C CNN
F 1 "10k" V 3725 2225 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3655 2225 50  0001 C CNN
F 3 "" H 3725 2225 50  0000 C CNN
F 4 "CF14JT10K0" V 3725 2225 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 3725 2225 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 3725 2225 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 3725 2225 50  0001 C CNN "Manufacturer"
	1    3725 2225
	0    -1   1    0   
$EndComp
$Comp
L Device:R R103
U 1 1 600D5188
P 3725 2125
F 0 "R103" V 3775 2325 50  0000 C CNN
F 1 "10k" V 3725 2125 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3655 2125 50  0001 C CNN
F 3 "" H 3725 2125 50  0000 C CNN
F 4 "CF14JT10K0" V 3725 2125 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 3725 2125 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 3725 2125 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 3725 2125 50  0001 C CNN "Manufacturer"
	1    3725 2125
	0    1    -1   0   
$EndComp
$Comp
L Device:R R102
U 1 1 6015AA7F
P 3575 2675
F 0 "R102" V 3475 2725 50  0000 C CNN
F 1 "10k" V 3575 2675 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3505 2675 50  0001 C CNN
F 3 "" H 3575 2675 50  0000 C CNN
F 4 "CF14JT10K0" V 3575 2675 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 3575 2675 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 3575 2675 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 3575 2675 50  0001 C CNN "Manufacturer"
	1    3575 2675
	1    0    0    1   
$EndComp
$Comp
L Device:R R105
U 1 1 59CD3229
P 5175 2525
F 0 "R105" V 5255 2525 50  0000 C CNN
F 1 "10k" V 5175 2525 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5105 2525 50  0001 C CNN
F 3 "" H 5175 2525 50  0000 C CNN
F 4 "CF14JT10K0" V 5175 2525 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 5175 2525 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 5175 2525 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 5175 2525 50  0001 C CNN "Manufacturer"
	1    5175 2525
	1    0    0    1   
$EndComp
$Comp
L Device:R R112
U 1 1 59D35BF6
P 12425 7650
F 0 "R112" V 12505 7650 50  0000 C CNN
F 1 "10k" V 12425 7650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 12355 7650 50  0001 C CNN
F 3 "" H 12425 7650 50  0000 C CNN
F 4 "CF14JT10K0" V 12425 7650 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 12425 7650 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 12425 7650 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 12425 7650 50  0001 C CNN "Manufacturer"
	1    12425 7650
	-1   0    0    1   
$EndComp
$Comp
L Device:R R108
U 1 1 5FB9B542
P 9550 7100
F 0 "R108" V 9630 7100 50  0000 C CNN
F 1 "10k" V 9550 7100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 7100 50  0001 C CNN
F 3 "" H 9550 7100 50  0000 C CNN
F 4 "CF14JT10K0" V 9550 7100 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 9550 7100 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 9550 7100 50  0001 C CNN "Description"
F 7 "Stackpole Electronics Inc" H 9550 7100 50  0001 C CNN "Manufacturer"
	1    9550 7100
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 5vReg101
U 1 1 5F7592EB
P 2775 7400
F 0 "5vReg101" V 2739 7112 50  0000 R CNN
F 1 "Conn_01x04" V 2648 7112 50  0001 R CNN
F 2 "EduRov:iFlight_Micro" H 2775 7400 50  0001 C CNN
F 3 "~" H 2775 7400 50  0001 C CNN
F 4 "Micro" V 2775 7400 50  0001 C CNN "Part number"
F 5 "IF-A006172" V 2775 7400 50  0001 C CNN "Elefun reference"
F 6 "Iflight micro 30V->5V regulator, 2.5A" V 2775 7400 50  0001 C CNN "Description"
F 7 "IFlight" H 2775 7400 50  0001 C CNN "Manufacturer"
	1    2775 7400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1525 8200 1575 8200
Connection ~ 1525 8200
Wire Wire Line
	1575 8200 1575 8250
Wire Wire Line
	1475 8200 1525 8200
Text GLabel 1575 8250 3    60   Input ~ 0
GND
Text GLabel 1475 8200 3    60   Input ~ 0
-Batt
Wire Wire Line
	1225 8000 1225 8200
Text GLabel 1225 8200 3    60   Input ~ 0
+Bat1
$Comp
L Connector_Generic:Conn_01x02 P101
U 1 1 59F0943E
P 1425 7350
F 0 "P101" H 1425 7500 50  0000 C CNN
F 1 "Battery connector" V 1575 7350 50  0000 C CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 1425 7350 50  0001 C CNN
F 3 "" H 1425 7350 50  0000 C CNN
F 4 "691137710002" H 1425 7350 50  0001 C CNN "Part number"
F 5 "732-10955-ND" H 1425 7350 50  0001 C CNN "Digikey reference"
F 6 "2-position terminal block, 12-30 AWG, 5mm pitch" H 1425 7350 50  0001 C CNN "Description"
F 7 "Wurth" H 1425 7350 50  0001 C CNN "Manufacturer"
	1    1425 7350
	0    1    -1   0   
$EndComp
$Comp
L Device:CP C101
U 1 1 600EBD67
P 1375 8000
AR Path="/600EBD67" Ref="C101"  Part="1" 
AR Path="/5FFEC45F/600EBD67" Ref="C?"  Part="1" 
AR Path="/60017CE1/600EBD67" Ref="C?"  Part="1" 
AR Path="/600184A3/600EBD67" Ref="C?"  Part="1" 
AR Path="/60018874/600EBD67" Ref="C?"  Part="1" 
AR Path="/6003A868/600EBD67" Ref="C?"  Part="1" 
AR Path="/6003F027/600EBD67" Ref="C?"  Part="1" 
AR Path="/60043462/600EBD67" Ref="C?"  Part="1" 
F 0 "C101" V 1225 8300 50  0000 C CNN
F 1 "470uF" V 1325 8300 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D12.5mm_P5.00mm" H 1413 7850 50  0001 C CNN
F 3 "~" H 1375 8000 50  0001 C CNN
F 4 "UVR1H471MHD1TO" V 1375 8000 50  0001 C CNN "Part number"
F 5 "493-12789-1-ND" V 1375 8000 50  0001 C CNN "Digikey reference"
F 6 "470uF, 20%, 50V, 5mm pitch" V 1375 8000 50  0001 C CNN "Description"
F 7 "Nichicon" H 1375 8000 50  0001 C CNN "Manufacturer"
	1    1375 8000
	0    -1   -1   0   
$EndComp
$Comp
L Edurov:Generic U8
U 1 1 60CED77A
P 3750 9800
F 0 "U8" H 3928 9641 50  0001 L CNN
F 1 "Jumper wires" H 3928 9596 50  0000 L CNN
F 2 "" H 3750 9800 50  0001 C CNN
F 3 "" H 3750 9800 50  0001 C CNN
F 4 "Cut and use to hook up sensors and headlights" H 3928 9505 50  0000 L CNN "Description"
F 5 "1949" H 3750 9800 50  0001 C CNN "Part number"
F 6 "1528-1960-ND" H 3750 9800 50  0001 C CNN "Digikey reference"
F 7 "Adafruit Industries LLC" H 3750 9800 50  0001 C CNN "Manufacturer"
	1    3750 9800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1425 7550 1525 7550
$Comp
L Edurov:Generic U6
U 1 1 60C94B86
P 900 10200
F 0 "U6" H 1078 10041 50  0001 L CNN
F 1 "Sense hat" H 1078 9996 50  0000 L CNN
F 2 "" H 900 10200 50  0001 C CNN
F 3 "" H 900 10200 50  0001 C CNN
F 4 "Raspberry PI sense hat" H 1078 9905 50  0000 L CNN "Description"
F 5 "SENSE HAT" H 900 10200 50  0001 C CNN "Part number"
F 6 "1690-1013-ND" H 900 10200 50  0001 C CNN "Digikey reference"
F 7 "Raspberry Pi" H 900 10200 50  0001 C CNN "Manufacturer"
	1    900  10200
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U7
U 1 1 60C990EA
P 900 10600
F 0 "U7" H 1078 10441 50  0001 L CNN
F 1 "Camera" H 1078 10396 50  0000 L CNN
F 2 "" H 900 10600 50  0001 C CNN
F 3 "" H 900 10600 50  0001 C CNN
F 4 "Raspberry PI camera" H 1078 10305 50  0000 L CNN "Description"
F 5 "114990838" H 900 10600 50  0001 C CNN "Part number"
F 6 "1597-1427-ND" H 900 10600 50  0001 C CNN "Digikey reference"
F 7 "Seeed Technology Co., Ltd" H 900 10600 50  0001 C CNN "Manufacturer"
	1    900  10600
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U14
U 1 1 60CA78EE
P 6950 10500
F 0 "U14" H 7128 10341 50  0001 L CNN
F 1 "Nut" H 7128 10296 50  0001 L CNN
F 2 "" H 6950 10500 50  0001 C CNN
F 3 "" H 6950 10500 50  0001 C CNN
F 4 "Nylon nut" H 7128 10205 50  0001 L CNN "Description"
F 5 "04M025045HN" H 6950 10500 50  0001 C CNN "Part number"
F 6 "RPC7085-ND" H 6950 10500 50  0001 C CNN "Digikey reference"
F 7 "Essentra Components" H 6950 10500 50  0001 C CNN "Manufacturer"
	1    6950 10500
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U12
U 1 1 60CA78F7
P 6925 9900
F 0 "U12" H 7103 9741 50  0001 L CNN
F 1 "Standoff" H 7103 9696 50  0001 L CNN
F 2 "" H 6925 9900 50  0001 C CNN
F 3 "" H 6925 9900 50  0001 C CNN
F 4 "Hex standoff, M2.5, 16mm long" H 7103 9605 50  0001 L CNN "Description"
F 5 "971160151" H 6925 9900 50  0001 C CNN "Part number"
F 6 "732-10422-ND" H 6925 9900 50  0001 C CNN "Digikey reference"
F 7 "Wurth" H 6925 9900 50  0001 C CNN "Manufacturer"
	1    6925 9900
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U10
U 1 1 60CAE87D
P 6900 10450
F 0 "U10" H 7078 10291 50  0001 L CNN
F 1 "Nut" H 7078 10246 50  0001 L CNN
F 2 "" H 6900 10450 50  0001 C CNN
F 3 "" H 6900 10450 50  0001 C CNN
F 4 "Nylon nut" H 7078 10155 50  0001 L CNN "Description"
F 5 "04M025045HN" H 6900 10450 50  0001 C CNN "Part number"
F 6 "RPC7085-ND" H 6900 10450 50  0001 C CNN "Digikey reference"
F 7 "Essentra Components" H 6900 10450 50  0001 C CNN "Manufacturer"
	1    6900 10450
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U16
U 1 1 60CB3309
P 6975 9950
F 0 "U16" H 7153 9791 50  0001 L CNN
F 1 "Standoff" H 7153 9746 50  0001 L CNN
F 2 "" H 6975 9950 50  0001 C CNN
F 3 "" H 6975 9950 50  0001 C CNN
F 4 "Hex standoff, M2.5, 16mm long" H 7153 9655 50  0001 L CNN "Description"
F 5 "971160151" H 6975 9950 50  0001 C CNN "Part number"
F 6 "732-10422-ND" H 6975 9950 50  0001 C CNN "Digikey reference"
F 7 "Wurth" H 6975 9950 50  0001 C CNN "Manufacturer"
	1    6975 9950
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U20
U 1 1 60CB37AE
P 7025 10000
F 0 "U20" H 7203 9841 50  0001 L CNN
F 1 "Standoff" H 7203 9796 50  0001 L CNN
F 2 "" H 7025 10000 50  0001 C CNN
F 3 "" H 7025 10000 50  0001 C CNN
F 4 "Hex standoff, M2.5, 16mm long" H 7203 9705 50  0001 L CNN "Description"
F 5 "971160151" H 7025 10000 50  0001 C CNN "Part number"
F 6 "732-10422-ND" H 7025 10000 50  0001 C CNN "Digikey reference"
F 7 "Wurth" H 7025 10000 50  0001 C CNN "Manufacturer"
	1    7025 10000
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U24
U 1 1 60CB3BB3
P 7075 10050
F 0 "U24" H 7253 9891 50  0001 L CNN
F 1 "Standoff" H 7253 9846 50  0000 L CNN
F 2 "" H 7075 10050 50  0001 C CNN
F 3 "" H 7075 10050 50  0001 C CNN
F 4 "Hex standoff, M2.5, 16mm long" H 7253 9755 50  0000 L CNN "Description"
F 5 "971160151" H 7075 10050 50  0001 C CNN "Part number"
F 6 "732-10422-ND" H 7075 10050 50  0001 C CNN "Digikey reference"
F 7 "Wurth" H 7075 10050 50  0001 C CNN "Manufacturer"
	1    7075 10050
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U18
U 1 1 60CB81CE
P 7000 10550
F 0 "U18" H 7178 10391 50  0001 L CNN
F 1 "Nut" H 7178 10346 50  0001 L CNN
F 2 "" H 7000 10550 50  0001 C CNN
F 3 "" H 7000 10550 50  0001 C CNN
F 4 "Nylon nut" H 7178 10255 50  0001 L CNN "Description"
F 5 "04M025045HN" H 7000 10550 50  0001 C CNN "Part number"
F 6 "RPC7085-ND" H 7000 10550 50  0001 C CNN "Digikey reference"
F 7 "Essentra Components" H 7000 10550 50  0001 C CNN "Manufacturer"
	1    7000 10550
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U22
U 1 1 60CB8D3D
P 7050 10625
F 0 "U22" H 7228 10466 50  0001 L CNN
F 1 "Nut" H 7228 10421 50  0000 L CNN
F 2 "" H 7050 10625 50  0001 C CNN
F 3 "" H 7050 10625 50  0001 C CNN
F 4 "Nylon nut" H 7228 10330 50  0000 L CNN "Description"
F 5 "04M025045HN" H 7050 10625 50  0001 C CNN "Part number"
F 6 "RPC7085-ND" H 7050 10625 50  0001 C CNN "Digikey reference"
F 7 "Essentra Components" H 7050 10625 50  0001 C CNN "Manufacturer"
	1    7050 10625
	1    0    0    -1  
$EndComp
Wire Notes Line
	4300 5775 4300 8775
$Comp
L Edurov:Generic U23
U 1 1 60D52A1D
P 7075 9500
F 0 "U23" H 7253 9341 50  0001 L CNN
F 1 "Ferrules for motor cables" H 7253 9296 50  0000 L CNN
F 2 "" H 7075 9500 50  0001 C CNN
F 3 "" H 7075 9500 50  0001 C CNN
F 4 "1.5mm2 cable ferrule" H 7253 9205 50  0000 L CNN "Description"
F 5 "FSDX78-8-D" H 7075 9500 50  0001 C CNN "Part number"
F 6 "298-10757-ND" H 7075 9500 50  0001 C CNN "Digikey reference"
F 7 "Panduit Corp" H 7075 9500 50  0001 C CNN "Manufacturer"
	1    7075 9500
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U21
U 1 1 60D53232
P 7050 9475
F 0 "U21" H 7228 9316 50  0001 L CNN
F 1 "Ferrules for motor cables" H 7228 9271 50  0001 L CNN
F 2 "" H 7050 9475 50  0001 C CNN
F 3 "" H 7050 9475 50  0001 C CNN
F 4 "1.5mm2 cable ferrule" H 7228 9180 50  0001 L CNN "Description"
F 5 "FSDX78-8-D" H 7050 9475 50  0001 C CNN "Part number"
F 6 "298-10757-ND" H 7050 9475 50  0001 C CNN "Digikey reference"
F 7 "Panduit Corp" H 7050 9475 50  0001 C CNN "Manufacturer"
	1    7050 9475
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U19
U 1 1 60D55911
P 7025 9450
F 0 "U19" H 7203 9291 50  0001 L CNN
F 1 "Ferrules for motor cables" H 7203 9246 50  0001 L CNN
F 2 "" H 7025 9450 50  0001 C CNN
F 3 "" H 7025 9450 50  0001 C CNN
F 4 "1.5mm2 cable ferrule" H 7203 9155 50  0001 L CNN "Description"
F 5 "FSDX78-8-D" H 7025 9450 50  0001 C CNN "Part number"
F 6 "298-10757-ND" H 7025 9450 50  0001 C CNN "Digikey reference"
F 7 "Panduit Corp" H 7025 9450 50  0001 C CNN "Manufacturer"
	1    7025 9450
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U17
U 1 1 60D55E7F
P 7000 9425
F 0 "U17" H 7178 9266 50  0001 L CNN
F 1 "Ferrules for motor cables" H 7178 9221 50  0001 L CNN
F 2 "" H 7000 9425 50  0001 C CNN
F 3 "" H 7000 9425 50  0001 C CNN
F 4 "1.5mm2 cable ferrule" H 7178 9130 50  0001 L CNN "Description"
F 5 "FSDX78-8-D" H 7000 9425 50  0001 C CNN "Part number"
F 6 "298-10757-ND" H 7000 9425 50  0001 C CNN "Digikey reference"
F 7 "Panduit Corp" H 7000 9425 50  0001 C CNN "Manufacturer"
	1    7000 9425
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U15
U 1 1 60D564CC
P 6975 9400
F 0 "U15" H 7153 9241 50  0001 L CNN
F 1 "Ferrules for motor cables" H 7153 9196 50  0001 L CNN
F 2 "" H 6975 9400 50  0001 C CNN
F 3 "" H 6975 9400 50  0001 C CNN
F 4 "1.5mm2 cable ferrule" H 7153 9105 50  0001 L CNN "Description"
F 5 "FSDX78-8-D" H 6975 9400 50  0001 C CNN "Part number"
F 6 "298-10757-ND" H 6975 9400 50  0001 C CNN "Digikey reference"
F 7 "Panduit Corp" H 6975 9400 50  0001 C CNN "Manufacturer"
	1    6975 9400
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U13
U 1 1 60D5689F
P 6950 9375
F 0 "U13" H 7128 9216 50  0001 L CNN
F 1 "Ferrules for motor cables" H 7128 9171 50  0001 L CNN
F 2 "" H 6950 9375 50  0001 C CNN
F 3 "" H 6950 9375 50  0001 C CNN
F 4 "1.5mm2 cable ferrule" H 7128 9080 50  0001 L CNN "Description"
F 5 "FSDX78-8-D" H 6950 9375 50  0001 C CNN "Part number"
F 6 "298-10757-ND" H 6950 9375 50  0001 C CNN "Digikey reference"
F 7 "Panduit Corp" H 6950 9375 50  0001 C CNN "Manufacturer"
	1    6950 9375
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U11
U 1 1 60D56A60
P 6925 9350
F 0 "U11" H 7103 9191 50  0001 L CNN
F 1 "Ferrules for motor cables" H 7103 9146 50  0001 L CNN
F 2 "" H 6925 9350 50  0001 C CNN
F 3 "" H 6925 9350 50  0001 C CNN
F 4 "1.5mm2 cable ferrule" H 7103 9055 50  0001 L CNN "Description"
F 5 "FSDX78-8-D" H 6925 9350 50  0001 C CNN "Part number"
F 6 "298-10757-ND" H 6925 9350 50  0001 C CNN "Digikey reference"
F 7 "Panduit Corp" H 6925 9350 50  0001 C CNN "Manufacturer"
	1    6925 9350
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U9
U 1 1 60D56C43
P 6900 9325
F 0 "U9" H 7078 9166 50  0001 L CNN
F 1 "Ferrules for motor cables" H 7078 9121 50  0001 L CNN
F 2 "" H 6900 9325 50  0001 C CNN
F 3 "" H 6900 9325 50  0001 C CNN
F 4 "1.5mm2 cable ferrule" H 7078 9030 50  0001 L CNN "Description"
F 5 "FSDX78-8-D" H 6900 9325 50  0001 C CNN "Part number"
F 6 "298-10757-ND" H 6900 9325 50  0001 C CNN "Digikey reference"
F 7 "Panduit Corp" H 6900 9325 50  0001 C CNN "Manufacturer"
	1    6900 9325
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F1
U 1 1 60DA2F6D
P 1225 7700
F 0 "F1" H 1285 7746 50  0000 L CNN
F 1 "Fuse" H 1285 7655 50  0000 L CNN
F 2 "Fuse:Fuseholder_Blade_Mini_Keystone_3568" V 1155 7700 50  0001 C CNN
F 3 "~" H 1225 7700 50  0001 C CNN
F 4 "Miniature fuse holder " H 1225 7700 50  0001 C CNN "Description"
F 5 "36-3568-ND" H 1225 7700 50  0001 C CNN "Digikey reference"
F 6 "3568" H 1225 7700 50  0001 C CNN "MPN"
F 7 "Keystone Electronics" H 1225 7700 50  0001 C CNN "Manufacturer"
F 8 "3568" H 1225 7700 50  0001 C CNN "Part number"
	1    1225 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1525 8000 1525 8200
Wire Wire Line
	1225 7850 1225 8000
Connection ~ 1225 8000
Wire Wire Line
	1525 7550 1525 8000
Connection ~ 1525 8000
Wire Wire Line
	1225 7550 1325 7550
$Comp
L Connector_Generic:Conn_01x02 P105
U 1 1 60DD0F84
P 13575 7025
F 0 "P105" H 13550 7125 50  0000 C CNN
F 1 "HeadLight" H 13675 7200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 13575 7025 50  0001 C CNN
F 3 "" H 13575 7025 50  0000 C CNN
F 4 "PRPC002SAAN-RC" H 13575 7025 50  0001 C CNN "Part number"
F 5 "S1011EC-02-ND" H 13575 7025 50  0001 C CNN "Digikey reference"
F 6 "2.54mm pitch 2-pin header" H 13575 7025 50  0001 C CNN "Description"
F 7 "Sullins Connector Solutions" H 13575 7025 50  0001 C CNN "Manufacturer"
	1    13575 7025
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P106
U 1 1 60DD216D
P 14000 7025
F 0 "P106" H 13950 7125 50  0000 C CNN
F 1 "HeadLight" H 14100 7200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 14000 7025 50  0001 C CNN
F 3 "" H 14000 7025 50  0000 C CNN
F 4 "PRPC002SAAN-RC" H 14000 7025 50  0001 C CNN "Part number"
F 5 "S1011EC-02-ND" H 14000 7025 50  0001 C CNN "Digikey reference"
F 6 "2.54mm pitch 2-pin header" H 14000 7025 50  0001 C CNN "Description"
F 7 "Sullins Connector Solutions" H 14000 7025 50  0001 C CNN "Manufacturer"
	1    14000 7025
	1    0    0    1   
$EndComp
Wire Wire Line
	13375 6925 13800 6925
Connection ~ 13375 6925
Wire Wire Line
	13375 7025 13800 7025
Connection ~ 13375 7025
Wire Wire Line
	12600 6925 13375 6925
Wire Wire Line
	13175 7025 13175 7300
Text Label 13175 7025 0    50   ~ 0
LED-
$Comp
L Edurov:Generic U25
U 1 1 60E0ECB6
P 3750 10600
F 0 "U25" H 3928 10441 50  0001 L CNN
F 1 "Micro SD Card" H 3928 10396 50  0000 L CNN
F 2 "" H 3750 10600 50  0001 C CNN
F 3 "" H 3750 10600 50  0001 C CNN
F 4 "16GB micro SD card with NOOBS installed" H 3928 10305 50  0000 L CNN "Description"
F 5 "SC0252F" H 3750 10600 50  0001 C CNN "Part number"
F 6 "2648-SC0252F-ND" H 3750 10600 50  0001 C CNN "Digikey reference"
F 7 "Raspberry Pi" H 3750 10600 50  0001 C CNN "Manufacturer"
	1    3750 10600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
