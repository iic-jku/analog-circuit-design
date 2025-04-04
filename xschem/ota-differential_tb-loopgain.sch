v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 2890 -2440 3690 -2040 {flags=graph
y1=-180
y2=180
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-2
x2=9
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0
node="\\"Rosenstark's Phase; ph(vr1)\\""
color=4
dataset=-1
unitx=1
logx=1
logy=0
linewidth_mult=4}
B 2 2890 -2860 3690 -2460 {flags=graph
y1=-85
y2=30
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-2
x2=9
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0
node="\\"Rosenstark's Magnitude; vr1 vind1 / db20()\\""
color=4
dataset=-1
unitx=1
logx=1
logy=0
linewidth_mult=4}
P 4 5 2560 -2340 2560 -2240 2760 -2240 2760 -2340 2560 -2340 {dash = 8}
P 4 5 1240 -2780 2860 -2780 2860 -2040 1240 -2040 1240 -2780 {dash = 8}
P 4 5 2060 -1540 2060 -1440 2260 -1440 2260 -1540 2060 -1540 {dash = 8}
P 4 5 2060 -800 2060 -700 2260 -700 2260 -800 2060 -800 {dash = 8}
P 4 6 1260 -1980 2580 -1980 2580 -500 1240 -500 1240 -1980 1260 -1980 {dash = 8}
P 4 5 3440 -1540 3440 -1440 3640 -1440 3640 -1540 3440 -1540 {dash = 8}
P 4 5 3440 -800 3440 -700 3640 -700 3640 -800 3440 -800 {dash = 8}
P 4 6 2640 -1980 3960 -1980 3960 -500 2620 -500 2620 -1980 2640 -1980 {dash = 8}
T {Testbench for loop gain analysis - Differential OTA} 1260 -80 0 0 1 1 {}
T {Capacitive Load} 2600 -2170 0 0 0.25 0.25 {}
T {Rosenstark’s Method} 1240 -2820 0 0 0.5 0.5 {}
T {Capacitive Load} 2100 -1370 0 0 0.25 0.25 {}
T {Capacitive Load} 2100 -630 0 0 0.25 0.25 {}
T {Middlebrook’s Method} 1240 -2020 0 0 0.5 0.5 {}
T {Capacitive Load} 3480 -1370 0 0 0.25 0.25 {}
T {Capacitive Load} 3480 -630 0 0 0.25 0.25 {}
T {Tian’s Method} 2620 -2020 0 0 0.5 0.5 {}
N 2340 -2560 2340 -2520 {lab=VDD}
N 1860 -2540 1900 -2540 {lab=Vcm}
N 2240 -2420 2260 -2420 {lab=Vcm}
N 1860 -2300 1900 -2300 {lab=Vcm}
N 2600 -2400 2740 -2400 {lab=voutp1}
N 2700 -2440 2740 -2440 {lab=voutn1}
N 2600 -2260 2600 -2200 {lab=GND}
N 2700 -2260 2700 -2200 {lab=GND}
N 2600 -2400 2600 -2320 {lab=voutp1}
N 2700 -2440 2700 -2320 {lab=voutn1}
N 1320 -2440 1320 -2380 {lab=vind1}
N 1300 -2440 1320 -2440 {lab=vind1}
N 1320 -2440 1400 -2440 {lab=vind1}
N 1400 -2400 1400 -2360 {lab=GND}
N 1400 -2360 1440 -2360 {lab=GND}
N 1440 -2390 1440 -2360 {
lab=GND}
N 1740 -2420 1860 -2420 {
lab=Vcm}
N 1640 -2460 1640 -2420 {lab=Vcm}
N 1640 -2560 1640 -2520 {lab=vinp1}
N 1520 -2370 1600 -2370 {lab=#net1}
N 1520 -2510 1600 -2510 {lab=#net1}
N 1440 -2510 1440 -2450 {lab=#net1}
N 1560 -2330 1600 -2330 {lab=GND}
N 1440 -2360 1440 -2330 {
lab=GND}
N 1560 -2470 1600 -2470 {lab=GND}
N 1560 -2470 1560 -2330 {lab=GND}
N 1440 -2330 1560 -2330 {lab=GND}
N 1520 -2510 1520 -2370 {lab=#net1}
N 1440 -2510 1520 -2510 {lab=#net1}
N 1640 -2420 1640 -2380 {lab=Vcm}
N 1640 -2320 1640 -2280 {lab=vinn1}
N 1740 -2420 1740 -2380 {lab=Vcm}
N 1640 -2420 1740 -2420 {
lab=Vcm}
N 1740 -2320 1740 -2280 {lab=GND}
N 1440 -2330 1440 -2280 {lab=GND}
N 1320 -2320 1320 -2280 {lab=GND}
N 3760 -2200 3760 -2160 {lab=VDD}
N 3760 -2100 3760 -2060 {lab=GND}
N 3880 -2200 3880 -2160 {lab=amp_en}
N 3880 -2100 3880 -2060 {lab=GND}
N 2740 -2660 2740 -2640 {
lab=vout1}
N 2670 -2630 2700 -2630 {
lab=voutp1}
N 2670 -2590 2700 -2590 {
lab=voutn1}
N 2740 -2580 2740 -2560 {lab=GND}
N 2340 -2320 2340 -2280 {
lab=GND}
N 2360 -2540 2360 -2520 {
lab=amp_en}
N 2440 -2440 2540 -2440 {lab=voutn1}
N 2440 -2400 2540 -2400 {lab=voutp1}
N 2540 -2400 2600 -2400 {lab=voutp1}
N 2540 -2440 2700 -2440 {lab=voutn1}
N 2540 -2180 2540 -2100 {lab=voutp1}
N 2000 -2300 2000 -2180 {lab=vrn1}
N 2000 -2540 2000 -2460 {lab=vrp1}
N 2000 -2660 2000 -2540 {lab=vrp1}
N 2000 -2380 2000 -2300 {lab=vrn1}
N 1960 -2300 2000 -2300 {lab=vrn1}
N 1960 -2540 2000 -2540 {lab=vrp1}
N 2000 -2180 2240 -2180 {lab=vrn1}
N 2300 -2180 2540 -2180 {lab=voutp1}
N 2540 -2400 2540 -2180 {lab=voutp1}
N 2300 -2100 2540 -2100 {lab=voutp1}
N 2000 -2100 2240 -2100 {lab=vrn1}
N 2000 -2180 2000 -2100 {lab=vrn1}
N 2000 -2660 2240 -2660 {lab=vrp1}
N 2000 -2740 2000 -2660 {lab=vrp1}
N 2000 -2740 2240 -2740 {lab=vrp1}
N 2300 -2740 2540 -2740 {lab=voutn1}
N 2300 -2660 2540 -2660 {lab=voutn1}
N 2540 -2660 2540 -2440 {lab=voutn1}
N 2540 -2740 2540 -2660 {lab=voutn1}
N 1860 -2420 1860 -2300 {lab=Vcm}
N 2180 -2460 2260 -2460 {lab=#net2}
N 2180 -2480 2180 -2460 {lab=#net2}
N 2180 -2560 2180 -2540 {lab=vinp1}
N 2160 -2560 2180 -2560 {lab=vinp1}
N 2120 -2460 2180 -2460 {lab=#net2}
N 2000 -2460 2060 -2460 {lab=vrp1}
N 2000 -2380 2060 -2380 {lab=vrn1}
N 2180 -2380 2260 -2380 {lab=#net3}
N 2180 -2380 2180 -2360 {lab=#net3}
N 2120 -2380 2180 -2380 {lab=#net3}
N 2160 -2280 2180 -2280 {lab=vinn1}
N 2180 -2300 2180 -2280 {lab=vinn1}
N 1740 -2440 1740 -2420 {lab=Vcm}
N 1860 -2540 1860 -2420 {lab=Vcm}
N 1980 -2460 2000 -2460 {lab=vrp1}
N 1980 -2380 2000 -2380 {lab=vrn1}
N 1740 -2220 1740 -2200 {
lab=vr1}
N 1670 -2190 1700 -2190 {
lab=vrp1}
N 1670 -2150 1700 -2150 {
lab=vrn1}
N 1740 -2140 1740 -2120 {lab=GND}
N 1840 -1760 1840 -1720 {lab=VDD}
N 1360 -1740 1400 -1740 {lab=Vcm}
N 1740 -1620 1760 -1620 {lab=Vcm}
N 1360 -1500 1400 -1500 {lab=Vcm}
N 2100 -1600 2240 -1600 {lab=voutp2}
N 2200 -1640 2240 -1640 {lab=voutn2}
N 2100 -1460 2100 -1400 {lab=GND}
N 2200 -1460 2200 -1400 {lab=GND}
N 2100 -1600 2100 -1520 {lab=voutp2}
N 2200 -1640 2200 -1520 {lab=voutn2}
N 2500 -1670 2500 -1650 {
lab=vout2}
N 2430 -1640 2460 -1640 {
lab=voutp2}
N 2430 -1600 2460 -1600 {
lab=voutn2}
N 2500 -1590 2500 -1570 {lab=GND}
N 1840 -1520 1840 -1480 {
lab=GND}
N 1860 -1740 1860 -1720 {
lab=amp_en}
N 1940 -1640 2040 -1640 {lab=voutn2}
N 1940 -1600 2040 -1600 {lab=voutp2}
N 2040 -1600 2100 -1600 {lab=voutp2}
N 2040 -1640 2200 -1640 {lab=voutn2}
N 2040 -1380 2040 -1300 {lab=voutp2}
N 1500 -1500 1500 -1380 {lab=vrn2}
N 1500 -1740 1500 -1660 {lab=vrp2}
N 1500 -1860 1500 -1740 {lab=vrp2}
N 1500 -1580 1500 -1500 {lab=vrn2}
N 1460 -1500 1500 -1500 {lab=vrn2}
N 1460 -1740 1500 -1740 {lab=vrp2}
N 1500 -1380 1740 -1380 {lab=vrn2}
N 1800 -1380 2040 -1380 {lab=voutp2}
N 2040 -1600 2040 -1380 {lab=voutp2}
N 1800 -1300 2040 -1300 {lab=voutp2}
N 1500 -1300 1740 -1300 {lab=vrn2}
N 1500 -1380 1500 -1300 {lab=vrn2}
N 1500 -1860 1740 -1860 {lab=vrp2}
N 1500 -1940 1500 -1860 {lab=vrp2}
N 1500 -1940 1740 -1940 {lab=vrp2}
N 1800 -1940 2040 -1940 {lab=voutn2}
N 1800 -1860 2040 -1860 {lab=voutn2}
N 2040 -1860 2040 -1640 {lab=voutn2}
N 2040 -1940 2040 -1860 {lab=voutn2}
N 1360 -1620 1360 -1500 {lab=Vcm}
N 1840 -1020 1840 -980 {lab=VDD}
N 1360 -1000 1400 -1000 {lab=Vcm}
N 1740 -880 1760 -880 {lab=Vcm}
N 1360 -760 1400 -760 {lab=Vcm}
N 2100 -860 2240 -860 {lab=voutp3}
N 2200 -900 2240 -900 {lab=voutn3}
N 2100 -720 2100 -660 {lab=GND}
N 2200 -720 2200 -660 {lab=GND}
N 2100 -860 2100 -780 {lab=voutp3}
N 2200 -900 2200 -780 {lab=voutn3}
N 2500 -930 2500 -910 {
lab=vout3}
N 2430 -900 2460 -900 {
lab=voutp3}
N 2430 -860 2460 -860 {
lab=voutn3}
N 2500 -850 2500 -830 {lab=GND}
N 1840 -780 1840 -740 {
lab=GND}
N 1860 -1000 1860 -980 {
lab=amp_en}
N 1940 -900 2040 -900 {lab=voutn3}
N 1940 -860 2040 -860 {lab=voutp3}
N 2040 -860 2100 -860 {lab=voutp3}
N 2040 -900 2200 -900 {lab=voutn3}
N 2040 -640 2040 -560 {lab=voutp3}
N 1500 -760 1500 -640 {lab=#net4}
N 1500 -1120 1500 -1000 {lab=#net5}
N 1500 -820 1500 -760 {lab=#net4}
N 1460 -760 1500 -760 {lab=#net4}
N 1460 -1000 1500 -1000 {lab=#net5}
N 1500 -640 1740 -640 {lab=#net4}
N 1800 -640 2040 -640 {lab=voutp3}
N 2040 -860 2040 -640 {lab=voutp3}
N 1800 -560 2040 -560 {lab=voutp3}
N 1500 -560 1740 -560 {lab=#net4}
N 1500 -640 1500 -560 {lab=#net4}
N 1500 -1120 1740 -1120 {lab=#net5}
N 1500 -1200 1500 -1120 {lab=#net5}
N 1500 -1200 1740 -1200 {lab=#net5}
N 1800 -1200 2040 -1200 {lab=voutn3}
N 1800 -1120 2040 -1120 {lab=voutn3}
N 2040 -1120 2040 -900 {lab=voutn3}
N 2040 -1200 2040 -1120 {lab=voutn3}
N 1360 -880 1360 -760 {lab=Vcm}
N 1320 -1620 1360 -1620 {lab=Vcm}
N 1360 -1740 1360 -1620 {lab=Vcm}
N 1320 -880 1360 -880 {lab=Vcm}
N 1360 -1000 1360 -880 {lab=Vcm}
N 2260 -1890 2260 -1870 {
lab=vf2}
N 2190 -1860 2220 -1860 {
lab=vfp2}
N 2190 -1820 2220 -1820 {
lab=vfn2}
N 2260 -1810 2260 -1780 {
lab=GND}
N 2500 -1890 2500 -1870 {
lab=vr2}
N 2430 -1860 2460 -1860 {
lab=vrp2}
N 2430 -1820 2460 -1820 {
lab=vrn2}
N 2500 -1810 2500 -1780 {
lab=GND}
N 1500 -1660 1600 -1660 {lab=vrp2}
N 1660 -1660 1760 -1660 {lab=vfp2}
N 1500 -1580 1600 -1580 {lab=vrn2}
N 1660 -1580 1760 -1580 {lab=vfn2}
N 1620 -820 1640 -820 {
lab=#net6}
N 1600 -820 1620 -820 {
lab=#net6}
N 1620 -940 1640 -940 {
lab=#net7}
N 1600 -940 1620 -940 {
lab=#net7}
N 1620 -740 1620 -720 {lab=GND}
N 1620 -820 1620 -800 {lab=#net6}
N 1620 -960 1620 -940 {lab=#net7}
N 1620 -1040 1620 -1020 {lab=GND}
N 1700 -940 1740 -940 {lab=#net8}
N 1740 -940 1740 -920 {lab=#net8}
N 1740 -920 1760 -920 {lab=#net8}
N 1740 -840 1760 -840 {lab=#net9}
N 1740 -840 1740 -820 {lab=#net9}
N 1700 -820 1740 -820 {lab=#net9}
N 1500 -820 1540 -820 {lab=#net4}
N 1500 -940 1540 -940 {lab=#net5}
N 1500 -1000 1500 -940 {lab=#net5}
N 3220 -1760 3220 -1720 {lab=VDD}
N 2740 -1740 2780 -1740 {lab=Vcm}
N 3120 -1620 3140 -1620 {lab=Vcm}
N 2740 -1500 2780 -1500 {lab=Vcm}
N 3480 -1600 3620 -1600 {lab=voutp4}
N 3580 -1640 3620 -1640 {lab=voutn4}
N 3480 -1460 3480 -1400 {lab=GND}
N 3580 -1460 3580 -1400 {lab=GND}
N 3480 -1600 3480 -1520 {lab=voutp4}
N 3580 -1640 3580 -1520 {lab=voutn4}
N 3860 -1670 3860 -1650 {
lab=vout4}
N 3790 -1640 3820 -1640 {
lab=voutp4}
N 3790 -1600 3820 -1600 {
lab=voutn4}
N 3860 -1590 3860 -1570 {lab=GND}
N 3220 -1520 3220 -1480 {
lab=GND}
N 3240 -1740 3240 -1720 {
lab=amp_en}
N 3320 -1640 3420 -1640 {lab=voutn4}
N 3320 -1600 3420 -1600 {lab=voutp4}
N 3420 -1600 3480 -1600 {lab=voutp4}
N 3420 -1640 3580 -1640 {lab=voutn4}
N 3420 -1380 3420 -1300 {lab=voutp4}
N 2880 -1500 2880 -1380 {lab=#net10}
N 2880 -1860 2880 -1740 {lab=#net11}
N 2880 -1560 2880 -1500 {lab=#net10}
N 2840 -1500 2880 -1500 {lab=#net10}
N 2840 -1740 2880 -1740 {lab=#net11}
N 2880 -1380 3120 -1380 {lab=#net10}
N 3180 -1380 3420 -1380 {lab=voutp4}
N 3420 -1600 3420 -1380 {lab=voutp4}
N 3180 -1300 3420 -1300 {lab=voutp4}
N 2880 -1300 3120 -1300 {lab=#net10}
N 2880 -1380 2880 -1300 {lab=#net10}
N 2880 -1860 3120 -1860 {lab=#net11}
N 2880 -1940 2880 -1860 {lab=#net11}
N 2880 -1940 3120 -1940 {lab=#net11}
N 3180 -1940 3420 -1940 {lab=voutn4}
N 3180 -1860 3420 -1860 {lab=voutn4}
N 3420 -1860 3420 -1640 {lab=voutn4}
N 3420 -1940 3420 -1860 {lab=voutn4}
N 2740 -1620 2740 -1500 {lab=Vcm}
N 3220 -1020 3220 -980 {lab=VDD}
N 2740 -1000 2780 -1000 {lab=Vcm}
N 3120 -880 3140 -880 {lab=Vcm}
N 2740 -760 2780 -760 {lab=Vcm}
N 3480 -860 3620 -860 {lab=voutp5}
N 3580 -900 3620 -900 {lab=voutn5}
N 3480 -720 3480 -660 {lab=GND}
N 3580 -720 3580 -660 {lab=GND}
N 3480 -860 3480 -780 {lab=voutp5}
N 3580 -900 3580 -780 {lab=voutn5}
N 3860 -930 3860 -910 {
lab=vout5}
N 3790 -900 3820 -900 {
lab=voutp5}
N 3790 -860 3820 -860 {
lab=voutn5}
N 3860 -850 3860 -830 {lab=GND}
N 3220 -780 3220 -740 {
lab=GND}
N 3240 -1000 3240 -980 {
lab=amp_en}
N 3320 -900 3420 -900 {lab=voutn5}
N 3320 -860 3420 -860 {lab=voutp5}
N 3420 -860 3480 -860 {lab=voutp5}
N 3420 -900 3580 -900 {lab=voutn5}
N 3420 -640 3420 -560 {lab=voutp5}
N 2880 -760 2880 -640 {lab=#net12}
N 2880 -1120 2880 -1000 {lab=#net13}
N 2880 -820 2880 -760 {lab=#net12}
N 2840 -760 2880 -760 {lab=#net12}
N 2840 -1000 2880 -1000 {lab=#net13}
N 2880 -640 3120 -640 {lab=#net12}
N 3180 -640 3420 -640 {lab=voutp5}
N 3420 -860 3420 -640 {lab=voutp5}
N 3180 -560 3420 -560 {lab=voutp5}
N 2880 -560 3120 -560 {lab=#net12}
N 2880 -640 2880 -560 {lab=#net12}
N 2880 -1120 3120 -1120 {lab=#net13}
N 2880 -1200 2880 -1120 {lab=#net13}
N 2880 -1200 3120 -1200 {lab=#net13}
N 3180 -1200 3420 -1200 {lab=voutn5}
N 3180 -1120 3420 -1120 {lab=voutn5}
N 3420 -1120 3420 -900 {lab=voutn5}
N 3420 -1200 3420 -1120 {lab=voutn5}
N 2740 -880 2740 -760 {lab=Vcm}
N 2700 -1620 2740 -1620 {lab=Vcm}
N 2740 -1740 2740 -1620 {lab=Vcm}
N 2700 -880 2740 -880 {lab=Vcm}
N 2740 -1000 2740 -880 {lab=Vcm}
N 2880 -1000 2880 -940 {lab=#net13}
N 2960 -1680 2980 -1680 {lab=#net14}
N 3120 -1680 3120 -1660 {lab=vmeasp4}
N 3080 -1780 3080 -1760 {lab=GND}
N 2880 -1740 2880 -1680 {lab=#net11}
N 3120 -1660 3140 -1660 {lab=vmeasp4}
N 3040 -1680 3080 -1680 {lab=vmeasp4}
N 3080 -1680 3080 -1660 {lab=vmeasp4}
N 3080 -1480 3080 -1460 {lab=GND}
N 3080 -1560 3120 -1560 {lab=vmeasn4}
N 3040 -1560 3080 -1560 {lab=vmeasn4}
N 3120 -1580 3120 -1560 {lab=vmeasn4}
N 3080 -1580 3080 -1560 {lab=vmeasn4}
N 2960 -1560 2980 -1560 {lab=#net15}
N 3080 -1560 3080 -1540 {lab=vmeasn4}
N 3080 -1700 3080 -1680 {lab=vmeasp4}
N 3080 -740 3080 -720 {lab=GND}
N 3080 -820 3120 -820 {lab=vmeasn5}
N 3040 -820 3080 -820 {lab=vmeasn5}
N 3120 -840 3120 -820 {lab=vmeasn5}
N 3080 -840 3080 -820 {lab=vmeasn5}
N 2960 -820 2980 -820 {lab=#net16}
N 3080 -820 3080 -800 {lab=vmeasn5}
N 3120 -840 3140 -840 {lab=vmeasn5}
N 2880 -820 2900 -820 {lab=#net12}
N 2960 -940 2980 -940 {lab=#net17}
N 3100 -940 3100 -920 {lab=vmeasp5}
N 3080 -1040 3080 -1020 {lab=GND}
N 3080 -940 3100 -940 {lab=vmeasp5}
N 3040 -940 3080 -940 {lab=vmeasp5}
N 3080 -940 3080 -920 {lab=vmeasp5}
N 3080 -960 3080 -940 {lab=vmeasp5}
N 3120 -1580 3140 -1580 {lab=vmeasn4}
N 2880 -1560 2900 -1560 {lab=#net10}
N 2880 -1680 2900 -1680 {lab=#net11}
N 3080 -1680 3120 -1680 {lab=vmeasp4}
N 3100 -920 3140 -920 {lab=vmeasp5}
N 2880 -940 2900 -940 {lab=#net13}
N 3860 -1890 3860 -1870 {
lab=vmeas4}
N 3790 -1860 3820 -1860 {
lab=vmeasp4}
N 3790 -1820 3820 -1820 {
lab=vmeasn4}
N 3860 -1810 3860 -1780 {
lab=GND}
N 3860 -1150 3860 -1130 {
lab=vmeas5}
N 3790 -1120 3820 -1120 {
lab=vmeasp5}
N 3790 -1080 3820 -1080 {
lab=vmeasn5}
N 3860 -1070 3860 -1040 {
lab=GND}
C {devices/code_shown.sym} 3390 -2990 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
"}
C {devices/code_shown.sym} 60 -2390 0 0 {name=NGSPICE
only_toplevel=true 
value="
.param temp=27
.options savecurrents reltol=1e-3 abstol=1e-12 gmin=1e-15
.control
save all

set wr_vecnames
set wr_singlescale

* User Constants
let f_min = 0.01
let f_max = 1G
let fdc = 1
* ===================================================

* Operating Point Analysis
op
remzerovec
write ota-differential_tb-loopgain.raw
set appendwrite
* ===================================================

* AC Analysis
ac dec 101 $&const.f_min $&const.f_max
remzerovec
write ota-differential_tb-loopgain.raw
set appendwrite
* ===================================================

* Rosenstark's method
let L = -v(vr1)/v(vind1)
let L_dB = vdb(L)
let L_arg = 180/PI*cphase(L)

* DC loop gain	
meas ac Ldc_dB find L_dB when frequency = fdc
print Ldc_dB

* Phase margin
meas ac fug find frequency when L_dB=0
meas ac pm find L_arg when frequency=fug
let pm = 180-abs(pm)
print pm
	
* Plotting
plot L_dB L_arg title 'Bode Plot (Rosenstark)' ylabel 'Magnitude (dB), Phase (Deg)'

let L_re = real(L)
let L_im = imag(L)	
plot L_im vs L_re retraceplot title 'Nyquist Plot (Rosenstark)' ylabel 'Imaginary Part' xlabel 'Real Part' 
* ===================================================

* Middlebrook's method
let Tv=-v(vr2)/v(vf2)
let Ti=-(i(Virp3) - i(Virn3))/(i(Vifp3) - i(Vifn3))
let Tmb =(Tv * Ti - 1)/(Tv + Ti + 2)

let Tmb_dB = vdb(Tmb)
let Tmb_arg = 180/PI*cphase(Tmb)

* DC loop gain	
meas ac Tmbdc_dB find Tmb_dB when frequency = fdc
print Tmbdc_dB

* Phase margin
meas ac fug find frequency when Tmb_dB=0
meas ac pm find Tmb_arg when frequency=fug
let pm = 180-abs(pm)
print pm
	
* Plotting
plot Tmb_dB Tmb_arg title 'Bode Plot (Middlebrook)' ylabel 'Magnitude (dB), Phase (Deg)'

let Tmb_re = real(Tmb)
let Tmb_im = imag(Tmb)	
plot Tmb_im vs Tmb_re retraceplot title 'Nyquist Plot (Middlebrook)' ylabel 'Imaginary Part' xlabel 'Real Part' 
* ===================================================

* Tian's Method
* vtest=0, itest=1:
let A=i(Vimeasp5)
let C=v(vmeas5)

* vtest=1, itest=0:
let B=i(Vimeasp4)
let D=v(vmeas4)

let Ttian=(A*D-B*C-A)/(2*(B*C-A*D)+A-D+1)

let Ttian_dB = vdb(Ttian)
let Ttian_arg = 180/PI*cphase(Ttian)

* DC loop gain	
meas ac Ttianbdc_dB find Ttian_dB when frequency = fdc
print Ttianbdc_dB

* Phase margin
meas ac fug find frequency when Ttian_dB=0
meas ac pm find Ttian_arg when frequency=fug
let pm = 180-abs(pm)
print pm

* Plotting
plot Ttian_dB Ttian_arg title 'Bode Plot (Tian)' ylabel 'Magnitude (dB), Phase (Deg)'

let Ttian_re = real(Ttian)
let Ttian_im = imag(Ttian)	
plot Ttian_im vs Ttian_re retraceplot title 'Nyquist Plot (Tian)' ylabel 'Imaginary Part' xlabel 'Real Part' 
* ===================================================

* Rosenstark vs. Middlebrook vs. Tian
plot L_dB Tmb_dB Ttian_dB title 'Rosenstark vs. Middlebrook vs. Tian' ylabel 'Magnitude (dB)'
plot L_arg Tmb_arg Ttian_arg title 'Rosenstark vs. Middlebrook vs. Tian' ylabel 'Phase (Deg)'

* plot L_im vs L_re Tmb_im vs Tmb_re Ttian_im vs Ttian_re retraceplot title 'Rosenstark vs. Middlebrook vs. Tian' ylabel 'Imaginary Part' xlabel 'Real Part'
plot Tmb_im vs Tmb_re Ttian_im vs Ttian_re retraceplot title 'Middlebrook vs. Tian' ylabel 'Imaginary Part' xlabel 'Real Part' 
* ===================================================

*quit
.endc
"}
C {devices/gnd.sym} 2600 -2200 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 3760 -2130 0 0 {name=VDD value=1.5}
C {devices/gnd.sym} 3760 -2060 0 0 {name=l3 lab=GND}
C {devices/launcher.sym} 2950 -3040 0 0 {name=h2
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/capa.sym} 2600 -2290 0 0 {name=C1
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/launcher.sym} 2950 -2920 0 0 {name=h1
descr="Load waves" 
tclcommand="xschem raw_read $netlist_dir/ota-differential_tb-loopgain.raw ac"
}
C {devices/launcher.sym} 2950 -2980 0 0 {name=h3
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/vdd.sym} 3760 -2200 0 0 {name=l7 lab=VDD}
C {devices/vdd.sym} 2340 -2560 0 0 {name=l8 lab=VDD}
C {devices/gnd.sym} 2340 -2280 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 2740 -2400 0 1 {name=p3 sig_type=std_logic lab=voutp1}
C {devices/lab_pin.sym} 2740 -2440 0 1 {name=p4 sig_type=std_logic lab=voutn1}
C {devices/lab_pin.sym} 1640 -2560 0 0 {name=l10 sig_type=std_logic lab=vinp1}
C {devices/lab_pin.sym} 1640 -2280 0 0 {name=l11 sig_type=std_logic lab=vinn1
}
C {devices/lab_pin.sym} 1300 -2440 0 0 {name=l13 sig_type=std_logic lab=vind1}
C {devices/lab_pin.sym} 2240 -2420 0 0 {name=l4 sig_type=std_logic lab=Vcm}
C {devices/lab_pin.sym} 2160 -2560 0 0 {name=l5 sig_type=std_logic lab=vinp1}
C {devices/lab_pin.sym} 2160 -2280 0 0 {name=l19 sig_type=std_logic lab=vinn1
}
C {devices/lab_pin.sym} 2360 -2540 2 0 {name=l24 sig_type=std_logic lab=amp_en}
C {devices/capa.sym} 2700 -2290 0 0 {name=C2
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 2700 -2200 0 0 {name=l30 lab=GND}
C {devices/gnd.sym} 3880 -2060 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 3880 -2200 2 0 {name=l35 sig_type=std_logic lab=amp_en}
C {devices/vsource.sym} 1740 -2350 0 0 {name=Vcm value=0.75
}
C {devices/vcvs.sym} 1640 -2350 0 0 {name=E4 value=0.5}
C {devices/vcvs.sym} 1640 -2490 0 0 {name=E5 value=0.5}
C {devices/lab_pin.sym} 1740 -2440 1 0 {name=l38 sig_type=std_logic lab=Vcm}
C {devices/gnd.sym} 1320 -2280 0 0 {name=l39 lab=GND}
C {devices/gnd.sym} 1740 -2280 0 0 {name=l40 lab=GND}
C {devices/vcvs.sym} 1440 -2420 0 0 {name=E6 value=1}
C {devices/gnd.sym} 1440 -2280 0 0 {name=l41 lab=GND}
C {devices/vsource.sym} 3880 -2130 0 0 {name=V1 value="1.5"}
C {devices/lab_pin.sym} 2740 -2660 0 1 {name=l12 sig_type=std_logic lab=vout1}
C {devices/vcvs.sym} 2740 -2610 0 0 {name=E1 value=1}
C {devices/gnd.sym} 2740 -2560 0 0 {name=l14 lab=GND}
C {devices/lab_pin.sym} 2670 -2590 2 1 {name=l15 sig_type=std_logic lab=voutn1
}
C {devices/lab_pin.sym} 2670 -2630 0 0 {name=l23 sig_type=std_logic lab=voutp1
}
C {devices/vsource.sym} 1320 -2350 0 0 {name=vind1 value="dc 0 ac 1"
}
C {devices/res.sym} 2270 -2740 1 0 {name=R2a
value=10k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 2270 -2100 1 0 {name=R2b
value=10k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 2270 -2660 1 0 {name=C2a
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 2270 -2180 1 1 {name=C2b
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1930 -2540 1 0 {name=C1a
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1930 -2300 1 0 {name=C1b
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 2180 -2510 0 0 {name=C8
m=1
value=1G
footprint=1206
device="ceramic capacitor"}
C {devices/ind.sym} 2090 -2460 1 0 {name=L28
m=1
value=1G
footprint=1206
device=inductor}
C {devices/ind.sym} 2090 -2380 1 0 {name=L16
m=1
value=1G
footprint=1206
device=inductor}
C {devices/capa.sym} 2180 -2330 0 0 {name=C3
m=1
value=1G
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 1740 -2220 0 1 {name=l18 sig_type=std_logic lab=vr1}
C {devices/vcvs.sym} 1740 -2170 0 0 {name=E2 value=1}
C {devices/gnd.sym} 1740 -2120 0 0 {name=l20 lab=GND}
C {devices/lab_pin.sym} 1670 -2150 2 1 {name=l22 sig_type=std_logic lab=vrn1
}
C {devices/lab_pin.sym} 1670 -2190 0 0 {name=l25 sig_type=std_logic lab=vrp1

}
C {devices/lab_pin.sym} 1980 -2460 0 0 {name=l21 sig_type=std_logic lab=vrp1

}
C {devices/lab_pin.sym} 1980 -2380 2 1 {name=l17 sig_type=std_logic lab=vrn1
}
C {devices/gnd.sym} 2100 -1400 0 0 {name=l26 lab=GND}
C {devices/capa.sym} 2100 -1490 0 0 {name=C4
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/vdd.sym} 1840 -1760 0 0 {name=l27 lab=VDD}
C {devices/gnd.sym} 1840 -1480 0 0 {name=l29 lab=GND}
C {devices/lab_pin.sym} 2240 -1600 0 1 {name=p1 sig_type=std_logic lab=voutp2}
C {devices/lab_pin.sym} 2240 -1640 0 1 {name=p2 sig_type=std_logic lab=voutn2}
C {devices/lab_pin.sym} 1740 -1620 0 0 {name=l31 sig_type=std_logic lab=Vcm}
C {devices/lab_pin.sym} 1860 -1740 2 0 {name=l34 sig_type=std_logic lab=amp_en}
C {devices/capa.sym} 2200 -1490 0 0 {name=C5
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 2200 -1400 0 0 {name=l36 lab=GND}
C {devices/lab_pin.sym} 2500 -1670 0 1 {name=l37 sig_type=std_logic lab=vout2}
C {devices/vcvs.sym} 2500 -1620 0 0 {name=E3 value=1}
C {devices/gnd.sym} 2500 -1570 0 0 {name=l42 lab=GND}
C {devices/lab_pin.sym} 2430 -1600 2 1 {name=l43 sig_type=std_logic lab=voutn2
}
C {devices/lab_pin.sym} 2430 -1640 0 0 {name=l44 sig_type=std_logic lab=voutp2
}
C {devices/res.sym} 1770 -1940 1 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1770 -1300 1 0 {name=R2
value=10k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 1770 -1860 1 0 {name=C6
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1770 -1380 1 1 {name=C7
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1430 -1740 1 0 {name=C9
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1430 -1500 1 0 {name=C10
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 2100 -660 0 0 {name=l49 lab=GND}
C {devices/capa.sym} 2100 -750 0 0 {name=C13
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/vdd.sym} 1840 -1020 0 0 {name=l50 lab=VDD}
C {devices/gnd.sym} 1840 -740 0 0 {name=l51 lab=GND}
C {devices/lab_pin.sym} 2240 -860 0 1 {name=p5 sig_type=std_logic lab=voutp3}
C {devices/lab_pin.sym} 2240 -900 0 1 {name=p6 sig_type=std_logic lab=voutn3}
C {devices/lab_pin.sym} 1740 -880 0 0 {name=l52 sig_type=std_logic lab=Vcm}
C {devices/lab_pin.sym} 1860 -1000 2 0 {name=l55 sig_type=std_logic lab=amp_en}
C {devices/capa.sym} 2200 -750 0 0 {name=C14
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 2200 -660 0 0 {name=l56 lab=GND}
C {devices/lab_pin.sym} 2500 -930 0 1 {name=l57 sig_type=std_logic lab=vout3}
C {devices/vcvs.sym} 2500 -880 0 0 {name=E7 value=1}
C {devices/gnd.sym} 2500 -830 0 0 {name=l58 lab=GND}
C {devices/lab_pin.sym} 2430 -860 2 1 {name=l59 sig_type=std_logic lab=voutn3
}
C {devices/lab_pin.sym} 2430 -900 0 0 {name=l60 sig_type=std_logic lab=voutp3
}
C {devices/res.sym} 1770 -1200 1 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1770 -560 1 0 {name=R4
value=10k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 1770 -1120 1 0 {name=C15
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1770 -640 1 1 {name=C16
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1430 -1000 1 0 {name=C17
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1430 -760 1 0 {name=C18
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/title.sym} 180 -60 0 0 {name=l2 author="Simon Dorrer"}
C {devices/lab_pin.sym} 1320 -1620 0 0 {name=l65 sig_type=std_logic lab=Vcm}
C {devices/lab_pin.sym} 1320 -880 0 0 {name=l32 sig_type=std_logic lab=Vcm}
C {devices/lab_pin.sym} 2260 -1890 0 1 {name=l48 sig_type=std_logic lab=vf2}
C {devices/vcvs.sym} 2260 -1840 0 0 {name=E8 value=0.5}
C {devices/gnd.sym} 2260 -1780 0 0 {name=l33 lab=GND}
C {devices/lab_pin.sym} 2190 -1820 2 1 {name=l45 sig_type=std_logic lab=vfn2
}
C {devices/lab_pin.sym} 2190 -1860 0 0 {name=l46 sig_type=std_logic lab=vfp2

}
C {devices/lab_pin.sym} 2500 -1890 0 1 {name=l47 sig_type=std_logic lab=vr2}
C {devices/vcvs.sym} 2500 -1840 0 0 {name=E9 value=0.5}
C {devices/gnd.sym} 2500 -1780 0 0 {name=l53 lab=GND}
C {devices/lab_pin.sym} 2430 -1820 2 1 {name=l54 sig_type=std_logic lab=vrn2
}
C {devices/lab_pin.sym} 2430 -1860 0 0 {name=l61 sig_type=std_logic lab=vrp2

}
C {devices/vsource.sym} 1630 -1660 1 1 {name=Vtestp2 value="dc 0 ac 1"}
C {devices/lab_wire.sym} 1720 -1660 0 0 {name=p9 sig_type=std_logic lab=vfp2}
C {devices/lab_wire.sym} 1560 -1660 0 0 {name=p13 sig_type=std_logic lab=vrp2}
C {devices/vsource.sym} 1630 -1580 1 0 {name=Vtestn2 value="dc 0 ac -1"}
C {devices/lab_wire.sym} 1720 -1580 0 0 {name=p10 sig_type=std_logic lab=vfn2}
C {devices/lab_wire.sym} 1560 -1580 0 0 {name=p11 sig_type=std_logic lab=vrn2}
C {devices/ammeter.sym} 1570 -940 3 1 {name=Virp3 savecurrent=true spice_ignore=0}
C {devices/ammeter.sym} 1670 -940 3 1 {name=Vifp3 savecurrent=true spice_ignore=0}
C {devices/isource.sym} 1620 -770 2 1 {name=Itestn3 value="dc 0 ac -1"}
C {devices/gnd.sym} 1620 -720 0 0 {name=l62 lab=GND}
C {devices/ammeter.sym} 1570 -820 3 0 {name=Virn3 savecurrent=true spice_ignore=0}
C {devices/ammeter.sym} 1670 -820 3 0 {name=Vifn3 savecurrent=true spice_ignore=0}
C {devices/isource.sym} 1620 -990 0 0 {name=Itestp3 value="dc 0 ac 1"}
C {devices/gnd.sym} 1620 -1040 2 0 {name=l63 lab=GND}
C {devices/gnd.sym} 3480 -1400 0 0 {name=l64 lab=GND}
C {devices/capa.sym} 3480 -1490 0 0 {name=C11
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/vdd.sym} 3220 -1760 0 0 {name=l66 lab=VDD}
C {devices/gnd.sym} 3220 -1480 0 0 {name=l67 lab=GND}
C {devices/lab_pin.sym} 3620 -1600 0 1 {name=p7 sig_type=std_logic lab=voutp4}
C {devices/lab_pin.sym} 3620 -1640 0 1 {name=p8 sig_type=std_logic lab=voutn4}
C {devices/lab_pin.sym} 3120 -1620 0 0 {name=l68 sig_type=std_logic lab=Vcm}
C {devices/lab_pin.sym} 3240 -1740 2 0 {name=l69 sig_type=std_logic lab=amp_en}
C {devices/capa.sym} 3580 -1490 0 0 {name=C12
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 3580 -1400 0 0 {name=l70 lab=GND}
C {devices/lab_pin.sym} 3860 -1670 0 1 {name=l71 sig_type=std_logic lab=vout4}
C {devices/vcvs.sym} 3860 -1620 0 0 {name=E10 value=1}
C {devices/gnd.sym} 3860 -1570 0 0 {name=l72 lab=GND}
C {devices/lab_pin.sym} 3790 -1600 2 1 {name=l73 sig_type=std_logic lab=voutn4
}
C {devices/lab_pin.sym} 3790 -1640 0 0 {name=l74 sig_type=std_logic lab=voutp4
}
C {devices/res.sym} 3150 -1940 1 0 {name=R5
value=10k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 3150 -1300 1 0 {name=R6
value=10k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 3150 -1860 1 0 {name=C19
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 3150 -1380 1 1 {name=C20
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 2810 -1740 1 0 {name=C21
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 2810 -1500 1 0 {name=C22
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 3480 -660 0 0 {name=l75 lab=GND}
C {devices/capa.sym} 3480 -750 0 0 {name=C23
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/vdd.sym} 3220 -1020 0 0 {name=l76 lab=VDD}
C {devices/gnd.sym} 3220 -740 0 0 {name=l77 lab=GND}
C {devices/lab_pin.sym} 3620 -860 0 1 {name=p12 sig_type=std_logic lab=voutp5}
C {devices/lab_pin.sym} 3620 -900 0 1 {name=p14 sig_type=std_logic lab=voutn5}
C {devices/lab_pin.sym} 3120 -880 0 0 {name=l78 sig_type=std_logic lab=Vcm}
C {devices/lab_pin.sym} 3240 -1000 2 0 {name=l79 sig_type=std_logic lab=amp_en}
C {devices/capa.sym} 3580 -750 0 0 {name=C24
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 3580 -660 0 0 {name=l80 lab=GND}
C {devices/lab_pin.sym} 3860 -930 0 1 {name=l81 sig_type=std_logic lab=vout5}
C {devices/vcvs.sym} 3860 -880 0 0 {name=E11 value=1}
C {devices/gnd.sym} 3860 -830 0 0 {name=l82 lab=GND}
C {devices/lab_pin.sym} 3790 -860 2 1 {name=l83 sig_type=std_logic lab=voutn5
}
C {devices/lab_pin.sym} 3790 -900 0 0 {name=l84 sig_type=std_logic lab=voutp5
}
C {devices/res.sym} 3150 -1200 1 0 {name=R7
value=10k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 3150 -560 1 0 {name=R8
value=10k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 3150 -1120 1 0 {name=C25
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 3150 -640 1 1 {name=C26
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 2810 -1000 1 0 {name=C27
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 2810 -760 1 0 {name=C28
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 2700 -1620 0 0 {name=l85 sig_type=std_logic lab=Vcm}
C {devices/lab_pin.sym} 2700 -880 0 0 {name=l86 sig_type=std_logic lab=Vcm}
C {devices/vsource.sym} 3010 -1680 1 1 {name=Vtestp4 value="dc 0 ac 1"}
C {devices/ammeter.sym} 2930 -1680 3 0 {name=Vimeasp4 savecurrent=true spice_ignore=0}
C {devices/isource.sym} 3080 -1730 0 0 {name=Itestp4 value="dc 0 ac 0"}
C {devices/gnd.sym} 3080 -1780 2 0 {name=l88 lab=GND}
C {devices/ammeter.sym} 2930 -1560 3 0 {name=Vimeasn4 savecurrent=true spice_ignore=0}
C {devices/vsource.sym} 3010 -1560 1 0 {name=Vtestn4 value="dc 0 ac -1"}
C {devices/lab_wire.sym} 3080 -1660 2 1 {name=p16 sig_type=std_logic lab=vmeasp4}
C {devices/isource.sym} 3080 -1510 2 1 {name=Itestn4 value="dc 0 ac 0"}
C {devices/gnd.sym} 3080 -1460 0 0 {name=l89 lab=GND}
C {devices/lab_wire.sym} 3080 -1580 0 0 {name=p15 sig_type=std_logic lab=vmeasn4}
C {devices/ammeter.sym} 2930 -820 3 0 {name=Vimeasn5 savecurrent=true spice_ignore=0}
C {devices/vsource.sym} 3010 -820 1 0 {name=Vtestn5 value="dc 0 ac 0"}
C {devices/isource.sym} 3080 -770 2 1 {name=Itestn5 value="dc 0 ac -1"}
C {devices/gnd.sym} 3080 -720 0 0 {name=l87 lab=GND}
C {devices/lab_wire.sym} 3080 -840 0 0 {name=p17 sig_type=std_logic lab=vmeasn5}
C {devices/vsource.sym} 3010 -940 1 1 {name=Vtestp5 value="dc 0 ac 0"}
C {devices/ammeter.sym} 2930 -940 3 0 {name=Vimeasp5 savecurrent=true spice_ignore=0}
C {devices/isource.sym} 3080 -990 0 0 {name=Itestp5 value="dc 0 ac 1"}
C {devices/gnd.sym} 3080 -1040 2 0 {name=l90 lab=GND}
C {devices/lab_wire.sym} 3080 -920 2 1 {name=p18 sig_type=std_logic lab=vmeasp5}
C {devices/lab_pin.sym} 3860 -1890 0 1 {name=l91 sig_type=std_logic lab=vmeas4}
C {devices/vcvs.sym} 3860 -1840 0 0 {name=E12 value=0.5}
C {devices/gnd.sym} 3860 -1780 0 0 {name=l92 lab=GND}
C {devices/lab_pin.sym} 3790 -1820 2 1 {name=l93 sig_type=std_logic lab=vmeasn4
}
C {devices/lab_pin.sym} 3790 -1860 0 0 {name=l94 sig_type=std_logic lab=vmeasp4

}
C {devices/lab_pin.sym} 3860 -1150 0 1 {name=l95 sig_type=std_logic lab=vmeas5}
C {devices/vcvs.sym} 3860 -1100 0 0 {name=E13 value=0.5}
C {devices/gnd.sym} 3860 -1040 0 0 {name=l96 lab=GND}
C {devices/lab_pin.sym} 3790 -1080 2 1 {name=l97 sig_type=std_logic lab=vmeasn5
}
C {devices/lab_pin.sym} 3790 -1120 0 0 {name=l98 sig_type=std_logic lab=vmeasp5
}
C {ota-differential.sym} 2340 -2420 0 0 {name=x1}
C {ota-differential.sym} 1840 -1620 0 0 {name=x2}
C {ota-differential.sym} 1840 -880 0 0 {name=x3}
C {ota-differential.sym} 3220 -1620 0 0 {name=x4}
C {ota-differential.sym} 3220 -880 0 0 {name=x5}
