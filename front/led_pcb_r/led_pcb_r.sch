EESchema Schematic File Version 4
LIBS:led_pcb_r-cache
EELAYER 29 0
EELAYER END
$Descr User 4016 4016
encoding utf-8
Sheet 1 1
Title "RVL-SLED(R)"
Date "2020-01-24"
Rev "01"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:LED D2
U 1 1 5E2AF667
P 2800 1350
F 0 "D2" H 2793 1566 50  0000 C CNN
F 1 "LED" H 2793 1475 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 2800 1350 50  0001 C CNN
F 3 "~" H 2800 1350 50  0001 C CNN
	1    2800 1350
	0    1    1    0   
$EndComp
$Comp
L Device:D D4
U 1 1 5E2AFDF7
P 2000 1350
F 0 "D4" H 2000 1566 50  0000 C CNN
F 1 "D" H 2000 1475 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 2000 1350 50  0001 C CNN
F 3 "~" H 2000 1350 50  0001 C CNN
	1    2000 1350
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint B2
U 1 1 5E2BE82A
P 1650 1500
F 0 "B2" H 1592 1526 50  0000 R CNN
F 1 "TestPoint" H 1592 1617 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1850 1500 50  0001 C CNN
F 3 "~" H 1850 1500 50  0001 C CNN
	1    1650 1500
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint R2
U 1 1 5E2BEAB3
P 1150 1500
F 0 "R2" H 1092 1526 50  0000 R CNN
F 1 "TestPoint" H 1092 1617 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1350 1500 50  0001 C CNN
F 3 "~" H 1350 1500 50  0001 C CNN
	1    1150 1500
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint B1
U 1 1 5E2BEBEF
P 1650 1200
F 0 "B1" H 1708 1318 50  0000 L CNN
F 1 "TestPoint" H 1708 1227 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1850 1200 50  0001 C CNN
F 3 "~" H 1850 1200 50  0001 C CNN
	1    1650 1200
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint R1
U 1 1 5E2BF24C
P 1150 1200
F 0 "R1" H 1208 1318 50  0000 L CNN
F 1 "TestPoint" H 1208 1227 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1350 1200 50  0001 C CNN
F 3 "~" H 1350 1200 50  0001 C CNN
	1    1150 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 1500 1150 1200
Wire Wire Line
	1650 1200 2000 1200
Wire Wire Line
	1650 1500 2000 1500
Connection ~ 2000 1500
Wire Wire Line
	2000 1500 2800 1500
Connection ~ 2000 1200
Wire Wire Line
	2000 1200 2800 1200
$EndSCHEMATC
