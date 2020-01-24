EESchema Schematic File Version 4
LIBS:led_pcb_l-cache
EELAYER 29 0
EELAYER END
$Descr User 4016 4016
encoding utf-8
Sheet 1 1
Title "RVL-SLED(L)"
Date "2020-01-24"
Rev "01"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:LED D1
U 1 1 5E2AF667
P 2700 1500
F 0 "D1" H 2693 1716 50  0000 C CNN
F 1 "LED" H 2693 1625 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 2700 1500 50  0001 C CNN
F 3 "~" H 2700 1500 50  0001 C CNN
	1    2700 1500
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D3
U 1 1 5E2AFDF7
P 1900 1500
F 0 "D3" H 1900 1716 50  0000 C CNN
F 1 "D" H 1900 1625 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 1900 1500 50  0001 C CNN
F 3 "~" H 1900 1500 50  0001 C CNN
	1    1900 1500
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint B1
U 1 1 5E2BE82A
P 1300 1350
F 0 "B1" H 1242 1376 50  0000 R CNN
F 1 "TestPoint" H 1242 1467 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1500 1350 50  0001 C CNN
F 3 "~" H 1500 1350 50  0001 C CNN
	1    1300 1350
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint R1
U 1 1 5E2BEAB3
P 1300 1650
F 0 "R1" H 1242 1676 50  0000 R CNN
F 1 "TestPoint" H 1242 1767 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1500 1650 50  0001 C CNN
F 3 "~" H 1500 1650 50  0001 C CNN
	1    1300 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1300 1350 1900 1350
Wire Wire Line
	1300 1650 1900 1650
Connection ~ 1900 1350
Wire Wire Line
	1900 1350 2700 1350
Connection ~ 1900 1650
Wire Wire Line
	1900 1650 2700 1650
$EndSCHEMATC
