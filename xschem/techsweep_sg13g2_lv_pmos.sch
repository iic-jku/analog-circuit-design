v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 200 -280 200 -230 {
lab=g}
N 200 -230 270 -230 {
lab=g}
N 200 -360 200 -340 {
lab=GND}
N 310 -360 310 -260 {
lab=GND}
N 310 -200 310 -160 {
lab=d}
N 310 -160 460 -160 {
lab=d}
N 460 -200 460 -160 {
lab=d}
N 460 -360 460 -260 {
lab=GND}
N 400 -280 400 -230 {
lab=b}
N 310 -230 400 -230 {
lab=b}
N 400 -360 400 -340 {
lab=GND}
C {devices/code_shown.sym} 0 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 560 -930 0 0 {name=NGSPICE_CTRL only_toplevel=true 
value="
.param temp=27
.param wx=5u lx=0.13u vbx=0
.dc vg 0 1.5 25m vd 0 1.5 25m
.control
option numdgt=3
set wr_singlescale
set wr_vecnames

foreach l_val 0.13u 0.2u 0.3u 0.4u 0.5u 1u 5u 10u
  alterparam lx=$l_val
  foreach vb_val 0 0.4 0.8 1.2
    alterparam vbx=$vb_val
    reset
    run
    wrdata techsweep_sg13_lv_pmos.txt all
    destroy $curplot
    set appendwrite
  end
end
set appendwrite=0

alterparam lx=0.13u
alterparam vbx=0
reset
op
*showmod
show
write techsweep_sg13_lv_pmos.raw
.endc
"}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 Harald Pretl (adapted from Boris Murmann)"}
C {devices/launcher.sym} 710 -240 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 710 -200 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/ngspice_get_value.sym} 120 -490 0 1 {name=r2 node=@n.xm1.nsg13_lv_nmos[gds]
descr="gds="}
C {devices/ngspice_get_value.sym} 120 -520 0 1 {name=r4 node=@n.xm1.nsg13_lv_nmos[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 120 -460 0 1 {name=r5 node=v(@n.xm1.nsg13_lv_nmos[vth])
descr="vth="}
C {devices/ngspice_get_value.sym} 220 -520 0 1 {name=r6 node=@n.xm1.nsg13_lv_nmos[cgg]
descr="cgs="}
C {devices/ngspice_get_value.sym} 120 -430 0 1 {name=r7 node=v(@n.xm1.nsg13_lv_nmos[vdss])
descr="vdss(vds_sat)="}
C {devices/ngspice_get_value.sym} 220 -490 0 1 {name=r8 node=v(@n.xm1.nsg13_lv_nmos[fug])
descr="fug(f_t)="}
C {devices/ngspice_get_value.sym} 220 -460 0 1 {name=r9 node=@n.xm1.nsg13_lv_nmos[cgd]
descr="cdg="}
C {devices/ngspice_get_value.sym} 320 -520 0 1 {name=r10 node=v(@n.xm1.nsg13_lv_nmos[sid])
descr="sid="}
C {devices/ngspice_get_value.sym} 220 -430 0 1 {name=r11 node=v(@n.xm1.nsg13_lv_nmos[rg])
descr="rg="}
C {devices/code_shown.sym} 60 -930 0 0 {name=NGSPICE_SAVE only_toplevel=true 
value="
.save b d g
.save @n.xm1.nsg13_lv_pmos[cgsol]
.save @n.xm1.nsg13_lv_pmos[cgdol]
.save @n.xm1.nsg13_lv_pmos[cdd]
.save @n.xm1.nsg13_lv_pmos[cgb]
.save @n.xm1.nsg13_lv_pmos[cgd]
.save @n.xm1.nsg13_lv_pmos[cgg]
.save @n.xm1.nsg13_lv_pmos[cgs]
.save @n.xm1.nsg13_lv_pmos[css]
.save @n.xm1.nsg13_lv_pmos[gds]
.save @n.xm1.nsg13_lv_pmos[gm]
.save @n.xm1.nsg13_lv_pmos[gmb]
.save @n.xm1.nsg13_lv_pmos[ids]
.save @n.xm1.nsg13_lv_pmos[l]
.save @n.xm1.nsg13_lv_pmos[vth]
.save @n.xm1.nsg13_lv_pmos[vdss]
.save @n.xm1.nsg13_lv_pmos[fug]
.save @n.xm1.nsg13_lv_pmos[sid]
"}
C {sg13g2_pr/sg13_lv_pmos.sym} 290 -230 0 0 {name=M1
l=\{lx\}
w=\{wx\}
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/gnd.sym} 310 -360 2 1 {name=l6 lab=GND}
C {devices/vsource.sym} 460 -230 0 0 {name=vd value=0.75}
C {devices/vsource.sym} 400 -310 2 1 {name=vsb value=\{vbx\}}
C {devices/vsource.sym} 200 -310 0 0 {name=vg value=0.65}
C {devices/gnd.sym} 200 -360 2 1 {name=l7 lab=GND}
C {devices/gnd.sym} 400 -360 2 1 {name=l8 lab=GND}
C {devices/gnd.sym} 460 -360 2 1 {name=l9 lab=GND}
C {devices/lab_wire.sym} 240 -230 0 0 {name=p4 sig_type=std_logic lab=g}
C {devices/lab_wire.sym} 380 -160 0 0 {name=p5 sig_type=std_logic lab=d}
C {devices/lab_wire.sym} 380 -230 0 1 {name=p6 sig_type=std_logic lab=b}
