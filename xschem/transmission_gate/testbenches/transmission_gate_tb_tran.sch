v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1520 -940 2320 -540 {flags=graph
y1=0.00011
y2=1.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.004
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vin_tg
vout_tg_on
vout_tg_off"
color="4 5 6"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
linewidth_mult=4}
T {Testbench for transient analysis - Parameterizable Transmission Gate} 400 -1690 0 0 1 1 {}
T {TG is ON!} 1180 -1160 0 0 0.5 0.5 {}
T {TG is OFF!} 1180 -835 0 0 0.5 0.5 {}
N 860 -860 860 -820 {
lab=vin_tg}
N 1100 -820 1100 -740 {
lab=VDD}
N 980 -1020 1040 -1020 {
lab=vin_tg}
N 980 -700 1040 -700 {
lab=vin_tg}
N 980 -860 980 -700 {
lab=vin_tg}
N 980 -1020 980 -860 {
lab=vin_tg}
N 860 -860 980 -860 {
lab=vin_tg}
N 1300 -700 1340 -700 {
lab=vout_tg_off}
N 1100 -1100 1100 -1060 {
lab=VDD}
N 1140 -800 1140 -790 {
lab=GND}
N 1120 -800 1140 -800 {
lab=GND}
N 1120 -800 1120 -740 {
lab=GND}
N 1120 -580 1140 -580 {
lab=VDD}
N 1140 -590 1140 -580 {
lab=VDD}
N 1300 -1020 1340 -1020 {
lab=vout_tg_on}
N 1100 -1100 1120 -1100 {
lab=VDD}
N 1100 -1140 1100 -1100 {
lab=VDD}
N 1120 -1100 1120 -1060 {
lab=VDD}
N 1100 -940 1100 -900 {
lab=GND}
N 1120 -980 1120 -940 {
lab=GND}
N 1100 -940 1120 -940 {
lab=GND}
N 1100 -980 1100 -940 {
lab=GND}
N 1120 -660 1120 -580 {
lab=VDD}
N 1100 -660 1100 -560 {
lab=GND}
N 860 -760 860 -720 {
lab=GND}
N 820 -860 860 -860 {
lab=vin_tg}
N 700 -860 700 -820 {
lab=VDD}
N 700 -760 700 -720 {
lab=GND}
N 1300 -1020 1300 -980 {
lab=vout_tg_on}
N 1200 -1020 1300 -1020 {
lab=vout_tg_on}
N 1300 -920 1300 -900 {
lab=GND}
N 1300 -580 1300 -560 {
lab=GND}
N 1300 -700 1300 -640 {
lab=vout_tg_off}
N 1200 -700 1300 -700 {
lab=vout_tg_off}
C {devices/lab_wire.sym} 1340 -1020 0 1 {name=p1 sig_type=std_logic lab=vout_tg_on}
C {devices/vsource.sym} 700 -790 0 0 {name=VDD value="1.5"}
C {devices/gnd.sym} 700 -720 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} 700 -860 0 0 {name=l8 lab=VDD}
C {devices/vsource.sym} 860 -790 0 0 {name=vin value="sin(0.75 0.75 1k)"
}
C {devices/gnd.sym} 1100 -900 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 1100 -1140 0 0 {name=l4 lab=VDD}
C {devices/lab_wire.sym} 820 -860 0 0 {name=p2 sig_type=std_logic lab=vin_tg}
C {devices/gnd.sym} 860 -720 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 1340 -700 0 1 {name=p3 sig_type=std_logic lab=vout_tg_off}
C {devices/gnd.sym} 1100 -560 0 0 {name=l9 lab=GND}
C {devices/vdd.sym} 1100 -820 0 0 {name=l11 lab=VDD}
C {devices/gnd.sym} 1140 -790 0 0 {name=l12 lab=GND}
C {devices/vdd.sym} 1140 -590 0 0 {name=l14 lab=VDD}
C {devices/title-3.sym} 0 0 0 0 {name=l3 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/code_shown.sym} 240 -610 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
"}
C {devices/launcher.sym} 1580 -1110 0 0 {name=h2
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 1580 -990 0 0 {name=h1
descr="Load waves" 
tclcommand="xschem raw_read $netlist_dir/transmission_gate_tb_tran.raw tran"
}
C {devices/launcher.sym} 1580 -1050 0 0 {name=h3
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {code_shown.sym} 240 -1110 0 0 {name=NGSPICE
only_toplevel=true
value="
.param temp=27
.options savecurrents
.control
save all

* Operating Point Analysis
op
remzerovec
write transmission_gate_tb_tran.raw
set appendwrite

* Transient Analysis
tran 10u 4ms
write transmission_gate_tb_tran.raw

plot vin_tg vout_tg_on vout_tg_off

*quit
.endc"}
C {devices/capa.sym} 1300 -950 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1300 -610 0 0 {name=C2
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1300 -560 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 1300 -900 0 0 {name=l7 lab=GND}
C {transmission_gate/transmission_gate_wo_dummy.sym} 1120 -1020 0 0 {name=x1 W_P=3.0u L_P=0.13u W_N=1.0u L_N=0.13u}
C {transmission_gate/transmission_gate_wo_dummy.sym} 1120 -700 0 0 {name=x2 W_P=3.0u L_P=0.13u W_N=1.0u L_N=0.13u}
