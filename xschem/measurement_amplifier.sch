v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 960 -710 1840 -270 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1


divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0



linewidth_mult=3
sim_type=ac
color=4
node="\\"vout (dB);vout db20()\\""
x1=1000
x2=1e+09
y1=-8.6
y2=0.045}
N 340 -300 340 -280 {
lab=GND}
N 340 -680 640 -680 {
lab=vdd}
N 340 -680 340 -400 {lab=vdd}
N 640 -680 640 -640 {lab=vdd}
N 800 -340 800 -300 {lab=GND}
N 640 -300 800 -300 {lab=GND}
N 340 -340 340 -300 {
lab=GND}
N 640 -340 640 -300 {lab=GND}
N 480 -300 640 -300 {lab=GND}
N 640 -440 640 -400 {lab=vout}
N 640 -440 800 -440 {lab=vout}
N 640 -480 640 -440 {lab=vout}
N 800 -440 800 -400 {lab=vout}
N 640 -580 640 -540 {lab=#net1}
N 480 -400 480 -300 {lab=GND}
N 340 -300 480 -300 {lab=GND}
N 480 -610 600 -610 {lab=vin}
N 640 -610 720 -610 {lab=vdd}
N 720 -680 720 -610 {lab=vdd}
N 640 -680 720 -680 {lab=vdd}
N 480 -610 480 -560 {lab=vin}
N 480 -500 480 -460 {lab=#net2}
C {devices/code_shown.sym} 0 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 0 -650 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
option sparse
save all
op
write measurement_amplifier.raw
set appendwrite
ac dec 101 1k 1G
let vout_db=20*log10(mag(vout))
meas ac vout_db_max max vout_db
print vout_db_max
write measurement_amplifier.raw
.endc
"}
C {devices/vsource.sym} 340 -370 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 340 -280 0 0 {name=l3 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 H. Pretl, Apache-2.0 license"}
C {devices/launcher.sym} 380 -160 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/res.sym} 800 -370 0 0 {name=Rload
value=50
device=resistor
m=1}
C {devices/res.sym} 640 -370 0 0 {name=R2
value=50
device=resistor
m=1}
C {devices/ammeter.sym} 640 -510 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_lv_pmos.sym} 620 -610 0 0 {name=M1
l=0.13u
w=260u
ng=52
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/vsource.sym} 480 -430 0 0 {name=Vsrc value="dc 0.899 ac 1"}
C {devices/lab_wire.sym} 480 -680 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 560 -610 0 0 {name=p1 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 740 -440 0 0 {name=p2 sig_type=std_logic lab=vout}
C {devices/launcher.sym} 620 -160 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/res.sym} 480 -530 0 0 {name=R1
value=1k
device=resistor
m=1}
C {devices/launcher.sym} 880 -160 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/measurement_amplifier.raw ac"
}
