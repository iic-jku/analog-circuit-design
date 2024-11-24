v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1520 -840 2320 -440 {flags=graph
y1=-1.9e-10
y2=1.7e-10
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.5
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
linewidth_mult=4
color=4
node=i(vout_wo_dummy)}
B 2 1520 -1280 2320 -880 {flags=graph
y1=-2.3e-10
y2=3e-10
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.5
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=i(vout_w_dummy)
color=4
dataset=-1
unitx=1
logx=0
logy=0
linewidth_mult=4}
T {Testbench for Ileak analysis - Parameterizable Transmission Gate} 440 -1690 0 0 1 1 {}
T {TG is OFF!} 1130 -950 0 0 0.5 0.5 {}
N 940 -660 940 -620 {
lab=GND}
N 940 -760 940 -720 {
lab=vin_tg}
N 1280 -760 1280 -720 {
lab=vout_tg_wo_dummy_off}
N 1280 -660 1280 -620 {
lab=GND}
N 940 -760 1020 -760 {
lab=vin_tg}
N 1080 -880 1080 -800 {
lab=VDD}
N 1100 -860 1120 -860 {
lab=GND}
N 1100 -860 1100 -800 {
lab=GND}
N 1280 -760 1320 -760 {
lab=vout_tg_wo_dummy_off}
N 1100 -640 1120 -640 {
lab=VDD}
N 1120 -860 1120 -850 {
lab=GND}
N 1120 -650 1120 -640 {
lab=VDD}
N 1100 -720 1100 -640 {
lab=VDD}
N 1080 -720 1080 -620 {
lab=GND}
N 760 -660 760 -620 {
lab=GND}
N 760 -760 760 -720 {
lab=VDD}
N 1180 -760 1280 -760 {
lab=vout_tg_wo_dummy_off}
N 900 -760 940 -760 {
lab=vin_tg}
N 1080 -1240 1080 -1160 {
lab=VDD}
N 1100 -1220 1120 -1220 {
lab=GND}
N 1100 -1220 1100 -1160 {
lab=GND}
N 1100 -1000 1120 -1000 {
lab=VDD}
N 1120 -1220 1120 -1210 {
lab=GND}
N 1120 -1010 1120 -1000 {
lab=VDD}
N 1100 -1080 1100 -1000 {
lab=VDD}
N 1080 -1080 1080 -980 {
lab=GND}
N 940 -1120 940 -760 {lab=vin_tg}
N 940 -1120 1020 -1120 {lab=vin_tg}
N 1280 -1120 1320 -1120 {lab=vout_tg_w_dummy_off}
N 1280 -1120 1280 -1080 {
lab=vout_tg_w_dummy_off}
N 1280 -1020 1280 -980 {
lab=GND}
N 1180 -1120 1280 -1120 {lab=vout_tg_w_dummy_off}
C {devices/lab_wire.sym} 1320 -760 0 1 {name=p1 sig_type=std_logic lab=vout_tg_wo_dummy_off}
C {devices/vsource.sym} 760 -690 0 0 {name=VDD value="1.5"}
C {devices/gnd.sym} 760 -620 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} 760 -760 0 0 {name=l8 lab=VDD}
C {devices/vsource.sym} 940 -690 0 0 {name=vin value=0.75
}
C {devices/gnd.sym} 1080 -620 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 1080 -880 0 0 {name=l4 lab=VDD}
C {devices/lab_wire.sym} 900 -760 0 0 {name=p2 sig_type=std_logic lab=vin_tg}
C {devices/gnd.sym} 940 -620 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 1280 -690 0 0 {name=vout_wo_dummy value=0.75
}
C {devices/title-3.sym} 0 0 0 0 {name=l7 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/gnd.sym} 1120 -850 0 0 {name=l5 lab=GND}
C {devices/vdd.sym} 1120 -650 0 0 {name=l9 lab=VDD}
C {devices/gnd.sym} 1280 -620 0 0 {name=l3 lab=GND}
C {devices/code_shown.sym} 240 -510 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
"}
C {code_shown.sym} 220 -1330 0 0 {name=NGSPICE
only_toplevel=true
value="
.param temp=27
.options savecurrents
.control
save all

* Operating Point Analysis
op
remzerovec
write transmission_gate_tb_dc_Ileak.raw
set appendwrite

* DC Sweep Analysis with Dummy
dc vin 0 1.5 10m vout_w_dummy 0 1.5 0.75
write transmission_gate_tb_dc_Ileak.raw
set appendwrite

* Off-Leakage Current
let Ileak_w_dummy = i(vout_w_dummy)
plot Ileak_w_dummy

* DC Sweep Analysis without Dummy
dc vin 0 1.5 10m vout_wo_dummy 0 1.5 0.75
write transmission_gate_tb_dc_Ileak.raw

* Off-Leakage Current
let Ileak_wo_dummy = i(vout_wo_dummy)
plot Ileak_wo_dummy

*quit
.endc"}
C {devices/launcher.sym} 1580 -1450 0 0 {name=h2
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 1580 -1330 0 0 {name=h1
descr="Load waves" 
tclcommand="xschem raw_read $netlist_dir/transmission_gate_tb_dc_Ileak.raw dc"
}
C {devices/launcher.sym} 1580 -1390 0 0 {name=h3
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {transmission_gate/transmission_gate_wo_dummy.sym} 1100 -760 0 0 {name=x1 W_P=2.0u L_P=0.13u W_N=2.0u L_N=0.13u}
C {devices/gnd.sym} 1080 -980 0 0 {name=l10 lab=GND}
C {devices/vdd.sym} 1080 -1240 0 0 {name=l11 lab=VDD}
C {devices/gnd.sym} 1120 -1210 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 1120 -1010 0 0 {name=l14 lab=VDD}
C {transmission_gate/transmission_gate_w_dummy.sym} 1100 -1120 0 0 {name=x2 W_P=2.0u L_P=0.13u W_N=2.0u L_N=0.13u W_P_D=1.0u L_P_D=0.13u W_N_D=1.0u L_N_D=0.13u}
C {devices/lab_wire.sym} 1320 -1120 0 1 {name=p3 sig_type=std_logic lab=vout_tg_w_dummy_off}
C {devices/vsource.sym} 1280 -1050 0 0 {name=vout_w_dummy value=0.75
}
C {devices/gnd.sym} 1280 -980 0 0 {name=l12 lab=GND}
