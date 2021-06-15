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
P 6075 9500
F 0 "P102" H 6075 9700 50  0000 C CNN
F 1 "Ext press" V 6175 9500 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B3B-PH-K_1x03_P2.00mm_Vertical" H 6075 9500 50  0001 C CNN
F 3 "" H 6075 9500 50  0000 C CNN
	1    6075 9500
	1    0    0    -1  
$EndComp
Text GLabel 7200 9600 0    60   Input ~ 0
GND
Text GLabel 5875 9600 0    60   Input ~ 0
GND
Text GLabel 9600 8725 2    60   Input ~ 0
+Bat1
Text GLabel 9550 9675 0    60   Input ~ 0
BattMonitor
Text GLabel 7200 9400 0    60   Input ~ 0
TempMonitor
Text GLabel 5875 9400 0    60   Input ~ 0
PressMonitor
$Comp
L Connector_Generic:Conn_01x02 2Pscrew103
U 1 1 59CD3D3E
P 13825 4525
F 0 "2Pscrew103" H 14175 4475 50  0000 C CNN
F 1 "Channel 3" H 14125 4575 50  0000 C CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 13825 4525 50  0001 C CNN
F 3 "" H 13825 4525 50  0000 C CNN
	1    13825 4525
	1    0    0    1   
$EndComp
Text GLabel 12225 7500 0    60   Input ~ 0
IO_LED
Text GLabel 12225 7800 0    60   Input ~ 0
GND
$Comp
L Connector_Generic:Conn_01x04 P105
U 1 1 59D3A8DC
P 13575 7025
F 0 "P105" H 13750 7025 50  0000 C CNN
F 1 "Ch LED" H 13800 6950 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 13575 7025 50  0001 C CNN
F 3 "" H 13575 7025 50  0000 C CNN
	1    13575 7025
	1    0    0    -1  
$EndComp
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
	1    13075 7500
	1    0    0    -1  
$EndComp
Text GLabel 9600 10025 2    60   Input ~ 0
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
	9600 8725 9550 8725
Wire Wire Line
	9550 8725 9550 8775
Wire Wire Line
	9550 9975 9550 10025
Wire Wire Line
	9550 10025 9600 10025
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
P 7400 9500
F 0 "P103" H 7400 9700 50  0000 C CNN
F 1 "Ext press" V 7500 9500 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B3B-PH-K_1x03_P2.00mm_Vertical" H 7400 9500 50  0001 C CNN
F 3 "" H 7400 9500 50  0000 C CNN
	1    7400 9500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 P104
U 1 1 60771AD7
P 8400 9500
F 0 "P104" H 8400 9700 50  0000 C CNN
F 1 "Ext press" V 8500 9500 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 8400 9500 50  0001 C CNN
F 3 "" H 8400 9500 50  0000 C CNN
	1    8400 9500
	1    0    0    -1  
$EndComp
Text GLabel 8200 9700 0    60   Input ~ 0
GND
Text GLabel 8200 9400 0    60   Input ~ 0
SCL
Text GLabel 8200 9500 0    60   Input ~ 0
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
	1    13825 3325
	1    0    0    1   
$EndComp
Text GLabel 6325 1725 1    60   Input ~ 0
+3V3
Wire Notes Line
	475  7600 10700 7600
Wire Notes Line
	10700 475  10675 475 
Wire Notes Line
	10700 475  10700 11200
Text GLabel 2775 9425 3    60   Input ~ 0
GND
Text GLabel 2675 9425 3    60   Input ~ 0
+Bat1
Text GLabel 2975 9425 3    60   Input ~ 0
+5V
Text GLabel 2875 9425 3    60   Input ~ 0
GND
Text Notes 2625 9125 0    47   ~ 0
Connect 5v regulator here
Text Notes 1025 9060 0    47   ~ 0
Connect battery here
Text Notes 650  1075 0    394  ~ 0
Computing
Text Notes 550  8150 0    394  ~ 0
Power in\n
Text Notes 5200 8100 0    394  ~ 0
Sensors
Wire Notes Line
	4750 7600 4750 11225
Text Notes 5875 9200 0    47   ~ 0
Pressure
Text Notes 7050 9200 0    47   ~ 0
Temperature
Text Notes 8025 9200 0    47   ~ 0
I2C bus
Text Notes 9375 8550 0    47   ~ 0
Battery level
Text Notes 10975 1050 0    394  ~ 0
Actuators
Text Notes 11200 6600 0    47   ~ 0
Headlights
Wire Wire Line
	13175 7800 13175 7700
Wire Wire Line
	12425 7800 12600 7800
Wire Wire Line
	13375 7225 13175 7225
Wire Wire Line
	13175 7225 13175 7300
Wire Wire Line
	13375 7025 13175 7025
Wire Wire Line
	13175 7025 13175 7225
Connection ~ 13175 7225
Wire Wire Line
	13375 6925 13275 6925
Wire Wire Line
	13375 7125 13275 7125
Wire Wire Line
	13275 7125 13275 6925
Connection ~ 13275 6925
Wire Wire Line
	13275 6925 12600 6925
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
Text GLabel 13175 7025 0    60   Input ~ 0
LED-
Text Notes 5925 9975 0    60   ~ 0
Sensor connectors compatible with Adafruit Stemma system.
Text GLabel 5875 9500 0    60   Input ~ 0
+5V
Text GLabel 7200 9500 0    60   Input ~ 0
+5V
Text GLabel 8200 9600 0    60   Input ~ 0
+3V3
$Comp
L Device:R R111
U 1 1 5F76240D
P 9550 9825
F 0 "R111" V 9630 9825 50  0000 C CNN
F 1 "10k" V 9550 9825 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 9825 50  0001 C CNN
F 3 "" H 9550 9825 50  0000 C CNN
F 4 "CF14JT10K0" V 9550 9825 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 9550 9825 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 9550 9825 50  0001 C CNN "Description"
	1    9550 9825
	-1   0    0    1   
$EndComp
$Comp
L Device:R R110
U 1 1 59CD15CB
P 9550 9525
F 0 "R110" V 9630 9525 50  0000 C CNN
F 1 "10k" V 9550 9525 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 9525 50  0001 C CNN
F 3 "" H 9550 9525 50  0000 C CNN
F 4 "CF14JT10K0" V 9550 9525 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 9550 9525 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 9550 9525 50  0001 C CNN "Description"
	1    9550 9525
	-1   0    0    1   
$EndComp
$Comp
L Device:R R109
U 1 1 59CD11FD
P 9550 9225
F 0 "R109" V 9630 9225 50  0000 C CNN
F 1 "10k" V 9550 9225 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 9225 50  0001 C CNN
F 3 "" H 9550 9225 50  0000 C CNN
F 4 "CF14JT10K0" V 9550 9225 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 9550 9225 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 9550 9225 50  0001 C CNN "Description"
	1    9550 9225
	-1   0    0    1   
$EndComp
$Comp
L Edurov:Generic U1
U 1 1 60C9E470
P 800 6500
F 0 "U1" H 978 6341 50  0001 L CNN
F 1 "Arduino header" H 978 6296 50  0000 L CNN
F 2 "" H 800 6500 50  0001 C CNN
F 3 "" H 800 6500 50  0001 C CNN
F 4 "15 pin female through-hole header" H 978 6205 50  0000 L CNN "Description"
F 5 "SSW-115-01-T-S" H 800 6500 50  0001 C CNN "Part number"
F 6 "SAM1213-15-ND" H 800 6500 50  0001 C CNN "Digikey reference"
	1    800  6500
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U5
U 1 1 60CA6BBB
P 6350 6900
F 0 "U5" H 6528 6741 50  0001 L CNN
F 1 "Pressure sensor" H 6528 6696 50  0000 L CNN
F 2 "" H 6350 6900 50  0001 C CNN
F 3 "" H 6350 6900 50  0001 C CNN
F 4 "MPX4250AP 0-250kPa pressure sensor" H 6528 6605 50  0000 L CNN "Description"
F 5 "MPX4250AP" H 6350 6900 50  0001 C CNN "Part number"
F 6 "MPX4250AP-ND" H 6350 6900 50  0001 C CNN "Digikey reference"
	1    6350 6900
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U4
U 1 1 60CA2DB7
P 6350 6500
F 0 "U4" H 6528 6341 50  0001 L CNN
F 1 "Temp sensor" H 6528 6296 50  0000 L CNN
F 2 "" H 6350 6500 50  0001 C CNN
F 3 "" H 6350 6500 50  0001 C CNN
F 4 "LM35 temperature sensor" H 6528 6205 50  0000 L CNN "Description"
F 5 "LM35DZ/NOPB" H 6350 6500 50  0001 C CNN "Part number"
F 6 "LM35DZ/NOPB-ND" H 6350 6500 50  0001 C CNN "Digikey reference"
	1    6350 6500
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U3
U 1 1 60CA2003
P 2950 6500
F 0 "U3" H 3128 6341 50  0001 L CNN
F 1 "Raspberry PI stacking header" H 3128 6296 50  0000 L CNN
F 2 "" H 2950 6500 50  0001 C CNN
F 3 "" H 2950 6500 50  0001 C CNN
F 4 "2x20 female through-hole header with extra long pins for stacking" H 3128 6205 50  0000 L CNN "Description"
F 5 "1979" H 2950 6500 50  0001 C CNN "Part number"
F 6 "1528-1783-ND" H 2950 6500 50  0001 C CNN "Digikey reference"
	1    2950 6500
	1    0    0    -1  
$EndComp
$Comp
L Edurov:Generic U2
U 1 1 60CA1AFC
P 800 6900
F 0 "U2" H 978 6741 50  0001 L CNN
F 1 "Arduino header" H 978 6696 50  0000 L CNN
F 2 "" H 800 6900 50  0001 C CNN
F 3 "" H 800 6900 50  0001 C CNN
F 4 "15 pin female through-hole header" H 978 6605 50  0000 L CNN "Description"
F 5 "SSW-115-01-T-S" H 800 6900 50  0001 C CNN "Part number"
F 6 "SAM1213-15-ND" H 800 6900 50  0001 C CNN "Digikey reference"
	1    800  6900
	1    0    0    -1  
$EndComp
Text Notes 550  6300 0    394  ~ 0
Extra components
Wire Notes Line
	450  5800 10700 5800
$Comp
L Connector:Raspberry_Pi_2_3 RaspberryPI101
U 1 1 5F72663B
P 1925 3025
F 0 "RaspberryPI101" H 1175 4375 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 1275 4275 50  0000 C CNN
F 2 "EduRov:RaspBerry_PI" H 1925 3025 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 1925 3025 50  0001 C CNN
F 4 "Raspberry PI 3 or 4" H 1925 3025 50  0001 C CNN "Part number"
F 5 "1690-RASPBERRYPI4B/4GB-ND" H 1925 3025 50  0001 C CNN "DigiKey reference"
F 6 "Raspberry PI 3 or 4" H 1925 3025 50  0001 C CNN "Description"
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
	1    12425 7650
	-1   0    0    1   
$EndComp
$Comp
L Device:R R108
U 1 1 5FB9B542
P 9550 8925
F 0 "R108" V 9630 8925 50  0000 C CNN
F 1 "10k" V 9550 8925 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9480 8925 50  0001 C CNN
F 3 "" H 9550 8925 50  0000 C CNN
F 4 "CF14JT10K0" V 9550 8925 50  0001 C CNN "Part number"
F 5 "CF14JT10K0CT-ND" V 9550 8925 50  0001 C CNN "Digikey reference"
F 6 "10k Ohm, 1/4W, 5%" V 9550 8925 50  0001 C CNN "Description"
	1    9550 8925
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 5vReg101
U 1 1 5F7592EB
P 2775 9225
F 0 "5vReg101" V 2739 8937 50  0000 R CNN
F 1 "Conn_01x04" V 2648 8937 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 2775 9225 50  0001 C CNN
F 3 "~" H 2775 9225 50  0001 C CNN
F 4 "Micro" V 2775 9225 50  0001 C CNN "Part number"
F 5 "IF-A006172" V 2775 9225 50  0001 C CNN "Elefun reference"
F 6 "Iflight micro 30V->5V regulator, 2.5A" V 2775 9225 50  0001 C CNN "Description"
	1    2775 9225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1525 9725 1575 9725
Connection ~ 1525 9725
Wire Wire Line
	1225 9375 1325 9375
Wire Wire Line
	1575 9725 1575 9775
Wire Wire Line
	1475 9725 1525 9725
Text GLabel 1575 9775 3    60   Input ~ 0
GND
Text GLabel 1475 9725 3    60   Input ~ 0
-Batt
Connection ~ 1475 9375
Connection ~ 1225 9525
Wire Wire Line
	1475 9375 1425 9375
Wire Wire Line
	1525 9375 1475 9375
Connection ~ 1525 9525
Wire Wire Line
	1525 9725 1525 9525
Wire Wire Line
	1525 9525 1525 9375
Wire Wire Line
	1225 9525 1225 9375
Wire Wire Line
	1225 9525 1225 9725
Text GLabel 1225 9725 3    60   Input ~ 0
+Bat1
$Comp
L Connector_Generic:Conn_01x02 P101
U 1 1 59F0943E
P 1325 9175
F 0 "P101" H 1325 9325 50  0000 C CNN
F 1 "Battery connector" V 1425 9175 50  0000 C CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 1325 9175 50  0001 C CNN
F 3 "" H 1325 9175 50  0000 C CNN
F 4 "691137710002" H 1325 9175 50  0001 C CNN "Part number"
F 5 "732-10955-ND" H 1325 9175 50  0001 C CNN "Digikey reference"
F 6 "2-position terminal block, 12-30 AWG, 5mm pitch" H 1325 9175 50  0001 C CNN "Description"
	1    1325 9175
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C101
U 1 1 600EBD67
P 1375 9525
AR Path="/600EBD67" Ref="C101"  Part="1" 
AR Path="/5FFEC45F/600EBD67" Ref="C?"  Part="1" 
AR Path="/60017CE1/600EBD67" Ref="C?"  Part="1" 
AR Path="/600184A3/600EBD67" Ref="C?"  Part="1" 
AR Path="/60018874/600EBD67" Ref="C?"  Part="1" 
AR Path="/6003A868/600EBD67" Ref="C?"  Part="1" 
AR Path="/6003F027/600EBD67" Ref="C?"  Part="1" 
AR Path="/60043462/600EBD67" Ref="C?"  Part="1" 
F 0 "C101" V 1225 9825 50  0000 C CNN
F 1 "470uF" V 1325 9825 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D12.5mm_P5.00mm" H 1413 9375 50  0001 C CNN
F 3 "~" H 1375 9525 50  0001 C CNN
F 4 "UVR1H471MHD1TO" V 1375 9525 50  0001 C CNN "Part number"
F 5 "493-12789-1-ND" V 1375 9525 50  0001 C CNN "Digikey reference"
F 6 "470uF, 20%, 50V, 5mm pitch" V 1375 9525 50  0001 C CNN "Description"
	1    1375 9525
	0    1    1    0   
$EndComp
$Comp
L Edurov:Generic U?
U 1 1 60CED77A
P 2950 6900
F 0 "U?" H 3128 6741 50  0001 L CNN
F 1 "JST Connector kit" H 3128 6696 50  0000 L CNN
F 2 "" H 2950 6900 50  0001 C CNN
F 3 "" H 2950 6900 50  0001 C CNN
F 4 "JST PH connectors and crimps" H 3128 6605 50  0000 L CNN "Description"
F 5 "FIT0299" H 2950 6900 50  0001 C CNN "Part number"
F 6 "1738-1305-ND" H 2950 6900 50  0001 C CNN "Digikey reference"
	1    2950 6900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
