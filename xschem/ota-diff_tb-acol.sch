v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 500 -780 500 -760 {
lab=GND}
N 580 -780 580 -760 {
lab=GND}
N 580 -860 580 -840 {
lab=v_ss}
N 1040 -820 1080 -820 {
lab=v_dd}
N 1040 -550 1040 -380 {
lab=v_ss}
N 1310 -530 1310 -380 {
lab=v_ss}
N 1140 -610 1310 -610 {
lab=voutp}
N 890 -610 960 -610 {
lab=vinn}
N 690 -510 690 -380 {
lab=v_ss}
N 690 -650 690 -570 {
lab=v_cm}
N 1080 -820 1080 -800 {
lab=v_dd}
N 1080 -740 1080 -710 {
lab=#net1}
N 500 -860 500 -840 {
lab=v_dd}
N 1040 -820 1040 -710 {
lab=v_dd}
N 1080 -400 1080 -380 {
lab=v_ss}
N 1040 -380 1080 -380 {
lab=v_ss}
N 690 -380 1040 -380 {
lab=v_ss}
N 1080 -550 1080 -460 {
lab=v_ena}
N 820 -650 820 -630 {lab=v_cm}
N 690 -650 820 -650 {
lab=v_cm}
N 890 -610 890 -540 {lab=vinn}
N 820 -540 890 -540 {lab=vinn}
N 820 -570 820 -540 {lab=vinn}
N 1400 -570 1400 -380 {
lab=v_ss}
N 1310 -610 1310 -590 {lab=voutp}
N 1310 -380 1400 -380 {lab=v_ss}
N 1080 -380 1310 -380 {
lab=v_ss}
N 1400 -650 1400 -630 {lab=voutn}
N 1040 -1360 1080 -1360 {
lab=v_dd}
N 690 -1050 690 -980 {
lab=v_ss}
N 690 -1190 690 -1110 {
lab=vincm}
N 900 -1190 960 -1190 {
lab=vincm}
N 1080 -1360 1080 -1340 {
lab=v_dd}
N 1080 -1290 1080 -1250 {
lab=#net2}
N 1040 -1360 1040 -1250 {
lab=v_dd}
N 900 -1190 900 -1150 {lab=vincm}
N 690 -1190 900 -1190 {
lab=vincm}
N 1320 -1150 1320 -1130 {lab=voutcmp}
N 1130 -1190 1400 -1190 {lab=voutcmn}
N 1400 -1190 1400 -1170 {lab=voutcmn}
N 900 -1150 960 -1150 {lab=vincm}
N 1560 -1200 1560 -1180 {lab=GND}
N 1400 -1270 1400 -1190 {lab=voutcmn}
N 1560 -1370 1560 -1340 {lab=voutcm}
N 1560 -1370 1620 -1370 {lab=voutcm}
N 1080 -1040 1140 -1040 {lab=v_ena}
N 1080 -1090 1080 -1040 {
lab=v_ena}
N 1130 -650 1400 -650 {lab=voutn}
N 1560 -700 1560 -690 {lab=GND}
N 1560 -790 1560 -760 {lab=vout}
N 1560 -790 1620 -790 {lab=vout}
N 1400 -710 1520 -710 {lab=voutn}
N 1400 -710 1400 -650 {lab=voutn}
N 1310 -750 1520 -750 {lab=voutp}
N 1310 -750 1310 -610 {lab=voutp}
N 1500 -1290 1520 -1290 {lab=GND}
N 1500 -1230 1500 -1200 {lab=GND}
N 1500 -1200 1560 -1200 {lab=GND}
N 1560 -1220 1560 -1200 {lab=GND}
N 1500 -1230 1520 -1230 {lab=GND}
N 1500 -1290 1500 -1230 {lab=GND}
N 1320 -1330 1520 -1330 {lab=voutcmp}
N 1320 -1330 1320 -1150 {lab=voutcmp}
N 1320 -980 1400 -980 {
lab=v_ss}
N 1040 -1090 1040 -980 {lab=v_ss}
N 690 -980 1040 -980 {
lab=v_ss}
N 1400 -1110 1400 -980 {lab=v_ss}
N 1320 -1070 1320 -980 {lab=v_ss}
N 1040 -980 1320 -980 {
lab=v_ss}
N 1400 -1270 1520 -1270 {lab=voutcmn}
N 1140 -1150 1320 -1150 {lab=voutcmp}
N 820 -650 840 -650 {lab=v_cm}
N 900 -650 960 -650 {lab=vinp}
C {devices/code_shown.sym} 0 -180 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"}
C {devices/code_shown.sym} 0 -900 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.include ota-diff_tb-acol.save
.control
option sparse
set filetype=ascii
save all

op
write ota-diff_tb-acol.raw
set appendwrite

ac dec 101 1k 10G
write ota-diff_tb-acol.raw
plot 20*log10(vout)
plot cph(vout)*180/pi
plot 20*log10(voutcm)
plot cph(voutcm)*180/pi

.endc
"}
C {devices/vsource.sym} 500 -810 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 500 -760 0 0 {name=l3 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024-2025 Harald Pretl, Apache-2.0 license"}
C {devices/launcher.sym} 500 -160 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 740 -160 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {lab_pin.sym} 500 -860 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {ota-diff.sym} 1040 -630 0 0 {name=xota}
C {devices/vsource.sym} 580 -810 0 0 {name=Vss value=0}
C {devices/gnd.sym} 580 -760 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 580 -860 0 0 {name=p1 sig_type=std_logic lab=v_ss}
C {capa.sym} 1310 -560 0 0 {name=C1
value=100f}
C {lab_wire.sym} 1260 -610 0 0 {name=p3 sig_type=std_logic lab=voutp}
C {devices/vsource.sym} 690 -540 0 0 {name=Vcm value="dc 0.75"}
C {lab_wire.sym} 750 -650 0 0 {name=p4 sig_type=std_logic lab=v_cm}
C {isource.sym} 1080 -770 0 0 {name=I0 value=20u pwl(0 0 10u 0 11u 20u)"}
C {vsource.sym} 1080 -430 0 0 {name=Venable value=1.5 savecurrent=false}
C {spice_probe.sym} 770 -650 0 0 {name=p5 attrs=""}
C {spice_probe.sym} 1170 -610 0 0 {name=p6 attrs=""}
C {spice_probe.sym} 1080 -470 0 0 {name=p7 attrs=""}
C {lab_wire.sym} 1080 -530 0 0 {name=p8 sig_type=std_logic lab=v_ena}
C {devices/vsource.sym} 820 -600 0 0 {name=Vin value="dc 0 ac 1"}
C {capa.sym} 1400 -600 0 0 {name=C2
value=100f}
C {lab_wire.sym} 1260 -650 0 0 {name=p9 sig_type=std_logic lab=voutn}
C {spice_probe.sym} 1170 -650 0 0 {name=p10 attrs=""}
C {ota-diff.sym} 1040 -1170 0 0 {name=xota1}
C {capa.sym} 1320 -1100 0 0 {name=C3
value=100f}
C {devices/vsource.sym} 690 -1080 0 0 {name=Vcm1 value="dc 0.75 ac 1"}
C {lab_wire.sym} 750 -1190 0 0 {name=p12 sig_type=std_logic lab=vincm}
C {isource.sym} 1080 -1310 0 0 {name=I1 value=20u pwl(0 0 10u 0 11u 20u)"}
C {spice_probe.sym} 810 -1190 0 0 {name=p13 attrs=""}
C {spice_probe.sym} 1170 -1150 0 0 {name=p14 attrs=""}
C {lab_wire.sym} 1140 -1040 0 0 {name=p16 sig_type=std_logic lab=v_ena}
C {capa.sym} 1400 -1140 0 0 {name=C4
value=100f}
C {spice_probe.sym} 1170 -1190 0 0 {name=p18 attrs=""}
C {lab_pin.sym} 690 -980 0 0 {name=p19 sig_type=std_logic lab=v_ss}
C {lab_pin.sym} 1040 -1360 0 0 {name=p20 sig_type=std_logic lab=v_dd}
C {vcvs.sym} 1560 -1250 0 0 {name=E1 value=0.5}
C {devices/gnd.sym} 1560 -1180 0 0 {name=l2 lab=GND}
C {spice_probe.sym} 1620 -1370 0 0 {name=p11 attrs=""}
C {lab_wire.sym} 1610 -1370 0 0 {name=p17 sig_type=std_logic lab=voutcm}
C {lab_pin.sym} 1040 -820 0 0 {name=p15 sig_type=std_logic lab=v_dd}
C {lab_pin.sym} 690 -380 0 0 {name=p21 sig_type=std_logic lab=v_ss}
C {vcvs.sym} 1560 -730 0 0 {name=E2 value=1}
C {devices/gnd.sym} 1560 -690 0 0 {name=l4 lab=GND}
C {spice_probe.sym} 1620 -790 0 0 {name=p22 attrs=""}
C {lab_wire.sym} 1610 -790 0 0 {name=p23 sig_type=std_logic lab=vout}
C {lab_wire.sym} 1270 -1150 0 0 {name=p24 sig_type=std_logic lab=voutcmp}
C {lab_wire.sym} 1270 -1190 0 0 {name=p25 sig_type=std_logic lab=voutcmn}
C {vcvs.sym} 1560 -1310 0 0 {name=E3 value=0.5}
C {lab_wire.sym} 930 -650 0 0 {name=p26 sig_type=std_logic lab=vinp}
C {lab_wire.sym} 930 -610 0 0 {name=p27 sig_type=std_logic lab=vinn}
C {devices/vsource.sym} 870 -650 3 0 {name=Vin1 value="0"}
