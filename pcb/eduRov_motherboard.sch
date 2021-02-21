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
Text GLabel 1200 1650 3    60   Input ~ 0
+Bat1
$Comp
L eduROV_motherboard:CONN_01X03-eduRov_motherboard-rescue P103
U 1 1 59CD072D
P 14850 6400
F 0 "P103" H 14850 6600 50  0000 C CNN
F 1 "Ext temp" V 14950 6400 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-3_P5.00mm" H 14850 6400 50  0001 C CNN
F 3 "" H 14850 6400 50  0000 C CNN
	1    14850 6400
	1    0    0    -1  
$EndComp
$Comp
L eduROV_motherboard:CONN_01X03-eduRov_motherboard-rescue P102
U 1 1 59CD089E
P 14850 5950
F 0 "P102" H 14850 6150 50  0000 C CNN
F 1 "Ext press" V 14950 5950 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-3_P5.00mm" H 14850 5950 50  0001 C CNN
F 3 "" H 14850 5950 50  0000 C CNN
	1    14850 5950
	1    0    0    -1  
$EndComp
Text GLabel 14650 6500 0    60   Input ~ 0
GND
Text GLabel 14650 6050 0    60   Input ~ 0
GND
Text GLabel 14600 4250 2    60   Input ~ 0
+Bat1
$Comp
L Device:R R110
U 1 1 59CD15CB
P 14550 5050
F 0 "R110" V 14630 5050 50  0000 C CNN
F 1 "10k" V 14550 5050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 14480 5050 50  0001 C CNN
F 3 "" H 14550 5050 50  0000 C CNN
	1    14550 5050
	-1   0    0    1   
$EndComp
Text GLabel 14550 5200 0    60   Input ~ 0
BattMonitor
Text GLabel 14650 6400 0    60   Input ~ 0
TempMonitor
Text GLabel 14650 5950 0    60   Input ~ 0
PressMonitor
$Comp
L eduROV_motherboard:CONN_01X02-eduRov_motherboard-rescue 2Pscrew103
U 1 1 59CD3D3E
P 12600 4700
F 0 "2Pscrew103" H 12950 4650 50  0000 C CNN
F 1 "Channel 3" H 12900 4750 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-2_P5.00mm" H 12600 4700 50  0001 C CNN
F 3 "" H 12600 4700 50  0000 C CNN
	1    12600 4700
	1    0    0    -1  
$EndComp
Text GLabel 13950 7500 0    60   Input ~ 0
IO_LED
$Comp
L Device:R R107
U 1 1 59D35BF6
P 14150 7650
F 0 "R107" V 14230 7650 50  0000 C CNN
F 1 "10k" V 14150 7650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 14080 7650 50  0001 C CNN
F 3 "" H 14150 7650 50  0000 C CNN
	1    14150 7650
	-1   0    0    1   
$EndComp
Text GLabel 13950 7800 0    60   Input ~ 0
GND
$Comp
L eduROV_motherboard:CONN_01X02-eduRov_motherboard-rescue 2Pscrew105
U 1 1 59D3A8DC
P 15000 8050
F 0 "2Pscrew105" H 15000 8200 50  0000 C CNN
F 1 "Ch LED" V 15100 8050 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-2_P5.00mm" H 15000 8050 50  0001 C CNN
F 3 "" H 15000 8050 50  0000 C CNN
	1    15000 8050
	1    0    0    -1  
$EndComp
Text GLabel 13950 8100 0    60   Input ~ 0
+Bat1
$Comp
L eduROV_motherboard:CONN_01X02-eduRov_motherboard-rescue P101
U 1 1 59F0943E
P 1350 1100
F 0 "P101" H 1350 1250 50  0000 C CNN
F 1 "Battery connector" V 1450 1100 50  0000 C CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 1350 1100 50  0001 C CNN
F 3 "" H 1350 1100 50  0000 C CNN
	1    1350 1100
	0    -1   -1   0   
$EndComp
$Comp
L eduROV_motherboard:IRL540NPBF-eduRov_motherboard-rescue Q101
U 1 1 5A60C2A4
P 14600 7700
F 0 "Q101" H 14850 7775 50  0000 L CNN
F 1 "IRL540NPBF" H 14850 7700 50  0001 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 14850 7625 50  0001 L CIN
F 3 "" H 14600 7700 50  0001 L CNN
	1    14600 7700
	0    1    1    0   
$EndComp
Text GLabel 1450 1650 3    60   Input ~ 0
-Batt
Text Notes 1000 935  0    47   ~ 0
Connect battery here
Text GLabel 14600 5550 2    60   Input ~ 0
-Batt
Text Notes 2600 1000 0    47   ~ 0
Connect 5v regulator here
Text Notes 12155 10350 0    59   ~ 0
PCB is made with 2oz copper layer due to cross-section requirement
Text GLabel 1550 1700 3    60   Input ~ 0
GND
$Comp
L Connector:Raspberry_Pi_2_3 RaspberryPI101
U 1 1 5F72663B
P 2450 5250
F 0 "RaspberryPI101" H 1700 6600 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 1800 6500 50  0000 C CNN
F 2 "EduROV:RaspBerry_PI" H 2450 5250 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 2450 5250 50  0001 C CNN
	1    2450 5250
	-1   0    0    -1  
$EndComp
Text GLabel 2650 3950 1    60   Input ~ 0
+5V
Text GLabel 2550 3950 1    60   Input ~ 0
+5V
Text GLabel 2500 6700 3    60   Input ~ 0
GND
Wire Wire Line
	2850 6550 2850 6650
Wire Wire Line
	2850 6650 2750 6650
Wire Wire Line
	2500 6650 2500 6700
Wire Wire Line
	2750 6550 2750 6650
Connection ~ 2750 6650
Wire Wire Line
	2750 6650 2650 6650
Connection ~ 2650 6650
Wire Wire Line
	2650 6650 2550 6650
Wire Wire Line
	2550 6550 2550 6650
Connection ~ 2550 6650
Wire Wire Line
	2550 6650 2500 6650
Wire Wire Line
	2450 6550 2450 6650
Wire Wire Line
	2450 6650 2500 6650
Connection ~ 2500 6650
Wire Wire Line
	2450 6650 2350 6650
Wire Wire Line
	2350 6650 2350 6550
Connection ~ 2450 6650
Wire Wire Line
	2350 6650 2250 6650
Wire Wire Line
	2250 6650 2250 6550
Connection ~ 2350 6650
Wire Wire Line
	2250 6650 2150 6650
Wire Wire Line
	2150 6650 2150 6550
Connection ~ 2250 6650
Wire Wire Line
	1450 1650 1500 1650
Wire Wire Line
	1550 1650 1550 1700
$Comp
L Connector_Generic:Conn_01x04 5vReg101
U 1 1 5F7592EB
P 2750 1100
F 0 "5vReg101" V 2714 812 50  0000 R CNN
F 1 "Conn_01x04" V 2623 812 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 2750 1100 50  0001 C CNN
F 3 "~" H 2750 1100 50  0001 C CNN
	1    2750 1100
	0    -1   -1   0   
$EndComp
Text GLabel 2850 1300 3    60   Input ~ 0
GND
Text GLabel 2950 1300 3    60   Input ~ 0
+5V
Text GLabel 2650 1300 3    60   Input ~ 0
+Bat1
Text GLabel 2750 1300 3    60   Input ~ 0
GND
$Comp
L Device:R R111
U 1 1 5F76240D
P 14550 5350
F 0 "R111" V 14630 5350 50  0000 C CNN
F 1 "10k" V 14550 5350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 14480 5350 50  0001 C CNN
F 3 "" H 14550 5350 50  0000 C CNN
	1    14550 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R109
U 1 1 59CD11FD
P 14550 4750
F 0 "R109" V 14630 4750 50  0000 C CNN
F 1 "10k" V 14550 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 14480 4750 50  0001 C CNN
F 3 "" H 14550 4750 50  0000 C CNN
	1    14550 4750
	-1   0    0    1   
$EndComp
Wire Wire Line
	14600 4250 14550 4250
Wire Wire Line
	14550 4250 14550 4300
Wire Wire Line
	14550 5500 14550 5550
Wire Wire Line
	14550 5550 14600 5550
Wire Wire Line
	2650 6550 2650 6650
Text GLabel 10850 5850 0    60   Input ~ 0
IO4A
Text GLabel 10850 5950 0    60   Input ~ 0
IO4B
$Comp
L Device:R R105
U 1 1 59CD3229
P 5700 4750
F 0 "R105" V 5780 4750 50  0000 C CNN
F 1 "10k" V 5700 4750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5630 4750 50  0001 C CNN
F 3 "" H 5700 4750 50  0000 C CNN
	1    5700 4750
	1    0    0    1   
$EndComp
Text GLabel 5700 4900 3    60   Input ~ 0
GND
Text GLabel 10850 5700 0    60   Input ~ 0
IOEN
Wire Wire Line
	14800 7800 14800 8000
Text GLabel 7250 5450 2    60   Input ~ 0
BattMonitor
Text GLabel 7250 5550 2    60   Input ~ 0
PressMonitor
Text GLabel 7250 5650 2    60   Input ~ 0
TempMonitor
$Comp
L Device:R R108
U 1 1 5FB9B542
P 14550 4450
F 0 "R108" V 14630 4450 50  0000 C CNN
F 1 "10k" V 14550 4450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 14480 4450 50  0001 C CNN
F 3 "" H 14550 4450 50  0000 C CNN
	1    14550 4450
	-1   0    0    1   
$EndComp
Text GLabel 14650 6300 0    60   Input ~ 0
+5V
Text GLabel 14650 5850 0    60   Input ~ 0
+5V
Wire Wire Line
	13950 8100 14150 8100
Connection ~ 14150 8100
Wire Wire Line
	14150 8100 14800 8100
Wire Wire Line
	13950 7800 14150 7800
Connection ~ 14150 7800
Wire Wire Line
	14150 7800 14400 7800
Wire Wire Line
	13950 7500 14150 7500
Connection ~ 14150 7500
Wire Wire Line
	14150 7500 14600 7500
Text Label 12000 4650 0    60   ~ 0
Mot3+
Text Label 12000 4750 0    60   ~ 0
Mot3-
$Comp
L eduROV_motherboard:CONN_01X02-eduRov_motherboard-rescue 2Pscrew102
U 1 1 59CCD414
P 12600 3500
F 0 "2Pscrew102" H 12950 3450 50  0000 C CNN
F 1 "Channel 2" H 12900 3550 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-2_P5.00mm" H 12600 3500 50  0001 C CNN
F 3 "" H 12600 3500 50  0000 C CNN
	1    12600 3500
	1    0    0    -1  
$EndComp
$Comp
L eduROV_motherboard:CONN_01X02-eduRov_motherboard-rescue 2Pscrew101
U 1 1 59CD3B58
P 12600 2350
F 0 "2Pscrew101" H 12950 2300 50  0000 C CNN
F 1 "Channel 1" H 12900 2400 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-2_P5.00mm" H 12600 2350 50  0001 C CNN
F 3 "" H 12600 2350 50  0000 C CNN
	1    12600 2350
	1    0    0    -1  
$EndComp
$Sheet
S 10850 5550 1050 700 
U 5FFEC45F
F0 "MotorController_4" 60
F1 "MotorController.sch" 60
F2 "ENABLE" I L 10850 5700 60 
F3 "IN1" I L 10850 5850 60 
F4 "IN2" I L 10850 5950 60 
F5 "SENSE" I L 10850 6100 60 
F6 "GND" I R 11900 6100 60 
F7 "+Bat" I R 11900 5700 60 
F8 "MOT+" I R 11900 5850 60 
F9 "MOT-" I R 11900 5950 60 
$EndSheet
Text GLabel 11900 6100 2    60   Input ~ 0
GND
Text GLabel 11900 5700 2    60   Input ~ 0
+Bat1
Text GLabel 10850 4900 0    60   Input ~ 0
Sense3
$Sheet
S 10850 4350 1050 700 
U 6003A868
F0 "MotorController_3" 60
F1 "MotorController.sch" 60
F2 "ENABLE" I L 10850 4500 60 
F3 "IN1" I L 10850 4650 60 
F4 "IN2" I L 10850 4750 60 
F5 "SENSE" I L 10850 4900 60 
F6 "GND" I R 11900 4900 60 
F7 "+Bat" I R 11900 4500 60 
F8 "MOT+" I R 11900 4650 60 
F9 "MOT-" I R 11900 4750 60 
$EndSheet
Text GLabel 11900 4900 2    60   Input ~ 0
GND
Text GLabel 11900 4500 2    60   Input ~ 0
+Bat1
$Sheet
S 10850 3150 1050 700 
U 6003F027
F0 "MotorController_2" 60
F1 "MotorController.sch" 60
F2 "ENABLE" I L 10850 3300 60 
F3 "IN1" I L 10850 3450 60 
F4 "IN2" I L 10850 3550 60 
F5 "SENSE" I L 10850 3700 60 
F6 "GND" I R 11900 3700 60 
F7 "+Bat" I R 11900 3300 60 
F8 "MOT+" I R 11900 3450 60 
F9 "MOT-" I R 11900 3550 60 
$EndSheet
Text GLabel 11900 3700 2    60   Input ~ 0
GND
Text GLabel 11900 3300 2    60   Input ~ 0
+Bat1
$Sheet
S 10850 2000 1050 700 
U 60043462
F0 "MotorController_1" 60
F1 "MotorController.sch" 60
F2 "ENABLE" I L 10850 2150 60 
F3 "IN1" I L 10850 2300 60 
F4 "IN2" I L 10850 2400 60 
F5 "SENSE" I L 10850 2550 60 
F6 "GND" I R 11900 2550 60 
F7 "+Bat" I R 11900 2150 60 
F8 "MOT+" I R 11900 2300 60 
F9 "MOT-" I R 11900 2400 60 
$EndSheet
Text GLabel 11900 2550 2    60   Input ~ 0
GND
Text GLabel 11900 2150 2    60   Input ~ 0
+Bat1
$Comp
L eduROV_motherboard:CONN_01X02-eduRov_motherboard-rescue 2Pscrew104
U 1 1 59CD3CF4
P 12600 5900
F 0 "2Pscrew104" H 12950 5850 50  0000 C CNN
F 1 "Channel 4" H 12900 5950 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-2_P5.00mm" H 12600 5900 50  0001 C CNN
F 3 "" H 12600 5900 50  0000 C CNN
	1    12600 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 4650 12400 4650
Wire Wire Line
	11900 4750 12400 4750
Text Label 12000 5850 0    60   ~ 0
Mot4+
Text Label 12000 5950 0    60   ~ 0
Mot4-
Wire Wire Line
	11900 5850 12400 5850
Wire Wire Line
	11900 5950 12400 5950
Text Label 12000 3450 0    60   ~ 0
Mot2+
Text Label 12000 3550 0    60   ~ 0
Mot2-
Wire Wire Line
	11900 3450 12400 3450
Wire Wire Line
	11900 3550 12400 3550
Text Label 12000 2300 0    60   ~ 0
Mot1+
Text Label 12000 2400 0    60   ~ 0
Mot1-
Wire Wire Line
	11900 2300 12400 2300
Wire Wire Line
	11900 2400 12400 2400
$Comp
L MCU_Module:Arduino_Nano_v3.x A101
U 1 1 60095748
P 6750 4950
F 0 "A101" H 5850 5950 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 6150 5900 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 6750 4950 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 6750 4950 50  0001 C CNN
	1    6750 4950
	1    0    0    -1  
$EndComp
Text GLabel 7250 5250 2    60   Input ~ 0
Sense1
Text GLabel 7250 5150 2    60   Input ~ 0
Sense2
Text GLabel 7250 5050 2    60   Input ~ 0
Sense3
Text GLabel 7250 4950 2    60   Input ~ 0
Sense4
Text GLabel 6250 4950 0    60   Input ~ 0
IO2B
Text GLabel 6250 5050 0    60   Input ~ 0
IO2A
Text GLabel 5550 4550 0    60   Input ~ 0
IOEN
Text GLabel 6250 4850 0    60   Input ~ 0
IO1A
Text GLabel 6250 4750 0    60   Input ~ 0
IO1B
Text GLabel 6250 5250 0    60   Input ~ 0
IO3A
Text GLabel 6250 5150 0    60   Input ~ 0
IO3B
Text GLabel 6250 5450 0    60   Input ~ 0
IO4A
Text GLabel 6250 5350 0    60   Input ~ 0
IO4B
Text GLabel 6250 4650 0    60   Input ~ 0
IO_LED
Text GLabel 6850 5950 3    60   Input ~ 0
GND
Text GLabel 6750 5950 3    60   Input ~ 0
GND
Wire Wire Line
	5550 4550 5700 4550
Wire Wire Line
	5700 4600 5700 4550
Connection ~ 5700 4550
Wire Wire Line
	5700 4550 6250 4550
$Comp
L Device:R R106
U 1 1 600D5E65
P 6950 3800
F 0 "R106" V 7030 3800 50  0000 C CNN
F 1 "0" V 6950 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 6880 3800 50  0001 C CNN
F 3 "" H 6950 3800 50  0000 C CNN
	1    6950 3800
	1    0    0    1   
$EndComp
Text GLabel 6950 3650 1    60   Input ~ 0
+5V
$Comp
L Device:CP C101
U 1 1 600EBD67
P 1350 1450
AR Path="/600EBD67" Ref="C101"  Part="1" 
AR Path="/5FFEC45F/600EBD67" Ref="C?"  Part="1" 
AR Path="/60017CE1/600EBD67" Ref="C?"  Part="1" 
AR Path="/600184A3/600EBD67" Ref="C?"  Part="1" 
AR Path="/60018874/600EBD67" Ref="C?"  Part="1" 
AR Path="/6003A868/600EBD67" Ref="C?"  Part="1" 
AR Path="/6003F027/600EBD67" Ref="C?"  Part="1" 
AR Path="/60043462/600EBD67" Ref="C?"  Part="1" 
F 0 "C101" V 1200 1750 50  0000 C CNN
F 1 "470uF" V 1300 1750 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D12.5mm_P5.00mm" H 1388 1300 50  0001 C CNN
F 3 "~" H 1350 1450 50  0001 C CNN
	1    1350 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	1200 1300 1300 1300
Connection ~ 1200 1450
Wire Wire Line
	1200 1450 1200 1300
Wire Wire Line
	1500 1650 1500 1450
Wire Wire Line
	1500 1300 1400 1300
Connection ~ 1500 1650
Wire Wire Line
	1500 1650 1550 1650
Connection ~ 1500 1450
Wire Wire Line
	1500 1450 1500 1300
Wire Wire Line
	1200 1450 1200 1650
Text GLabel 10850 6100 0    60   Input ~ 0
Sense4
Text GLabel 10850 2550 0    60   Input ~ 0
Sense1
Text GLabel 10850 3700 0    60   Input ~ 0
Sense2
Text GLabel 10850 2150 0    60   Input ~ 0
IOEN
Text GLabel 10850 3300 0    60   Input ~ 0
IOEN
Text GLabel 10850 4500 0    60   Input ~ 0
IOEN
Text GLabel 10850 3450 0    60   Input ~ 0
IO2A
Text GLabel 10850 2400 0    60   Input ~ 0
IO1B
Text GLabel 10850 3550 0    60   Input ~ 0
IO2B
Text GLabel 10850 2300 0    60   Input ~ 0
IO1A
Text GLabel 10850 4750 0    60   Input ~ 0
IO3B
Text GLabel 10850 4650 0    60   Input ~ 0
IO3A
Text Notes 7100 3900 0    39   ~ 0
Connects Arduino 5V to board 5V.\nDo not connect this if using \nUSB to power Arduino.
Wire Notes Line
	6800 3350 8200 3350
Wire Notes Line
	8200 3350 8200 3950
Wire Notes Line
	8200 3950 6800 3950
Wire Notes Line
	6800 3950 6800 3350
$Comp
L Device:C C107
U 1 1 5FC68142
P 14150 7950
F 0 "C107" H 14400 7900 50  0000 R CNN
F 1 "100nF" H 14500 8000 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 14188 7800 50  0001 C CNN
F 3 "~" H 14150 7950 50  0001 C CNN
	1    14150 7950
	1    0    0    1   
$EndComp
Wire Notes Line
	3900 4200 5050 4200
Wire Notes Line
	3900 5350 3900 4200
Wire Notes Line
	5050 5350 3900 5350
Wire Notes Line
	5050 4200 5050 5350
Text Notes 4200 4850 0    39   ~ 0
These resistors connects \nArduino serial port to \nRaspberry PI serial port.\nCan be ommitted if using \nUSB to power Arduino.
$Comp
L Device:R R102
U 1 1 6015AA7F
P 4100 4900
F 0 "R102" V 4000 4950 50  0000 C CNN
F 1 "10k" V 4100 4900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4030 4900 50  0001 C CNN
F 3 "" H 4100 4900 50  0000 C CNN
	1    4100 4900
	1    0    0    1   
$EndComp
Connection ~ 4100 4450
Wire Wire Line
	3250 4450 4100 4450
$Comp
L Device:R R101
U 1 1 6015A2BD
P 4100 4600
F 0 "R101" V 4000 4650 50  0000 C CNN
F 1 "10k" V 4100 4600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4030 4600 50  0001 C CNN
F 3 "" H 4100 4600 50  0000 C CNN
	1    4100 4600
	1    0    0    1   
$EndComp
Wire Wire Line
	4100 4350 3250 4350
$Comp
L Device:R R103
U 1 1 600D5188
P 4250 4350
F 0 "R103" V 4300 4550 50  0000 C CNN
F 1 "10k" V 4250 4350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4180 4350 50  0001 C CNN
F 3 "" H 4250 4350 50  0000 C CNN
	1    4250 4350
	0    1    -1   0   
$EndComp
Wire Wire Line
	4400 4450 6250 4450
Text GLabel 4100 5050 3    60   Input ~ 0
GND
$Comp
L Device:R R104
U 1 1 600D04E5
P 4250 4450
F 0 "R104" V 4200 4250 50  0000 C CNN
F 1 "10k" V 4250 4450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4180 4450 50  0001 C CNN
F 3 "" H 4250 4450 50  0000 C CNN
	1    4250 4450
	0    -1   1    0   
$EndComp
Wire Wire Line
	6250 4350 4400 4350
$EndSCHEMATC
