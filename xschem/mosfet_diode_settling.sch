v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 820 -690 1660 -450 {flags=graph
y1=0
y2=2e-05
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=2e-10
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color=4
node=i(@ibias[current])
linewidth_mult=3}
B 2 820 -410 1660 -160 {flags=graph
y1=0
y2=0.61
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=2e-10
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0

color=4
node=v_gs
linewidth_mult=3}
N 610 -340 610 -280 {
lab=GND}
N 380 -340 380 -280 {
lab=GND}
N 610 -370 680 -370 {
lab=GND}
N 680 -370 680 -280 {
lab=GND}
N 380 -640 610 -640 {
lab=v_dd}
N 610 -420 610 -400 {
lab=v_gs}
N 540 -370 570 -370 {
lab=v_gs}
N 540 -420 540 -370 {
lab=v_gs}
N 540 -420 610 -420 {
lab=v_gs}
N 380 -640 380 -400 {
lab=v_dd}
N 610 -640 610 -620 {
lab=v_dd}
N 610 -560 610 -420 {
lab=v_gs}
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
save i(ibias)
tran 0.1p 200p
write mosfet_diode_settling.raw
.endc
"}
C {devices/gnd.sym} 610 -280 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 380 -370 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 380 -280 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 680 -280 0 0 {name=l4 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Copyright 2024 Harald Pretl"}
C {sg13g2_pr/sg13_lv_nmos.sym} 590 -370 2 1 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/launcher.sym} 380 -160 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {isource.sym} 610 -590 0 0 {name=Ibias value="dc 0 pwl(0 0 10p 0 11p 20u 70p 20u 71p 0)"}
C {lab_pin.sym} 540 -420 0 0 {name=p1 sig_type=std_logic lab=v_gs}
C {lab_pin.sym} 380 -640 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/launcher.sym} 620 -160 0 0 {name=h1
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/mosfet_diode_settling.raw"
}
C {spice_probe.sym} 560 -420 0 0 {name=p3 attrs=""}
