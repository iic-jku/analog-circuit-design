v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 440 -220 440 -200 {
lab=GND}
N 440 -290 440 -280 {
lab=#net1}
N 570 -260 570 -200 {
lab=GND}
N 700 -260 700 -200 {
lab=GND}
N 570 -290 640 -290 {
lab=GND}
N 640 -290 640 -200 {
lab=GND}
N 570 -400 700 -400 {
lab=#net2}
N 440 -290 530 -290 {
lab=#net1}
N 570 -400 570 -320 {
lab=#net2}
N 700 -400 700 -320 {
lab=#net2}
N 820 -220 820 -200 {
lab=GND}
N 820 -290 820 -280 {
lab=#net3}
N 950 -260 950 -200 {
lab=GND}
N 1080 -260 1080 -200 {
lab=GND}
N 950 -290 1020 -290 {
lab=GND}
N 1020 -290 1020 -200 {
lab=GND}
N 820 -290 910 -290 {
lab=#net3}
N 950 -400 950 -320 {
lab=#net4}
N 1080 -400 1080 -320 {
lab=#net4}
N 1200 -220 1200 -200 {
lab=GND}
N 1200 -290 1200 -280 {
lab=#net5}
N 1330 -260 1330 -200 {
lab=GND}
N 1460 -260 1460 -200 {
lab=GND}
N 1330 -290 1400 -290 {
lab=GND}
N 1400 -290 1400 -200 {
lab=GND}
N 1200 -290 1290 -290 {
lab=#net5}
N 1330 -400 1330 -320 {
lab=#net6}
N 1460 -400 1460 -320 {
lab=#net6}
N 1580 -220 1580 -200 {
lab=GND}
N 1580 -290 1580 -280 {
lab=#net7}
N 1710 -260 1710 -200 {
lab=GND}
N 1840 -260 1840 -200 {
lab=GND}
N 1710 -290 1780 -290 {
lab=GND}
N 1780 -290 1780 -200 {
lab=GND}
N 1580 -290 1670 -290 {
lab=#net7}
N 1710 -400 1710 -320 {
lab=#net8}
N 1840 -400 1840 -320 {
lab=#net8}
N 950 -400 1080 -400 {
lab=#net4}
N 1330 -400 1460 -400 {
lab=#net6}
N 1710 -400 1840 -400 {
lab=#net8}
C {devices/code_shown.sym} 0 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 0 -1260 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
save all

save @n.xm1.nsg13_lv_nmos[ids]
save @n.xm1.nsg13_lv_nmos[gm]
save @n.xm1.nsg13_lv_nmos[gmb]
save @n.xm1.nsg13_lv_nmos[gds]
save @n.xm1.nsg13_lv_nmos[cgg]
save @n.xm1.nsg13_lv_nmos[cgd]
save @n.xm1.nsg13_lv_nmos[cgs]
save @n.xm1.nsg13_lv_nmos[cgb]
save @n.xm1.nsg13_lv_nmos[fug]
save @n.xm1.nsg13_lv_nmos[sid]

save @n.xm2.nsg13_lv_nmos[ids]
save @n.xm2.nsg13_lv_nmos[gm]
save @n.xm2.nsg13_lv_nmos[gmb]
save @n.xm2.nsg13_lv_nmos[gds]
save @n.xm2.nsg13_lv_nmos[cgg]
save @n.xm2.nsg13_lv_nmos[cgd]
save @n.xm2.nsg13_lv_nmos[cgs]
save @n.xm2.nsg13_lv_nmos[cgb]
save @n.xm2.nsg13_lv_nmos[fug]
save @n.xm2.nsg13_lv_nmos[sid]

save @n.xm3.nsg13_lv_nmos[ids]
save @n.xm3.nsg13_lv_nmos[gm]
save @n.xm3.nsg13_lv_nmos[gmb]
save @n.xm3.nsg13_lv_nmos[gds]
save @n.xm3.nsg13_lv_nmos[cgg]
save @n.xm3.nsg13_lv_nmos[cgd]
save @n.xm3.nsg13_lv_nmos[cgs]
save @n.xm3.nsg13_lv_nmos[cgb]
save @n.xm3.nsg13_lv_nmos[fug]
save @n.xm3.nsg13_lv_nmos[sid]

save @n.xm4.nsg13_lv_nmos[ids]
save @n.xm4.nsg13_lv_nmos[gm]
save @n.xm4.nsg13_lv_nmos[gmb]
save @n.xm4.nsg13_lv_nmos[gds]
save @n.xm4.nsg13_lv_nmos[cgg]
save @n.xm4.nsg13_lv_nmos[cgd]
save @n.xm4.nsg13_lv_nmos[cgs]
save @n.xm4.nsg13_lv_nmos[cgb]
save @n.xm4.nsg13_lv_nmos[fug]
save @n.xm4.nsg13_lv_nmos[sid]

op
write ex01.raw
.endc
"}
C {devices/gnd.sym} 570 -200 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 440 -200 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 440 -250 0 0 {name=Vgs value=0.3}
C {devices/vsource.sym} 700 -290 0 0 {name=Vds value=0.75}
C {devices/gnd.sym} 700 -200 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 640 -200 0 0 {name=l4 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Copyright 2024 Harald Pretl, IIC@JKU"}
C {sg13g2_pr/sg13_lv_nmos.sym} 550 -290 2 1 {name=M1
l=0.13u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/launcher.sym} 80 -250 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 80 -220 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/ngspice_get_value.sym} 640 -720 0 1 {name=r2 node=@n.xm1.nsg13_lv_nmos[gds]
descr="gds="}
C {devices/ngspice_probe.sym} 680 -400 0 0 {name=r1}
C {devices/ngspice_probe.sym} 440 -290 0 0 {name=r3}
C {devices/ngspice_get_value.sym} 640 -800 0 1 {name=r4 node=@n.xm1.nsg13_lv_nmos[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 640 -680 0 1 {name=r6 node=@n.xm1.nsg13_lv_nmos[cgs]
descr="cgs="}
C {devices/ngspice_get_value.sym} 640 -640 0 1 {name=r9 node=@n.xm1.nsg13_lv_nmos[cgd]
descr="cgd="}
C {devices/ngspice_get_value.sym} 640 -480 0 1 {name=r10 node=v(@n.xm1.nsg13_lv_nmos[sid])
descr="sid="}
C {devices/ngspice_get_value.sym} 640 -760 0 1 {name=r12 node=@n.xm1.nsg13_lv_nmos[gmb]
descr="gmb="}
C {devices/ngspice_get_value.sym} 640 -840 0 1 {name=r13 node=i(@n.xm1.nsg13_lv_nmos[ids])
descr="ids="}
C {devices/ngspice_get_value.sym} 640 -600 0 1 {name=r14 node=@n.xm1.nsg13_lv_nmos[cgb]
descr="cgb="}
C {devices/ngspice_get_value.sym} 640 -560 0 1 {name=r15 node=@n.xm1.nsg13_lv_nmos[cgg]
descr="cgg="}
C {devices/ngspice_get_value.sym} 640 -520 0 1 {name=r16 node=v(@n.xm1.nsg13_lv_nmos[fug])
descr="fug(f_t)="}
C {devices/gnd.sym} 950 -200 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 820 -200 0 0 {name=l7 lab=GND}
C {devices/vsource.sym} 820 -250 0 0 {name=Vgs1 value=0.3}
C {devices/vsource.sym} 1080 -290 0 0 {name=Vds1 value=0.05}
C {devices/gnd.sym} 1080 -200 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1020 -200 0 0 {name=l9 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 930 -290 2 1 {name=M2
l=0.13u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/ngspice_get_value.sym} 1020 -720 0 1 {name=r5 node=@n.xm2.nsg13_lv_nmos[gds]
descr="gds="}
C {devices/ngspice_probe.sym} 1060 -400 0 0 {name=r7}
C {devices/ngspice_probe.sym} 820 -290 0 0 {name=r8}
C {devices/ngspice_get_value.sym} 1020 -800 0 1 {name=r11 node=@n.xm2.nsg13_lv_nmos[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 1020 -680 0 1 {name=r17 node=@n.xm2.nsg13_lv_nmos[cgs]
descr="cgs="}
C {devices/ngspice_get_value.sym} 1020 -640 0 1 {name=r18 node=@n.xm2.nsg13_lv_nmos[cgd]
descr="cgd="}
C {devices/ngspice_get_value.sym} 1020 -480 0 1 {name=r19 node=v(@n.xm2.nsg13_lv_nmos[sid])
descr="sid="}
C {devices/ngspice_get_value.sym} 1020 -760 0 1 {name=r20 node=@n.xm2.nsg13_lv_nmos[gmb]
descr="gmb="}
C {devices/ngspice_get_value.sym} 1020 -840 0 1 {name=r21 node=i(@n.xm2.nsg13_lv_nmos[ids])
descr="ids="}
C {devices/ngspice_get_value.sym} 1020 -600 0 1 {name=r22 node=@n.xm2.nsg13_lv_nmos[cgb]
descr="cgb="}
C {devices/ngspice_get_value.sym} 1020 -560 0 1 {name=r23 node=@n.xm2.nsg13_lv_nmos[cgg]
descr="cgg="}
C {devices/ngspice_get_value.sym} 1020 -520 0 1 {name=r24 node=v(@n.xm2.nsg13_lv_nmos[fug])
descr="fug(f_t)="}
C {devices/gnd.sym} 1330 -200 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} 1200 -200 0 0 {name=l11 lab=GND}
C {devices/vsource.sym} 1200 -250 0 0 {name=Vgs2 value=0.7}
C {devices/vsource.sym} 1460 -290 0 0 {name=Vds2 value=0.75}
C {devices/gnd.sym} 1460 -200 0 0 {name=l12 lab=GND}
C {devices/gnd.sym} 1400 -200 0 0 {name=l13 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1310 -290 2 1 {name=M3
l=0.13u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/ngspice_get_value.sym} 1400 -720 0 1 {name=r25 node=@n.xm3.nsg13_lv_nmos[gds]
descr="gds="}
C {devices/ngspice_probe.sym} 1440 -400 0 0 {name=r26}
C {devices/ngspice_probe.sym} 1200 -290 0 0 {name=r27}
C {devices/ngspice_get_value.sym} 1400 -800 0 1 {name=r28 node=@n.xm3.nsg13_lv_nmos[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 1400 -680 0 1 {name=r29 node=@n.xm3.nsg13_lv_nmos[cgs]
descr="cgs="}
C {devices/ngspice_get_value.sym} 1400 -640 0 1 {name=r30 node=@n.xm3.nsg13_lv_nmos[cgd]
descr="cgd="}
C {devices/ngspice_get_value.sym} 1400 -480 0 1 {name=r31 node=v(@n.xm3.nsg13_lv_nmos[sid])
descr="sid="}
C {devices/ngspice_get_value.sym} 1400 -760 0 1 {name=r32 node=@n.xm3.nsg13_lv_nmos[gmb]
descr="gmb="}
C {devices/ngspice_get_value.sym} 1400 -840 0 1 {name=r33 node=i(@n.xm3.nsg13_lv_nmos[ids])
descr="ids="}
C {devices/ngspice_get_value.sym} 1400 -600 0 1 {name=r34 node=@n.xm3.nsg13_lv_nmos[cgb]
descr="cgb="}
C {devices/ngspice_get_value.sym} 1400 -560 0 1 {name=r35 node=@n.xm3.nsg13_lv_nmos[cgg]
descr="cgg="}
C {devices/ngspice_get_value.sym} 1400 -520 0 1 {name=r36 node=v(@n.xm3.nsg13_lv_nmos[fug])
descr="fug(f_t)="}
C {devices/gnd.sym} 1710 -200 0 0 {name=l14 lab=GND}
C {devices/gnd.sym} 1580 -200 0 0 {name=l15 lab=GND}
C {devices/vsource.sym} 1580 -250 0 0 {name=Vgs3 value=0.7}
C {devices/vsource.sym} 1840 -290 0 0 {name=Vds3 value=0.05}
C {devices/gnd.sym} 1840 -200 0 0 {name=l16 lab=GND}
C {devices/gnd.sym} 1780 -200 0 0 {name=l17 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1690 -290 2 1 {name=M4
l=0.13u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/ngspice_get_value.sym} 1780 -720 0 1 {name=r37 node=@n.xm4.nsg13_lv_nmos[gds]
descr="gds="}
C {devices/ngspice_probe.sym} 1820 -400 0 0 {name=r38}
C {devices/ngspice_probe.sym} 1580 -290 0 0 {name=r39}
C {devices/ngspice_get_value.sym} 1780 -800 0 1 {name=r40 node=@n.xm4.nsg13_lv_nmos[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 1780 -680 0 1 {name=r41 node=@n.xm4.nsg13_lv_nmos[cgs]
descr="cgs="}
C {devices/ngspice_get_value.sym} 1780 -640 0 1 {name=r42 node=@n.xm4.nsg13_lv_nmos[cgd]
descr="cgd="}
C {devices/ngspice_get_value.sym} 1780 -480 0 1 {name=r43 node=v(@n.xm4.nsg13_lv_nmos[sid])
descr="sid="}
C {devices/ngspice_get_value.sym} 1780 -760 0 1 {name=r44 node=@n.xm4.nsg13_lv_nmos[gmb]
descr="gmb="}
C {devices/ngspice_get_value.sym} 1780 -840 0 1 {name=r45 node=i(@n.xm4.nsg13_lv_nmos[ids])
descr="ids="}
C {devices/ngspice_get_value.sym} 1780 -600 0 1 {name=r46 node=@n.xm4.nsg13_lv_nmos[cgb]
descr="cgb="}
C {devices/ngspice_get_value.sym} 1780 -560 0 1 {name=r47 node=@n.xm4.nsg13_lv_nmos[cgg]
descr="cgg="}
C {devices/ngspice_get_value.sym} 1780 -520 0 1 {name=r48 node=v(@n.xm4.nsg13_lv_nmos[fug])
descr="fug(f_t)="}
