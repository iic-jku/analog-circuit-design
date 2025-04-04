v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 860 -780 1700 -440 {flags=graph
y1=-2.3e-19
y2=2e-05
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=3e-10
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color="4 7"
node="i(vibias)
i(vid)"
linewidth_mult=3}
B 2 860 -420 1700 -120 {flags=graph
y1=0
y2=0.61
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=3e-10
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0

color=4
node=v(v_gs)
linewidth_mult=3}
N 570 -340 570 -280 {
lab=GND}
N 340 -340 340 -280 {
lab=GND}
N 570 -370 640 -370 {
lab=GND}
N 640 -370 640 -280 {
lab=GND}
N 340 -680 570 -680 {
lab=v_dd}
N 500 -370 530 -370 {
lab=v_gs}
N 500 -500 570 -500 {
lab=v_gs}
N 500 -500 500 -370 {lab=v_gs}
N 570 -420 570 -400 {lab=#net1}
N 570 -500 570 -480 {lab=v_gs}
N 570 -520 570 -500 {lab=v_gs}
N 570 -600 570 -580 {lab=#net2}
N 340 -680 340 -400 {lab=v_dd}
N 570 -680 570 -660 {lab=v_dd}
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
tran 0.1p 300p
write mosfet_diode_settling.raw
.endc
"}
C {devices/gnd.sym} 570 -280 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 340 -370 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 340 -280 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 640 -280 0 0 {name=l4 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 H. Pretl, Apache-2.0 license"}
C {sg13g2_pr/sg13_lv_nmos.sym} 550 -370 0 0 {name=M1
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
C {devices/isource.sym} 570 -630 0 0 {name=Ibias value="dc 0 pwl(0 0 10p 0 11p 20u 100p 20u 101p 0)"}
C {devices/lab_pin.sym} 500 -370 0 0 {name=p1 sig_type=std_logic lab=v_gs}
C {devices/lab_pin.sym} 340 -680 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/launcher.sym} 620 -160 0 0 {name=h1
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/mosfet_diode_settling.raw"
}
C {devices/spice_probe.sym} 500 -500 0 0 {name=p3 attrs=""}
C {devices/ammeter.sym} 570 -450 0 0 {name=Vid savecurrent=true spice_ignore=0}
C {devices/ammeter.sym} 570 -550 0 0 {name=Vibias savecurrent=true spice_ignore=0}
