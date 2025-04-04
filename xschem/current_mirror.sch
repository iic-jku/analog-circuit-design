v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 380 -300 380 -280 {
lab=GND}
N 540 -370 610 -370 {
lab=GND}
N 380 -540 380 -400 {
lab=v_dd}
N 380 -540 610 -540 {
lab=v_dd}
N 610 -420 610 -400 {
lab=v_gs}
N 650 -370 680 -370 {
lab=v_gs}
N 680 -420 680 -370 {
lab=v_gs}
N 610 -420 680 -420 {
lab=v_gs}
N 610 -540 610 -520 {
lab=v_dd}
N 610 -460 610 -420 {
lab=v_gs}
N 820 -370 890 -370 {
lab=GND}
N 1060 -370 1130 -370 {
lab=GND}
N 1320 -370 1390 -370 {
lab=GND}
N 1260 -370 1280 -370 {
lab=v_gs}
N 1000 -370 1020 -370 {
lab=v_gs}
N 760 -370 780 -370 {
lab=v_gs}
N 760 -420 760 -370 {
lab=v_gs}
N 380 -300 540 -300 {
lab=GND}
N 380 -340 380 -300 {
lab=GND}
N 540 -370 540 -300 {
lab=GND}
N 540 -300 610 -300 {
lab=GND}
N 610 -340 610 -300 {
lab=GND}
N 610 -300 820 -300 {
lab=GND}
N 820 -340 820 -300 {
lab=GND}
N 820 -300 890 -300 {
lab=GND}
N 890 -370 890 -300 {
lab=GND}
N 1060 -340 1060 -300 {
lab=GND}
N 940 -300 1060 -300 {
lab=GND}
N 940 -320 940 -300 {
lab=GND}
N 890 -300 940 -300 {
lab=GND}
N 1060 -300 1130 -300 {
lab=GND}
N 1130 -370 1130 -300 {
lab=GND}
N 1180 -300 1320 -300 {
lab=GND}
N 1320 -340 1320 -300 {
lab=GND}
N 1320 -300 1390 -300 {
lab=GND}
N 1390 -370 1390 -300 {
lab=GND}
N 1260 -420 1260 -370 {
lab=v_gs}
N 680 -420 760 -420 {
lab=v_gs}
N 1000 -420 1000 -370 {
lab=v_gs}
N 760 -420 1000 -420 {
lab=v_gs}
N 820 -520 940 -520 {
lab=out1}
N 940 -520 940 -380 {
lab=out1}
N 1180 -320 1180 -300 {
lab=GND}
N 1130 -300 1180 -300 {
lab=GND}
N 1180 -520 1180 -370 {
lab=out2}
N 1060 -520 1180 -520 {
lab=out2}
N 1000 -420 1260 -420 {
lab=v_gs}
N 1320 -520 1440 -520 {
lab=out3}
N 1440 -520 1440 -380 {
lab=out3}
N 1440 -320 1440 -300 {
lab=GND}
N 1390 -300 1440 -300 {
lab=GND}
N 820 -440 820 -400 {
lab=#net1}
N 820 -520 820 -500 {
lab=out1}
N 1060 -440 1060 -400 {
lab=#net2}
N 1060 -520 1060 -500 {
lab=out2}
N 1320 -440 1320 -400 {
lab=#net3}
N 1320 -520 1320 -500 {
lab=out3}
C {devices/code_shown.sym} 0 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 0 -550 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
save all

op
write current_mirror.raw
dc Vout1 0 1.5 10m
plot i(viout1) vs v(out1)
dc Vout2 0 1.5 10m
plot i(viout2) vs v(out2)
dc Vout3 0 1.5 10m
plot i(viout3) vs v(out3)

.endc
"}
C {devices/vsource.sym} 380 -370 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 380 -280 0 0 {name=l3 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 H. Pretl, Apache-2.0 license"}
C {sg13g2_pr/sg13_lv_nmos.sym} 630 -370 0 1 {name=M1
l=0.13u
w=1u
ng=2
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/launcher.sym} 500 -160 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 740 -160 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/isource.sym} 610 -490 0 0 {name=Ibias value=20u}
C {devices/lab_pin.sym} 680 -370 0 1 {name=p1 sig_type=std_logic lab=v_gs}
C {devices/lab_pin.sym} 380 -540 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {sg13g2_pr/sg13_lv_nmos.sym} 800 -370 0 0 {name=M2
l=0.13u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1040 -370 0 0 {name=M3
l=0.13u
w=1u
ng=2
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1300 -370 0 0 {name=M4
l=0.13u
w=2u
ng=4
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/vsource.sym} 940 -350 0 0 {name=Vout1 value=0.6
}
C {devices/vsource.sym} 1180 -350 0 0 {name=Vout2 value=0.6}
C {devices/vsource.sym} 1440 -350 0 0 {name=Vout3 value=0.6}
C {devices/spice_probe.sym} 820 -520 0 0 {name=p3 attrs=""}
C {devices/spice_probe.sym} 1060 -520 0 0 {name=p4 attrs=""}
C {devices/spice_probe.sym} 1320 -520 0 0 {name=p5 attrs=""}
C {devices/spice_probe.sym} 700 -420 0 0 {name=p6 attrs=""}
C {devices/lab_pin.sym} 940 -520 0 1 {name=p7 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} 1180 -520 0 1 {name=p8 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 1440 -520 0 1 {name=p9 sig_type=std_logic lab=out3}
C {devices/ammeter.sym} 820 -470 0 0 {name=Viout1 savecurrent=true spice_ignore=0}
C {devices/ammeter.sym} 1060 -470 0 0 {name=Viout2 savecurrent=true spice_ignore=0}
C {devices/ammeter.sym} 1320 -470 0 0 {name=Viout3 savecurrent=true spice_ignore=0}
