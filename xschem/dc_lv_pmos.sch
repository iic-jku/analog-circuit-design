v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 460 -940 1260 -540 {flags=graph
y1=0

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
y2=1m}
N 520 -260 520 -160 {
lab=GND}
N 520 -400 520 -320 {
lab=#net1}
N 420 -400 420 -320 {
lab=#net1}
N 240 -400 240 -380 {
lab=#net1}
N 370 -400 420 -400 {
lab=#net1}
N 420 -400 520 -400 {
lab=#net1}
N 310 -400 310 -320 {
lab=#net1}
N 240 -400 310 -400 {
lab=#net1}
N 240 -320 240 -290 {
lab=#net2}
N 240 -290 270 -290 {
lab=#net2}
N 310 -290 370 -290 {
lab=#net1}
N 370 -400 370 -290 {
lab=#net1}
N 310 -400 370 -400 {
lab=#net1}
N 310 -260 310 -240 {
lab=#net3}
N 310 -180 310 -160 {
lab=#net4}
N 310 -160 420 -160 {
lab=#net4}
N 420 -260 420 -160 {
lab=#net4}
C {devices/code_shown.sym} 0 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 0 -930 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
save all
save @n.xm1.nsg13_lv_pmos[gm]
save @n.xm1.nsg13_lv_pmos[gds]
save @n.xm1.nsg13_lv_pmos[vth]
save @n.xm1.nsg13_lv_pmos[cgg]
save @n.xm1.nsg13_lv_pmos[cgd]
save @n.xm1.nsg13_lv_pmos[vdss]
save @n.xm1.nsg13_lv_pmos[fug]
save @n.xm1.nsg13_lv_pmos[rg]
save @n.xm1.nsg13_lv_pmos[sid]
op
write dc_lv_pmos.raw
set appendwrite
dc Vds 0 1.5 0.01 Vgs 0 1.5 0.1
write dc_lv_pmos.raw
quit
.endc
"}
C {devices/vsource.sym} 240 -350 0 0 {name=Vgs value=0.52}
C {devices/vsource.sym} 420 -290 0 0 {name=Vds value=3.3}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2023-2024 IHP PDK Authors, H. Pretl, Apache-2.0 license"}
C {devices/ammeter.sym} 310 -210 0 0 {name=Vd}
C {devices/launcher.sym} 710 -300 0 0 {name=h1
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/dc_lv_pmos.raw dc"
}
C {devices/launcher.sym} 710 -340 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 710 -260 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/ngspice_get_value.sym} 120 -490 0 1 {name=r2 node=@n.xm1.nsg13_lv_pmos[gds]
descr="gds="}
C {devices/ngspice_probe.sym} 340 -160 0 0 {name=r1}
C {devices/ngspice_probe.sym} 240 -290 0 0 {name=r3}
C {devices/ngspice_get_value.sym} 120 -520 0 1 {name=r4 node=@n.xm1.nsg13_lv_pmos[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 120 -460 0 1 {name=r5 node=v(@n.xm1.nsg13_lv_pmos[vth])
descr="vth="}
C {devices/ngspice_get_value.sym} 220 -520 0 1 {name=r6 node=@n.xm1.nsg13_lv_pmos[cgg]
descr="cgs="}
C {devices/ngspice_get_value.sym} 120 -430 0 1 {name=r7 node=v(@n.xm1.nsg13_lv_pmos[vdss])
descr="vdss(vds_sat)="}
C {devices/ngspice_get_value.sym} 220 -490 0 1 {name=r8 node=v(@n.xm1.nsg13_lv_pmos[fug])
descr="fug(f_t)="}
C {devices/ngspice_get_value.sym} 220 -460 0 1 {name=r9 node=@n.xm1.nsg13_lv_pmos[cgd]
descr="cdg="}
C {devices/ngspice_get_value.sym} 320 -520 0 1 {name=r10 node=v(@n.xm1.nsg13_lv_pmos[sid])
descr="sid="}
C {devices/ngspice_get_value.sym} 220 -430 0 1 {name=r11 node=v(@n.xm1.nsg13_lv_pmos[rg])
descr="rg="}
C {sg13g2_pr/sg13_lv_pmos.sym} 290 -290 0 0 {name=M1
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/vsource.sym} 520 -290 0 0 {name=Vdd value=3.3}
C {devices/gnd.sym} 520 -160 0 0 {name=l4 lab=GND}
