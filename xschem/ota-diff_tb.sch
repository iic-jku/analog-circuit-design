v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 560 -320 560 -300 {
lab=GND}
N 560 -360 560 -320 {
lab=GND}
N 560 -440 560 -420 {lab=v_dd}
N 700 -320 900 -320 {
lab=GND}
N 900 -430 900 -320 {lab=GND}
N 560 -720 900 -720 {lab=v_dd}
N 900 -720 900 -590 {lab=v_dd}
N 560 -440 640 -440 {lab=v_dd}
N 560 -720 560 -440 {lab=v_dd}
N 640 -440 640 -340 {lab=v_dd}
N 640 -340 940 -340 {lab=v_dd}
N 940 -430 940 -340 {lab=v_dd}
N 700 -380 700 -320 {lab=GND}
N 560 -320 700 -320 {
lab=GND}
N 700 -480 700 -440 {lab=vin}
N 700 -540 820 -540 {lab=vin}
N 700 -480 820 -480 {lab=vin}
N 700 -540 700 -480 {lab=vin}
N 1000 -540 1080 -540 {lab=outn}
N 1000 -480 1080 -480 {lab=outp}
N 900 -720 940 -720 {lab=v_dd}
N 940 -720 940 -680 {lab=v_dd}
N 940 -620 940 -590 {lab=#net1}
C {devices/code_shown.sym} 0 -160 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
"}
C {devices/code_shown.sym} 0 -710 0 0 {name=NGSPICE only_toplevel=true 
value="
.control
option klu
save all

op
write ota-diff_tb.raw
.endc
"}
C {devices/vsource.sym} 560 -390 0 0 {name=Vdd value=1.5 savecurrent=true}
C {devices/gnd.sym} 560 -300 0 0 {name=l3 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2025 H. Pretl, Apache-2.0 license"}
C {devices/launcher.sym} 480 -150 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 740 -150 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {lab_pin.sym} 560 -720 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {ota-diff.sym} 900 -510 0 0 {name=x1}
C {devices/vsource.sym} 700 -410 0 0 {name=Vdd1 value=0.75 savecurrent=false}
C {lab_pin.sym} 700 -510 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_wire.sym} 1060 -540 0 0 {name=p3 sig_type=std_logic lab=outn}
C {lab_wire.sym} 1060 -480 0 0 {name=p4 sig_type=std_logic lab=outp}
C {isource.sym} 940 -650 0 0 {name=Ibias value=5u}
