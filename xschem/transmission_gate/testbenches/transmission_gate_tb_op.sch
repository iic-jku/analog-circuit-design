v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Testbench for Operating Point analysis - Parameterizable Transmission Gate} 280 -1720 0 0 1 1 {}
T {x1 NMOS M1:} 1690 -1070 0 0 0.4 0.4 {}
T {x1 PMOS M2:} 1990 -1070 0 0 0.4 0.4 {}
T {x2 NMOS M1:} 1690 -750 0 0 0.4 0.4 {}
T {x2 PMOS M2:} 1990 -750 0 0 0.4 0.4 {}
T {TG is OFF!} 1260 -810 0 0 0.5 0.5 {}
T {TG is ON!} 1260 -1130 0 0 0.5 0.5 {}
N 940 -740 940 -700 {
lab=GND}
N 940 -840 940 -800 {
lab=v_a}
N 920 -840 940 -840 {
lab=v_a}
N 1180 -800 1180 -720 {
lab=VDD}
N 1060 -1000 1120 -1000 {
lab=v_a}
N 1060 -680 1120 -680 {
lab=v_a}
N 1060 -840 1060 -680 {
lab=v_a}
N 1060 -1000 1060 -840 {
lab=v_a}
N 940 -840 1060 -840 {
lab=v_a}
N 1280 -680 1380 -680 {
lab=vout_tg_off}
N 1280 -1000 1380 -1000 {
lab=vout_tg_on}
N 1220 -570 1220 -560 {
lab=VDD}
N 1200 -560 1220 -560 {
lab=VDD}
N 1220 -780 1220 -770 {
lab=GND}
N 1200 -780 1220 -780 {
lab=GND}
N 1200 -780 1200 -720 {
lab=GND}
N 1180 -1080 1180 -1040 {
lab=VDD}
N 1200 -640 1200 -560 {
lab=VDD}
N 1180 -640 1180 -540 {
lab=GND}
N 1180 -1080 1200 -1080 {
lab=VDD}
N 1180 -1120 1180 -1080 {
lab=VDD}
N 1200 -1080 1200 -1040 {
lab=VDD}
N 1180 -920 1180 -880 {
lab=GND}
N 1200 -960 1200 -920 {
lab=GND}
N 1180 -920 1200 -920 {
lab=GND}
N 1180 -960 1180 -920 {
lab=GND}
N 1380 -1000 1380 -960 {
lab=vout_tg_on}
N 1380 -1000 1420 -1000 {
lab=vout_tg_on}
N 1380 -900 1380 -880 {
lab=GND}
N 1380 -680 1380 -640 {
lab=vout_tg_off}
N 1380 -580 1380 -540 {
lab=GND}
N 1380 -680 1420 -680 {
lab=vout_tg_off}
N 800 -840 800 -800 {
lab=VDD}
N 800 -740 800 -700 {
lab=GND}
C {devices/ngspice_get_value.sym} 1960 -1000 0 0 {name=r28 
node=v(@n.x1.xm2.nsg13_lv_pmos[vth])
descr="vth ="}
C {devices/ngspice_get_value.sym} 2040 -1000 0 0 {name=r29 
node=i(@n.x1.xm2.nsg13_lv_pmos[ids])
descr="id ="}
C {devices/ngspice_get_value.sym} 1960 -960 0 0 {name=r30
node=v(@n.x1.xm2.nsg13_lv_pmos[vgs])
descr="vgs ="}
C {devices/ngspice_get_value.sym} 2040 -880 0 0 {name=r31 
node=@n.x1.xm2.nsg13_lv_pmos[gmb]
descr="gmb ="}
C {devices/ngspice_get_value.sym} 2120 -1000 0 0 {name=r32
node=@n.x1.xm2.nsg13_lv_pmos[cgs]
descr="cgs ="}
C {devices/ngspice_get_value.sym} 2040 -960 0 0 {name=r33 
node=@n.x1.xm2.nsg13_lv_pmos[gm]
descr="gm ="}
C {devices/ngspice_get_value.sym} 2040 -920 0 0 {name=r34 
node=@n.x1.xm2.nsg13_lv_pmos[gds]
descr="gds ="}
C {devices/ngspice_get_value.sym} 1960 -920 0 0 {name=r35
node=v(@n.x1.xm2.nsg13_lv_pmos[vds])
descr="vds ="}
C {devices/ngspice_get_value.sym} 1960 -880 0 0 {name=r36
node=v(@n.x1.xm2.nsg13_lv_pmos[vgt])
descr="vod ="}
C {devices/lab_wire.sym} 920 -840 0 0 {name=p2 sig_type=std_logic lab=v_a}
C {devices/title-3.sym} 0 0 0 0 {name=l5 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/vsource.sym} 940 -770 0 0 {name=v_a value="0.75"}
C {devices/gnd.sym} 940 -700 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 1420 -1000 0 1 {name=p3 sig_type=std_logic lab=vout_tg_on}
C {devices/gnd.sym} 1180 -880 0 0 {name=l9 lab=GND}
C {devices/vdd.sym} 1180 -1120 0 0 {name=l11 lab=VDD}
C {devices/lab_wire.sym} 1420 -680 0 1 {name=p5 sig_type=std_logic lab=vout_tg_off}
C {devices/gnd.sym} 1180 -540 0 0 {name=l14 lab=GND}
C {devices/vdd.sym} 1180 -800 0 0 {name=l15 lab=VDD}
C {devices/gnd.sym} 1220 -770 0 0 {name=l16 lab=GND}
C {devices/vdd.sym} 1220 -570 0 0 {name=l17 lab=VDD}
C {devices/vsource.sym} 800 -770 0 0 {name=VDD value="1.5"}
C {devices/gnd.sym} 800 -700 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 800 -840 0 0 {name=l2 lab=VDD}
C {devices/code_shown.sym} 280 -210 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
"}
C {devices/launcher.sym} 1720 -1220 0 0 {name=h2
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 1720 -1160 0 0 {name=h3
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {code_shown.sym} 280 -1570 0 0 {name=NGSPICE1
only_toplevel=false
value="
.param temp=27
.options savecurrents
.control
save all

show n.x1.xm1.nsg13_lv_nmos
show n.x1.xm2.nsg13_lv_pmos

* Save transistor parameters
save @n.x1.xm1.nsg13_lv_nmos[vth]
save @n.x1.xm1.nsg13_lv_nmos[vgs]
save @n.x1.xm1.nsg13_lv_nmos[vds]
save @n.x1.xm1.nsg13_lv_nmos[vgt]
save @n.x1.xm1.nsg13_lv_nmos[ids]
save @n.x1.xm1.nsg13_lv_nmos[gm]
save @n.x1.xm1.nsg13_lv_nmos[gds]
save @n.x1.xm1.nsg13_lv_nmos[gmb]
save @n.x1.xm1.nsg13_lv_nmos[cgs]
save @n.x1.xm1.nsg13_lv_nmos[cgd]
save @n.x1.xm1.nsg13_lv_nmos[fug]
save @n.x1.xm1.nsg13_lv_nmos[rg]

save @n.x1.xm2.nsg13_lv_pmos[vth]
save @n.x1.xm2.nsg13_lv_pmos[vgs]
save @n.x1.xm2.nsg13_lv_pmos[vds]
save @n.x1.xm2.nsg13_lv_pmos[vgt]
save @n.x1.xm2.nsg13_lv_pmos[ids]
save @n.x1.xm2.nsg13_lv_pmos[gm]
save @n.x1.xm2.nsg13_lv_pmos[gds]
save @n.x1.xm2.nsg13_lv_pmos[gmb]
save @n.x1.xm2.nsg13_lv_pmos[cgs]
save @n.x1.xm2.nsg13_lv_pmos[cgd]
save @n.x1.xm2.nsg13_lv_pmos[fug]
save @n.x1.xm2.nsg13_lv_pmos[rg]

save @n.x2.xm1.nsg13_lv_nmos[vth]
save @n.x2.xm1.nsg13_lv_nmos[vgs]
save @n.x2.xm1.nsg13_lv_nmos[vds]
save @n.x2.xm1.nsg13_lv_nmos[vgt]
save @n.x2.xm1.nsg13_lv_nmos[ids]
save @n.x2.xm1.nsg13_lv_nmos[gm]
save @n.x2.xm1.nsg13_lv_nmos[gds]
save @n.x2.xm1.nsg13_lv_nmos[gmb]
save @n.x2.xm1.nsg13_lv_nmos[cgs]
save @n.x2.xm1.nsg13_lv_nmos[cgd]
save @n.x2.xm1.nsg13_lv_nmos[fug]
save @n.x2.xm1.nsg13_lv_nmos[rg]

save @n.x2.xm2.nsg13_lv_pmos[vth]
save @n.x2.xm2.nsg13_lv_pmos[vgs]
save @n.x2.xm2.nsg13_lv_pmos[vds]
save @n.x2.xm2.nsg13_lv_pmos[vgt]
save @n.x2.xm2.nsg13_lv_pmos[ids]
save @n.x2.xm2.nsg13_lv_pmos[gm]
save @n.x2.xm2.nsg13_lv_pmos[gds]
save @n.x2.xm2.nsg13_lv_pmos[gmb]
save @n.x2.xm2.nsg13_lv_pmos[cgs]
save @n.x2.xm2.nsg13_lv_pmos[cgd]
save @n.x2.xm2.nsg13_lv_pmos[fug]
save @n.x2.xm2.nsg13_lv_pmos[rg]

* Operating Point Analysis
op
remzerovec
write transmission_gate_tb_op.raw

quit
.endc"}
C {devices/capa.sym} 1380 -930 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1380 -880 0 0 {name=l3 lab=GND}
C {devices/capa.sym} 1380 -610 0 0 {name=C2
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1380 -540 0 0 {name=l4 lab=GND}
C {devices/ngspice_get_value.sym} 2120 -920 0 0 {name=r43
node=v(@n.x1.xm2.nsg13_lv_pmos[fug])
descr="fug(f_t) ="}
C {devices/ngspice_get_value.sym} 2120 -960 0 0 {name=r44
node=@n.x1.xm2.nsg13_lv_pmos[cgd]
descr="cgd ="}
C {devices/ngspice_get_value.sym} 2120 -880 0 0 {name=r46
node=v(@n.x1.xm2.nsg13_lv_pmos[rg])
descr="rg ="}
C {devices/ngspice_get_value.sym} 1660 -1000 0 0 {name=r2 
node=v(@n.x1.xm1.nsg13_lv_nmos[vth])
descr="vth ="}
C {devices/ngspice_get_value.sym} 1740 -1000 0 0 {name=r3 
node=i(@n.x1.xm1.nsg13_lv_nmos[ids])
descr="id ="}
C {devices/ngspice_get_value.sym} 1660 -960 0 0 {name=r4
node=v(@n.x1.xm1.nsg13_lv_nmos[vgs])
descr="vgs ="}
C {devices/ngspice_get_value.sym} 1740 -880 0 0 {name=r5 
node=@n.x1.xm1.nsg13_lv_nmos[gmb]
descr="gmb ="}
C {devices/ngspice_get_value.sym} 1820 -1000 0 0 {name=r6
node=@n.x1.xm1.nsg13_lv_nmos[cgs]
descr="cgs ="}
C {devices/ngspice_get_value.sym} 1740 -960 0 0 {name=r8 
node=@n.x1.xm1.nsg13_lv_nmos[gm]
descr="gm ="}
C {devices/ngspice_get_value.sym} 1740 -920 0 0 {name=r9 
node=@n.x1.xm1.nsg13_lv_nmos[gds]
descr="gds ="}
C {devices/ngspice_get_value.sym} 1660 -920 0 0 {name=r18
node=v(@n.x1.xm1.nsg13_lv_nmos[vds])
descr="vds ="}
C {devices/ngspice_get_value.sym} 1660 -880 0 0 {name=r19
node=v(@n.x1.xm1.nsg13_lv_nmos[vgt])
descr="vod ="}
C {devices/ngspice_get_value.sym} 1820 -920 0 0 {name=r37
node=v(@n.x1.xm1.nsg13_lv_nmos[fug])
descr="fug(f_t) ="}
C {devices/ngspice_get_value.sym} 1820 -960 0 0 {name=r47 
node=@n.x1.xm1.nsg13_lv_nmos[cgd]
descr="cgd ="}
C {devices/ngspice_get_value.sym} 1820 -880 0 0 {name=r48
node=v(@n.x1.xm1.nsg13_lv_nmos[rg])
descr="rg ="}
C {devices/ngspice_get_value.sym} 1960 -680 0 0 {name=r1 
node=v(@n.x2.xm2.nsg13_lv_pmos[vth])
descr="vth ="}
C {devices/ngspice_get_value.sym} 2040 -680 0 0 {name=r7 
node=i(@n.x2.xm2.nsg13_lv_pmos[ids])
descr="id ="}
C {devices/ngspice_get_value.sym} 1960 -640 0 0 {name=r10
node=v(@n.x2.xm2.nsg13_lv_pmos[vgs])
descr="vgs ="}
C {devices/ngspice_get_value.sym} 2040 -560 0 0 {name=r11 
node=@n.x2.xm2.nsg13_lv_pmos[gmb]
descr="gmb ="}
C {devices/ngspice_get_value.sym} 2120 -680 0 0 {name=r12
node=@n.x2.xm2.nsg13_lv_pmos[cgs]
descr="cgs ="}
C {devices/ngspice_get_value.sym} 2040 -640 0 0 {name=r13 
node=@n.x2.xm2.nsg13_lv_pmos[gm]
descr="gm ="}
C {devices/ngspice_get_value.sym} 2040 -600 0 0 {name=r14 
node=@n.x2.xm2.nsg13_lv_pmos[gds]
descr="gds ="}
C {devices/ngspice_get_value.sym} 1960 -600 0 0 {name=r15
node=v(@n.x2.xm2.nsg13_lv_pmos[vds])
descr="vds ="}
C {devices/ngspice_get_value.sym} 1960 -560 0 0 {name=r16
node=v(@n.x2.xm2.nsg13_lv_pmos[vgt])
descr="vod ="}
C {devices/ngspice_get_value.sym} 2120 -600 0 0 {name=r17
node=v(@n.x2.xm2.nsg13_lv_pmos[fug])
descr="fug(f_t) ="}
C {devices/ngspice_get_value.sym} 2120 -640 0 0 {name=r20
node=@n.x2.xm2.nsg13_lv_pmos[cgd]
descr="cgd ="}
C {devices/ngspice_get_value.sym} 2120 -560 0 0 {name=r21
node=v(@n.x2.xm2.nsg13_lv_pmos[rg])
descr="rg ="}
C {devices/ngspice_get_value.sym} 1660 -680 0 0 {name=r22 
node=v(@n.x2.xm1.nsg13_lv_nmos[vth])
descr="vth ="}
C {devices/ngspice_get_value.sym} 1740 -680 0 0 {name=r23 
node=i(@n.x2.xm1.nsg13_lv_nmos[ids])
descr="id ="}
C {devices/ngspice_get_value.sym} 1660 -640 0 0 {name=r24
node=v(@n.x2.xm1.nsg13_lv_nmos[vgs])
descr="vgs ="}
C {devices/ngspice_get_value.sym} 1740 -560 0 0 {name=r25 
node=@n.x2.xm1.nsg13_lv_nmos[gmb]
descr="gmb ="}
C {devices/ngspice_get_value.sym} 1820 -680 0 0 {name=r26
node=@n.x2.xm1.nsg13_lv_nmos[cgs]
descr="cgs ="}
C {devices/ngspice_get_value.sym} 1740 -640 0 0 {name=r27 
node=@n.x2.xm1.nsg13_lv_nmos[gm]
descr="gm ="}
C {devices/ngspice_get_value.sym} 1740 -600 0 0 {name=r38 
node=@n.x2.xm1.nsg13_lv_nmos[gds]
descr="gds ="}
C {devices/ngspice_get_value.sym} 1660 -600 0 0 {name=r39
node=v(@n.x2.xm1.nsg13_lv_nmos[vds])
descr="vds ="}
C {devices/ngspice_get_value.sym} 1660 -560 0 0 {name=r40
node=v(@n.x2.xm1.nsg13_lv_nmos[vgt])
descr="vod ="}
C {devices/ngspice_get_value.sym} 1820 -600 0 0 {name=r41
node=v(@n.x2.xm1.nsg13_lv_nmos[fug])
descr="fug(f_t) ="}
C {devices/ngspice_get_value.sym} 1820 -640 0 0 {name=r42 
node=@n.x2.xm1.nsg13_lv_nmos[cgd]
descr="cgd ="}
C {devices/ngspice_get_value.sym} 1820 -560 0 0 {name=r45
node=v(@n.x2.xm1.nsg13_lv_nmos[rg])
descr="rg ="}
C {transmission_gate/transmission_gate_wo_dummy.sym} 1200 -1000 0 0 {name=x1 W_P=3.0u L_P=0.13u W_N=1.0u L_N=0.13u}
C {transmission_gate/transmission_gate_wo_dummy.sym} 1200 -680 0 0 {name=x2 W_P=3.0u L_P=0.13u W_N=1.0u L_N=0.13u}
