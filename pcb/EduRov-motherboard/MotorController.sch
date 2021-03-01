EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:D D?
U 1 1 5FFEEEFF
P 6250 3450
AR Path="/5FFEEEFF" Ref="D?"  Part="1" 
AR Path="/5FFEC45F/5FFEEEFF" Ref="D202"  Part="1" 
AR Path="/60017CE1/5FFEEEFF" Ref="D?"  Part="1" 
AR Path="/600184A3/5FFEEEFF" Ref="D?"  Part="1" 
AR Path="/60018874/5FFEEEFF" Ref="D?"  Part="1" 
AR Path="/6003A868/5FFEEEFF" Ref="D302"  Part="1" 
AR Path="/6003F027/5FFEEEFF" Ref="D402"  Part="1" 
AR Path="/60043462/5FFEEEFF" Ref="D502"  Part="1" 
F 0 "D502" H 6450 3500 50  0000 C CNN
F 1 "D" H 6400 3400 50  0001 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P3.81mm_Vertical_KathodeUp" H 6250 3450 50  0001 C CNN
F 3 "" H 6250 3450 50  0000 C CNN
	1    6250 3450
	0    1    1    0   
$EndComp
$Comp
L Device:D D?
U 1 1 5FFEEF0B
P 6100 3450
AR Path="/5FFEEF0B" Ref="D?"  Part="1" 
AR Path="/5FFEC45F/5FFEEF0B" Ref="D201"  Part="1" 
AR Path="/60017CE1/5FFEEF0B" Ref="D?"  Part="1" 
AR Path="/600184A3/5FFEEF0B" Ref="D?"  Part="1" 
AR Path="/60018874/5FFEEF0B" Ref="D?"  Part="1" 
AR Path="/6003A868/5FFEEF0B" Ref="D301"  Part="1" 
AR Path="/6003F027/5FFEEF0B" Ref="D401"  Part="1" 
AR Path="/60043462/5FFEEF0B" Ref="D501"  Part="1" 
F 0 "D501" H 6300 3500 50  0000 C CNN
F 1 "D" H 6250 3400 50  0001 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P3.81mm_Vertical_KathodeUp" H 6100 3450 50  0001 C CNN
F 3 "" H 6100 3450 50  0000 C CNN
	1    6100 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 3100 4200 3100
Wire Wire Line
	2900 3200 4200 3200
Text GLabel 5000 2250 1    60   Input ~ 0
+Bat
Text GLabel 5450 2600 3    60   Input ~ 0
GND
Wire Wire Line
	2900 3000 4200 3000
$Comp
L eduROV_motherboard:L6203 IC?
U 1 1 5FFEEF31
P 4800 3100
AR Path="/5FFEEF31" Ref="IC?"  Part="1" 
AR Path="/5FFEC45F/5FFEEF31" Ref="IC201"  Part="1" 
AR Path="/60017CE1/5FFEEF31" Ref="IC?"  Part="1" 
AR Path="/600184A3/5FFEEF31" Ref="IC?"  Part="1" 
AR Path="/60018874/5FFEEF31" Ref="IC?"  Part="1" 
AR Path="/6003A868/5FFEEF31" Ref="IC301"  Part="1" 
AR Path="/6003F027/5FFEEF31" Ref="IC401"  Part="1" 
AR Path="/60043462/5FFEEF31" Ref="IC501"  Part="1" 
F 0 "IC501" H 4400 3550 50  0000 C CNN
F 1 "L6203" H 4400 3450 50  0000 C CNN
F 2 "EduROV:MULTIWATT-11" H 4800 3100 50  0001 L BNN
F 3 "" H 4800 3100 50  0001 L BNN
F 4 "" H 4800 3100 50  0001 L BNN "MF"
F 5 "56P8434" H 4800 3100 50  0001 L BNN "OC_NEWARK"
F 6 "1467715" H 4800 3100 50  0001 L BNN "OC_FARNELL"
F 7 "L6203" H 4800 3100 50  0001 L BNN "MPN"
	1    4800 3100
	1    0    0    -1  
$EndComp
Text GLabel 6250 3750 3    60   Input ~ 0
GND
Text GLabel 5000 3600 3    60   Input ~ 0
GND
Wire Wire Line
	5400 3200 5850 3200
Wire Wire Line
	5400 3100 5850 3100
Wire Wire Line
	5450 2600 5450 2500
Wire Wire Line
	5450 2500 5300 2500
$Comp
L Device:C_Small C?
U 1 1 5FFEEF49
P 5650 3000
AR Path="/5FFEEF49" Ref="C?"  Part="1" 
AR Path="/5FFEC45F/5FFEEF49" Ref="C204"  Part="1" 
AR Path="/60017CE1/5FFEEF49" Ref="C?"  Part="1" 
AR Path="/600184A3/5FFEEF49" Ref="C?"  Part="1" 
AR Path="/60018874/5FFEEF49" Ref="C?"  Part="1" 
AR Path="/6003A868/5FFEEF49" Ref="C304"  Part="1" 
AR Path="/6003F027/5FFEEF49" Ref="C404"  Part="1" 
AR Path="/60043462/5FFEEF49" Ref="C504"  Part="1" 
F 0 "C504" V 5600 2850 50  0000 C CNN
F 1 "15nF" V 5600 3150 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5650 3000 50  0001 C CNN
F 3 "~" H 5650 3000 50  0001 C CNN
	1    5650 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 3000 5550 3000
Wire Wire Line
	5750 3000 5850 3000
Wire Wire Line
	5850 3000 5850 3100
Connection ~ 5850 3100
$Comp
L Device:C_Small C?
U 1 1 5FFEEF54
P 5650 3300
AR Path="/5FFEEF54" Ref="C?"  Part="1" 
AR Path="/5FFEC45F/5FFEEF54" Ref="C205"  Part="1" 
AR Path="/60017CE1/5FFEEF54" Ref="C?"  Part="1" 
AR Path="/600184A3/5FFEEF54" Ref="C?"  Part="1" 
AR Path="/60018874/5FFEEF54" Ref="C?"  Part="1" 
AR Path="/6003A868/5FFEEF54" Ref="C305"  Part="1" 
AR Path="/6003F027/5FFEEF54" Ref="C405"  Part="1" 
AR Path="/60043462/5FFEEF54" Ref="C505"  Part="1" 
F 0 "C505" V 5700 3150 50  0000 C CNN
F 1 "15nF" V 5700 3450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5650 3300 50  0001 C CNN
F 3 "~" H 5650 3300 50  0001 C CNN
	1    5650 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 3300 5550 3300
Wire Wire Line
	5750 3300 5850 3300
Wire Wire Line
	5850 3300 5850 3200
Connection ~ 5850 3200
$Comp
L Device:C_Small C?
U 1 1 5FFEEF6B
P 3900 2900
AR Path="/5FFEEF6B" Ref="C?"  Part="1" 
AR Path="/5FFEC45F/5FFEEF6B" Ref="C202"  Part="1" 
AR Path="/60017CE1/5FFEEF6B" Ref="C?"  Part="1" 
AR Path="/600184A3/5FFEEF6B" Ref="C?"  Part="1" 
AR Path="/60018874/5FFEEF6B" Ref="C?"  Part="1" 
AR Path="/6003A868/5FFEEF6B" Ref="C302"  Part="1" 
AR Path="/6003F027/5FFEEF6B" Ref="C402"  Part="1" 
AR Path="/60043462/5FFEEF6B" Ref="C502"  Part="1" 
F 0 "C502" V 3850 2750 50  0000 C CNN
F 1 "220nF" V 3850 3050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3900 2900 50  0001 C CNN
F 3 "~" H 3900 2900 50  0001 C CNN
	1    3900 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	4000 2900 4200 2900
Text GLabel 3650 2900 0    60   Input ~ 0
GND
Wire Wire Line
	3800 2900 3650 2900
Text HLabel 2900 3000 0    60   Input ~ 0
ENABLE
Text HLabel 2900 3100 0    60   Input ~ 0
IN1
Text HLabel 2900 3200 0    60   Input ~ 0
IN2
Text HLabel 2900 2750 0    60   Input ~ 0
GND
Text GLabel 2900 2750 2    60   Input ~ 0
GND
Text HLabel 2900 2650 0    60   Input ~ 0
+Bat
Text GLabel 2900 2650 2    60   Input ~ 0
+Bat
Text HLabel 6700 3200 2    60   Input ~ 0
MOT+
Text HLabel 6700 3100 2    60   Input ~ 0
MOT-
$Comp
L Device:C C?
U 1 1 600F7A3C
P 5150 2500
AR Path="/600F7A3C" Ref="C?"  Part="1" 
AR Path="/60043462/600F7A3C" Ref="C503"  Part="1" 
AR Path="/5FFEC45F/600F7A3C" Ref="C203"  Part="1" 
AR Path="/6003A868/600F7A3C" Ref="C303"  Part="1" 
AR Path="/6003F027/600F7A3C" Ref="C403"  Part="1" 
F 0 "C503" V 5300 2650 50  0000 C CNN
F 1 "100nF" V 5200 2700 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5188 2350 50  0001 C CNN
F 3 "~" H 5150 2500 50  0001 C CNN
	1    5150 2500
	0    1    -1   0   
$EndComp
Wire Wire Line
	5850 3100 6100 3100
Wire Wire Line
	5850 3200 6250 3200
Wire Wire Line
	6250 3750 6250 3600
Text GLabel 6100 3750 3    60   Input ~ 0
GND
Wire Wire Line
	6100 3750 6100 3600
Wire Wire Line
	5000 2700 5000 2500
Wire Wire Line
	5000 2500 5000 2250
Connection ~ 5000 2500
Wire Wire Line
	6100 3300 6100 3100
Connection ~ 6100 3100
Wire Wire Line
	6100 3100 6700 3100
Wire Wire Line
	6250 3300 6250 3200
Connection ~ 6250 3200
Wire Wire Line
	6250 3200 6700 3200
Text GLabel 3950 4750 2    60   Input ~ 0
GND
Text HLabel 2900 2550 0    60   Input ~ 0
+5V
Text GLabel 2900 2550 2    60   Input ~ 0
+5V
Text Notes 3921 3910 0    60   ~ 0
V
Wire Notes Line
	3950 3550 3950 3900
Text Notes 3970 3780 0    39   ~ 0
Im = Motor Current
Text Notes 1650 3550 0    60   Italic 0
Optional current measurement
Text Notes 600  900  0    60   ~ 0
This sheet is copied 4 times since we're controlling 4 motors.\nThe first copy uses component number 200 and up, the second 300 and up, and so on.\nIn notes this sheet will use component numbers in the 200 range for simplicity.
Text Notes 1700 5000 0    39   ~ 0
If measurement of motor current is not required, bridge R201\nwith a wire, and do not mount components inside this box.
Wire Notes Line
	3650 3400 1600 3400
$Comp
L Device:R R?
U 1 1 6032BA93
P 3800 4200
AR Path="/6032BA93" Ref="R?"  Part="1" 
AR Path="/6003A868/6032BA93" Ref="R301"  Part="1" 
AR Path="/5FFEC45F/6032BA93" Ref="R201"  Part="1" 
AR Path="/6003F027/6032BA93" Ref="R401"  Part="1" 
AR Path="/60043462/6032BA93" Ref="R501"  Part="1" 
F 0 "R501" V 3880 4200 50  0000 C CNN
F 1 "0" V 3800 4200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 3730 4200 50  0001 C CNN
F 3 "" H 3800 4200 50  0000 C CNN
	1    3800 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3150 4050 3800 4050
Wire Wire Line
	3150 4350 3800 4350
Wire Wire Line
	3800 4750 3950 4750
Connection ~ 3800 4350
Wire Wire Line
	3800 4350 3800 4750
Wire Wire Line
	3800 4050 3800 3300
Wire Wire Line
	3800 3300 4200 3300
Connection ~ 3800 4050
Text GLabel 2750 4650 2    60   Input ~ 0
GND
$Comp
L Sensor_Current:ACS723xLCTR-05AB U201
U 1 1 60485F83
P 2750 4250
AR Path="/5FFEC45F/60485F83" Ref="U201"  Part="1" 
AR Path="/6003A868/60485F83" Ref="U301"  Part="1" 
AR Path="/6003F027/60485F83" Ref="U401"  Part="1" 
AR Path="/60043462/60485F83" Ref="U501"  Part="1" 
F 0 "U501" H 3000 4700 50  0000 C CNN
F 1 "ACS723xLCTR-05AB" H 3250 4600 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2850 3900 50  0001 L CIN
F 3 "http://www.allegromicro.com/~/media/Files/Datasheets/ACS723-Datasheet.ashx?la=en" H 2750 4250 50  0001 C CNN
	1    2750 4250
	-1   0    0    -1  
$EndComp
Text GLabel 2750 3650 0    60   Input ~ 0
+5V
$Comp
L Device:C C?
U 1 1 60487676
P 2900 3800
AR Path="/60487676" Ref="C?"  Part="1" 
AR Path="/60043462/60487676" Ref="C501"  Part="1" 
AR Path="/5FFEC45F/60487676" Ref="C201"  Part="1" 
AR Path="/6003A868/60487676" Ref="C301"  Part="1" 
AR Path="/6003F027/60487676" Ref="C401"  Part="1" 
F 0 "C501" V 3100 3950 50  0000 C CNN
F 1 "100nF" V 3000 4000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2938 3650 50  0001 C CNN
F 3 "~" H 2900 3800 50  0001 C CNN
	1    2900 3800
	0    1    -1   0   
$EndComp
Text GLabel 3050 3800 2    60   Input ~ 0
GND
Wire Wire Line
	2750 3800 2750 3850
Connection ~ 2750 3800
Wire Wire Line
	2750 3650 2750 3800
Wire Wire Line
	2750 4650 2350 4650
Wire Wire Line
	2350 4650 2350 4350
Text HLabel 2350 4050 0    39   Input ~ 0
SENSE
Wire Notes Line
	1600 3400 1600 5100
Wire Notes Line
	1600 5100 3650 5100
Wire Notes Line
	3650 5100 3650 3400
$EndSCHEMATC
