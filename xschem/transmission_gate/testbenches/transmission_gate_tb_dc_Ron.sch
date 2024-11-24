v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1560 -1240 2360 -840 {flags=graph
y1=250
y2=1600
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
hilight_wave=-1
color=4
node="\\"r_w_dummy_on; vout_tg_w_dummy_on vin_tg - i(vds_x2) /\\""
linewidth_mult=4}
B 2 1560 -800 2360 -400 {flags=graph
y1=250
y2=1600
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
hilight_wave=-1
color=4
node="\\"r_wo_dummy_on; vout_tg_wo_dummy_on vin_tg - i(vds_x1) /\\""
linewidth_mult=4}
T {Testbench for Ron analysis - Parameterizable Transmission Gate} 400 -1690 0 0 1 1 {}
T {TG is ON!} 1180 -900 0 0 0.5 0.5 {}
N 920 -760 920 -680 {
lab=vin_tg}
N 1000 -760 1040 -760 {
lab=vin_tg}
N 1200 -760 1300 -760 {
lab=vout_tg_wo_dummy_on}
N 1000 -760 1000 -540 {
lab=vin_tg}
N 920 -760 1000 -760 {
lab=vin_tg}
N 920 -620 920 -560 {
lab=GND}
N 1000 -540 1090 -540 {
lab=vin_tg}
N 1150 -540 1300 -540 {
lab=vout_tg_wo_dummy_on}
N 1100 -840 1100 -800 {
lab=VDD}
N 1100 -840 1120 -840 {
lab=VDD}
N 1100 -880 1100 -840 {
lab=VDD}
N 1120 -840 1120 -800 {
lab=VDD}
N 1100 -680 1100 -640 {
lab=GND}
N 1120 -720 1120 -680 {
lab=GND}
N 1100 -680 1120 -680 {
lab=GND}
N 1100 -720 1100 -680 {
lab=GND}
N 760 -620 760 -560 {
lab=GND}
N 760 -740 760 -680 {
lab=VDD}
N 1300 -760 1300 -540 {
lab=vout_tg_wo_dummy_on}
N 1300 -760 1340 -760 {
lab=vout_tg_wo_dummy_on}
N 880 -760 920 -760 {
lab=vin_tg}
N 1000 -1180 1040 -1180 {
lab=vin_tg}
N 1200 -1180 1300 -1180 {
lab=vout_tg_w_dummy_on}
N 1000 -1180 1000 -960 {
lab=vin_tg}
N 1000 -960 1090 -960 {
lab=vin_tg}
N 1150 -960 1300 -960 {
lab=vout_tg_w_dummy_on}
N 1100 -1260 1100 -1220 {
lab=VDD}
N 1100 -1260 1120 -1260 {
lab=VDD}
N 1100 -1300 1100 -1260 {
lab=VDD}
N 1120 -1260 1120 -1220 {
lab=VDD}
N 1100 -1100 1100 -1060 {
lab=GND}
N 1120 -1140 1120 -1100 {
lab=GND}
N 1100 -1100 1120 -1100 {
lab=GND}
N 1100 -1140 1100 -1100 {
lab=GND}
N 1300 -1180 1300 -960 {
lab=vout_tg_w_dummy_on}
N 1300 -1180 1340 -1180 {
lab=vout_tg_w_dummy_on}
N 920 -1180 1000 -1180 {
lab=vin_tg}
N 920 -1180 920 -760 {lab=vin_tg}
C {devices/lab_wire.sym} 1340 -760 0 1 {name=p1 sig_type=std_logic lab=vout_tg_wo_dummy_on}
C {devices/vsource.sym} 760 -650 0 0 {name=VDD value="1.5"}
C {devices/gnd.sym} 760 -560 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} 760 -740 0 0 {name=l8 lab=VDD}
C {devices/vsource.sym} 920 -650 0 0 {name=vin value=0
}
C {devices/gnd.sym} 1100 -640 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 1100 -880 0 0 {name=l4 lab=VDD}
C {devices/lab_wire.sym} 880 -760 0 0 {name=p2 sig_type=std_logic lab=vin_tg}
C {devices/gnd.sym} 920 -560 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 1120 -540 3 0 {name=vds_x1 value=1mV
}
C {devices/title-3.sym} 0 0 0 0 {name=l7 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/code_shown.sym} 140 -470 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
"}
C {devices/launcher.sym} 1620 -1410 0 0 {name=h2
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 1620 -1290 0 0 {name=h1
descr="Load waves" 
tclcommand="xschem raw_read $netlist_dir/transmission_gate_tb_dc_Ron.raw dc"
}
C {devices/launcher.sym} 1620 -1350 0 0 {name=h3
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {code_shown.sym} 140 -1410 0 0 {name=NGSPICE
only_toplevel=true
value="
.param temp=27
.options savecurrents
.control
save all

* Operating Point Analysis
op
remzerovec
write transmission_gate_tb_dc_Ron.raw
set appendwrite

* DC Sweep Analysis
dc vin 0 1.5 0.01
write transmission_gate_tb_dc_Ron.raw

* On-Resistance
let r_w_dummy_on = (v(vout_tg_w_dummy_on)-v(vin_tg))/I(vds_x2)
plot r_w_dummy_on xlabel 'Vin in V' ylabel 'Ron with Dummy in Ohm'

let r_wo_dummy_on = (v(vout_tg_wo_dummy_on)-v(vin_tg))/I(vds_x1)
plot r_wo_dummy_on xlabel 'Vin in V' ylabel 'Ron without Dummy in Ohm'

*quit
.endc"}
C {transmission_gate/transmission_gate_wo_dummy.sym} 1120 -760 0 0 {name=x1 W_P=2.0u L_P=0.13u W_N=2.0u L_N=0.13u}
C {devices/lab_wire.sym} 1340 -1180 0 1 {name=p3 sig_type=std_logic lab=vout_tg_w_dummy_on}
C {devices/gnd.sym} 1100 -1060 0 0 {name=l3 lab=GND}
C {devices/vdd.sym} 1100 -1300 0 0 {name=l5 lab=VDD}
C {devices/vsource.sym} 1120 -960 3 0 {name=vds_x2 value=1mV
}
C {transmission_gate/transmission_gate_w_dummy.sym} 1120 -1180 0 0 {name=x2 W_P=2.0u L_P=0.13u W_N=2.0u L_N=0.13u W_P_D=1.0u L_P_D=0.13u W_N_D=1.0u L_N_D=0.13u}
