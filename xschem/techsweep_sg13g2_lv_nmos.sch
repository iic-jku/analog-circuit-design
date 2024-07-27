v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 310 -260 310 -160 {
lab=GND}
N 310 -290 380 -290 {
lab=b}
N 310 -400 440 -400 {
lab=d}
N 180 -290 270 -290 {
lab=g}
N 310 -400 310 -320 {
lab=d}
N 440 -400 440 -320 {
lab=d}
N 380 -180 380 -160 {
lab=GND}
N 380 -290 380 -240 {
lab=b}
N 440 -260 440 -160 {
lab=GND}
N 180 -290 180 -240 {
lab=g}
N 180 -180 180 -160 {
lab=GND}
C {devices/code_shown.sym} 0 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 560 -950 0 0 {name=NGSPICE_CTRL only_toplevel=true 
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
    wrdata techsweep_sg13_lv_nmos.txt all
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
write techsweep_sg13_lv_nmos.raw
.endc
"}
C {devices/gnd.sym} 310 -160 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 180 -160 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 180 -210 0 0 {name=vg value=0.65}
C {devices/vsource.sym} 440 -290 0 0 {name=vd value=0.75}
C {devices/gnd.sym} 440 -160 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 380 -160 0 0 {name=l4 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 Harald Pretl (adapted from Boris Murmann)"}
C {sg13g2_pr/sg13_lv_nmos.sym} 290 -290 2 1 {name=M1
l=\{lx\}
w=\{wx\}
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
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
C {devices/vsource.sym} 380 -210 2 1 {name=vsb value=\{vbx\}}
C {devices/lab_wire.sym} 180 -290 0 0 {name=p1 sig_type=std_logic lab=g}
C {devices/lab_wire.sym} 310 -400 0 0 {name=p2 sig_type=std_logic lab=d}
C {devices/lab_wire.sym} 380 -290 0 1 {name=p3 sig_type=std_logic lab=b}
C {devices/code_shown.sym} 60 -950 0 0 {name=NGSPICE_SAVE only_toplevel=true 
value="
.save b d g
.save @n.xm1.nsg13_lv_nmos[cgsol]
.save @n.xm1.nsg13_lv_nmos[cgdol]
.save @n.xm1.nsg13_lv_nmos[cdd]
.save @n.xm1.nsg13_lv_nmos[cgb]
.save @n.xm1.nsg13_lv_nmos[cgd]
.save @n.xm1.nsg13_lv_nmos[cgg]
.save @n.xm1.nsg13_lv_nmos[cgs]
.save @n.xm1.nsg13_lv_nmos[css]
.save @n.xm1.nsg13_lv_nmos[gds]
.save @n.xm1.nsg13_lv_nmos[gm]
.save @n.xm1.nsg13_lv_nmos[gmb]
.save @n.xm1.nsg13_lv_nmos[ids]
.save @n.xm1.nsg13_lv_nmos[l]
.save @n.xm1.nsg13_lv_nmos[vth]
.save @n.xm1.nsg13_lv_nmos[vdss]
.save @n.xm1.nsg13_lv_nmos[fug]
.save @n.xm1.nsg13_lv_nmos[sid]
.save @n.xm1.nsg13_lv_nmos[cjd]
.save @n.xm1.nsg13_lv_nmos[cjs]
"}
