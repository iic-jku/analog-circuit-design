v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 460 -940 1260 -540 {flags=graph
y1=-9.2e-11

ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
x2=1.5
divx=5
subdivx=1
node=i(vd)
color=4
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
autoload=0
y2=0.00091}
N 180 -220 180 -200 {
lab=GND}
N 180 -290 180 -280 {
lab=#net1}
N 310 -260 310 -200 {
lab=GND}
N 440 -260 440 -200 {
lab=GND}
N 310 -290 380 -290 {
lab=GND}
N 380 -290 380 -200 {
lab=GND}
N 310 -400 340 -400 {
lab=#net2}
N 400 -400 440 -400 {
lab=#net3}
N 180 -290 270 -290 {
lab=#net1}
N 310 -400 310 -320 {
lab=#net2}
N 440 -400 440 -320 {
lab=#net3}
C {devices/code_shown.sym} 0 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 0 -900 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.include dc_lv_nmos.save
.control
save all
op
write dc_lv_nmos.raw
set appendwrite
dc Vds 0 1.5 0.01 Vgs 0 1.5 0.1
write dc_lv_nmos.raw
quit
.endc
"}
C {devices/gnd.sym} 310 -200 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 180 -200 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 180 -250 0 0 {name=Vgs value=0.65}
C {devices/vsource.sym} 440 -290 0 0 {name=Vds value=1.5}
C {devices/gnd.sym} 440 -200 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 380 -200 0 0 {name=l4 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2023-2025 Harald Pretl, Apache-2.0 license"}
C {sg13g2_pr/sg13_lv_nmos.sym} 290 -290 0 0 {name=M1
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/ammeter.sym} 370 -400 1 0 {name=Vd}
C {devices/launcher.sym} 640 -300 0 0 {name=h1
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/dc_lv_nmos.raw dc"
}
C {devices/launcher.sym} 640 -340 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 640 -260 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/ngspice_probe.sym} 420 -400 0 0 {name=r1}
C {devices/ngspice_probe.sym} 180 -290 0 0 {name=r3}
C {sg13g2_pr/annotate_fet_params.sym} 180 -490 0 0 {name=annot1 ref=M1}
