v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
P 4 5 800 -460 1880 -460 1880 -120 800 -120 800 -460 {dash = 4}
P 4 5 800 -920 1880 -920 1880 -580 800 -580 800 -920 {dash = 4}
T {Middlebrook's Method} 800 -500 0 0 0.4 0.4 {}
T {Tian's Method} 800 -960 0 0 0.4 0.4 {}
N 1240 -220 1240 -160 {
lab=GND}
N 880 -220 880 -160 {
lab=GND}
N 1240 -250 1310 -250 {
lab=GND}
N 1310 -250 1310 -160 {
lab=GND}
N 1240 -420 1240 -380 {
lab=v_dd}
N 880 -420 880 -280 {
lab=v_dd}
N 1020 -300 1020 -250 {
lab=vf1}
N 1240 -300 1240 -280 {
lab=vr1}
N 1020 -250 1200 -250 {
lab=vf1}
N 1020 -300 1100 -300 {
lab=vf1}
N 1160 -300 1240 -300 {
lab=vr1}
N 1240 -320 1240 -300 {
lab=vr1}
N 1740 -220 1740 -160 {
lab=GND}
N 1740 -250 1810 -250 {
lab=GND}
N 1810 -250 1810 -160 {
lab=GND}
N 1740 -420 1740 -380 {
lab=v_dd}
N 1520 -300 1520 -250 {
lab=v_gs}
N 1520 -250 1700 -250 {
lab=v_gs}
N 1740 -300 1740 -280 {
lab=#net1}
N 1240 -420 1740 -420 {
lab=v_dd}
N 880 -420 1240 -420 {
lab=v_dd}
N 1520 -300 1540 -300 {
lab=v_gs}
N 1620 -300 1640 -300 {
lab=#net2}
N 1700 -300 1740 -300 {
lab=#net1}
N 1740 -320 1740 -300 {
lab=#net1}
N 1620 -300 1620 -220 {
lab=#net2}
N 1600 -300 1620 -300 {
lab=#net2}
N 1240 -680 1240 -620 {
lab=GND}
N 1240 -710 1310 -710 {
lab=GND}
N 1310 -710 1310 -620 {
lab=GND}
N 1240 -880 1240 -840 {
lab=v_dd}
N 1020 -760 1020 -710 {
lab=vmeas1}
N 1020 -710 1200 -710 {
lab=vmeas1}
N 1240 -760 1240 -740 {
lab=#net3}
N 1740 -680 1740 -620 {
lab=GND}
N 1740 -710 1810 -710 {
lab=GND}
N 1810 -710 1810 -620 {
lab=GND}
N 1740 -880 1740 -840 {
lab=v_dd}
N 1520 -760 1520 -710 {
lab=vmeas2}
N 1520 -710 1700 -710 {
lab=vmeas2}
N 1240 -880 1740 -880 {
lab=v_dd}
N 880 -880 1240 -880 {
lab=v_dd}
N 1020 -710 1020 -690 {lab=vmeas1}
N 1020 -630 1020 -620 {lab=GND}
N 1520 -630 1520 -620 {lab=GND}
N 1520 -710 1520 -690 {lab=vmeas2}
N 1740 -760 1740 -740 {
lab=#net4}
N 980 -710 1020 -710 {lab=vmeas1}
N 1480 -710 1520 -710 {lab=vmeas2}
N 1020 -760 1040 -760 {lab=vmeas1}
N 1100 -760 1140 -760 {lab=#net5}
N 1200 -760 1240 -760 {lab=#net3}
N 1240 -780 1240 -760 {
lab=#net3}
N 1700 -760 1740 -760 {lab=#net4}
N 1740 -780 1740 -760 {
lab=#net4}
N 1600 -760 1640 -760 {lab=#net6}
N 1520 -760 1540 -760 {lab=vmeas2}
C {devices/code_shown.sym} 60 -150 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 60 -1090 0 0 {name=NGSPICE
only_toplevel=true
value="
.param temp=27
.options savecurrents reltol=1e-3 abstol=1e-12 gmin=1e-15
.control
save all

* Operating Point Analysis
op
remzerovec
write mosfet_diode_loopgain.raw
set appendwrite

* AC Analysis
ac dec 1001 10k 100G
remzerovec
write mosfet_diode_loopgain.raw
set appendwrite

* Middlebrook's Method
let tv=-v(vr1)/v(vf1)
let ti=-i(vir1)/i(vif1)
let tmb=(tv*ti - 1)/(tv + ti + 2)

plot db(tmb) ylabel 'Magnitude - Middlebrook'
plot 180/pi*cphase(tmb) ylabel 'Phase - Middlebrook'

* Tian's Method
* vtest=0, itest=1:
let A=i(Vimeas2)
let C=v(vmeas2)

* vtest=1, itest=0:
let B=i(Vimeas1)
let D=v(vmeas1)
let ttian=(A*D-B*C-A)/(2*(B*C-A*D)+A-D+1)

plot db(ttian) ylabel 'Magnitude - Tian'
plot 180/pi*cphase(ttian) ylabel 'Phase - Tian'

* Middlebrook vs. Tian
plot db(tmb) db(ttian) ylabel 'Magnitude'
plot 180/pi*cphase(tmb) 180/pi*cphase(ttian) ylabel 'Phase'

write mosfet_diode_loopgain.raw

*quit
.endc
"}
C {devices/gnd.sym} 1240 -160 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 880 -250 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 880 -160 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 1310 -160 0 0 {name=l4 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 H. Pretl, S. Dorrer, Apache-2.0 license"}
C {sg13g2_pr/sg13_lv_nmos.sym} 1220 -250 0 0 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/isource.sym} 1240 -350 0 0 {name=Ibias1 value=20u}
C {devices/lab_pin.sym} 880 -420 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/vsource.sym} 1130 -300 3 0 {name=Vtest1 value="dc 0 ac 1"}
C {devices/lab_wire.sym} 1060 -300 0 0 {name=p1 sig_type=std_logic lab=vf1}
C {devices/lab_wire.sym} 1210 -300 0 0 {name=p3 sig_type=std_logic lab=vr1}
C {devices/gnd.sym} 1740 -160 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 1810 -160 0 0 {name=l6 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1720 -250 0 0 {name=M2
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/isource.sym} 1740 -350 0 0 {name=Ibias2 value=20u}
C {devices/ammeter.sym} 1670 -300 1 0 {name=Vir1 savecurrent=true spice_ignore=0}
C {devices/ammeter.sym} 1570 -300 1 0 {name=Vif1 savecurrent=true spice_ignore=0}
C {devices/isource.sym} 1620 -190 2 0 {name=Itest1 value="dc 0 ac 1"}
C {devices/gnd.sym} 1620 -160 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 1520 -250 0 0 {name=p4 sig_type=std_logic lab=v_gs}
C {devices/launcher.sym} 860 -1040 0 0 {name=h2
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/launcher.sym} 860 -1100 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/gnd.sym} 1240 -620 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1310 -620 0 0 {name=l10 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1220 -710 0 0 {name=M3
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/isource.sym} 1240 -810 0 0 {name=Ibias3 value=20u}
C {devices/lab_pin.sym} 880 -880 0 0 {name=p5 sig_type=std_logic lab=v_dd}
C {devices/gnd.sym} 1740 -620 0 0 {name=l11 lab=GND}
C {devices/gnd.sym} 1810 -620 0 0 {name=l12 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1720 -710 0 0 {name=M4
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/isource.sym} 1740 -810 0 0 {name=Ibias4 value=20u}
C {devices/isource.sym} 1020 -660 2 0 {name=Itest2 value="dc 0 ac 0"}
C {devices/gnd.sym} 1020 -620 0 0 {name=l9 lab=GND}
C {devices/isource.sym} 1520 -660 2 0 {name=Itest3 value="dc 0 ac 1"}
C {devices/gnd.sym} 1520 -620 0 0 {name=l13 lab=GND}
C {devices/vsource.sym} 1070 -760 3 0 {name=Vtest2 value="dc 0 ac 1"}
C {devices/vsource.sym} 1570 -760 3 0 {name=Vtest3 value="dc 0 ac 0"}
C {devices/lab_wire.sym} 980 -710 0 0 {name=p6 sig_type=std_logic lab=vmeas1}
C {devices/lab_wire.sym} 1480 -710 0 0 {name=p7 sig_type=std_logic lab=vmeas2}
C {devices/ammeter.sym} 1170 -760 1 0 {name=Vimeas1 savecurrent=true spice_ignore=0}
C {devices/ammeter.sym} 1670 -760 1 0 {name=Vimeas2 savecurrent=true spice_ignore=0}
