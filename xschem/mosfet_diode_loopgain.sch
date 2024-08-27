v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 880 -340 880 -280 {
lab=GND}
N 520 -340 520 -280 {
lab=GND}
N 880 -370 950 -370 {
lab=GND}
N 950 -370 950 -280 {
lab=GND}
N 880 -540 880 -500 {
lab=v_dd}
N 520 -540 520 -400 {
lab=v_dd}
N 660 -420 660 -370 {
lab=vf}
N 880 -420 880 -400 {
lab=vr}
N 660 -370 840 -370 {
lab=vf}
N 660 -420 740 -420 {
lab=vf}
N 800 -420 880 -420 {
lab=vr}
N 880 -440 880 -420 {
lab=vr}
N 1380 -340 1380 -280 {
lab=GND}
N 1380 -370 1450 -370 {
lab=GND}
N 1450 -370 1450 -280 {
lab=GND}
N 1380 -540 1380 -500 {
lab=v_dd}
N 1160 -420 1160 -370 {
lab=v_gs}
N 1160 -370 1340 -370 {
lab=v_gs}
N 1380 -420 1380 -400 {
lab=#net1}
N 880 -540 1380 -540 {
lab=v_dd}
N 520 -540 880 -540 {
lab=v_dd}
N 1160 -420 1180 -420 {
lab=v_gs}
N 1260 -420 1280 -420 {
lab=#net2}
N 1340 -420 1380 -420 {
lab=#net1}
N 1380 -440 1380 -420 {
lab=#net1}
N 1260 -420 1260 -340 {
lab=#net2}
N 1240 -420 1260 -420 {
lab=#net2}
C {devices/code_shown.sym} 0 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 0 -490 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
save all
op
ac dec 101 30k 30G
let tv=-v(vr)/v(vf)
let ti=-i(vir)/i(vif)
let t=(tv*ti - 1)/(tv + ti + 2)
plot db(t)
plot 180/pi*ph(t)
write mosfet_diode_loopgain.raw
.endc
"}
C {devices/gnd.sym} 880 -280 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 520 -370 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 520 -280 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 950 -280 0 0 {name=l4 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Copyright 2024 Harald Pretl"}
C {sg13g2_pr/sg13_lv_nmos.sym} 860 -370 2 1 {name=M1
l=0.13u
w=1u
ng=1
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
C {isource.sym} 880 -470 0 0 {name=Ibias1 value=20u}
C {lab_pin.sym} 520 -540 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/vsource.sym} 770 -420 3 0 {name=Vtest value="dc 0 ac 1"}
C {lab_wire.sym} 700 -420 0 0 {name=p1 sig_type=std_logic lab=vf}
C {lab_wire.sym} 850 -420 0 0 {name=p3 sig_type=std_logic lab=vr}
C {devices/gnd.sym} 1380 -280 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 1450 -280 0 0 {name=l6 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1360 -370 2 1 {name=M2
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {isource.sym} 1380 -470 0 0 {name=Ibias2 value=20u}
C {ammeter.sym} 1310 -420 1 0 {name=Vir savecurrent=true spice_ignore=0}
C {ammeter.sym} 1210 -420 1 0 {name=Vif savecurrent=true spice_ignore=0}
C {isource.sym} 1260 -310 2 0 {name=Itest value="dc 0 ac 1"}
C {devices/gnd.sym} 1260 -280 0 0 {name=l7 lab=GND}
C {lab_wire.sym} 1160 -370 0 0 {name=p4 sig_type=std_logic lab=v_gs}
