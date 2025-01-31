v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 680 -180 680 -160 {
lab=GND}
N 760 -180 760 -160 {
lab=GND}
N 760 -260 760 -240 {
lab=v_ss}
N 1250 -260 1460 -260 {
lab=v_ss}
N 1210 -710 1250 -710 {
lab=v_dd}
N 1210 -430 1210 -260 {
lab=v_ss}
N 1460 -410 1460 -260 {
lab=v_ss}
N 1460 -510 1460 -470 {
lab=v_out}
N 1380 -510 1460 -510 {
lab=v_out}
N 1380 -510 1380 -390 {
lab=v_out}
N 1310 -510 1380 -510 {
lab=v_out}
N 1060 -390 1380 -390 {
lab=v_out}
N 1060 -480 1060 -390 {
lab=v_out}
N 1060 -480 1130 -480 {
lab=v_out}
N 860 -390 860 -260 {
lab=v_ss}
N 760 -260 860 -260 {
lab=v_ss}
N 860 -540 860 -450 {
lab=v_in}
N 860 -540 1130 -540 {
lab=v_in}
N 1250 -710 1250 -690 {
lab=v_dd}
N 1250 -630 1250 -590 {
lab=#net1}
N 1210 -640 1210 -590 {
lab=v_dd}
N 680 -640 1210 -640 {
lab=v_dd}
N 680 -640 680 -240 {
lab=v_dd}
N 1210 -710 1210 -640 {
lab=v_dd}
N 1250 -280 1250 -260 {
lab=v_ss}
N 1210 -260 1250 -260 {
lab=v_ss}
N 860 -260 1210 -260 {
lab=v_ss}
N 1250 -430 1250 -340 {
lab=v_ena}
C {devices/code_shown.sym} 0 -630 0 0 {name=NGSPICE only_toplevel=true 
value="
.lib cornerMOSlv.lib mos_CACE\{corner_mos\}
.lib cornerRES.lib res_CACE\{corner_res\}

.include CACE\{DUT_path\}
.temp CACE\{temp\}
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

.ic v(v_out)=0
.option method=gear order=2 trtol=1e-4

.control
set num_threads=1
tran 0.005u 15u uic

let vout_limit=CACE\{vin\}*0.99
meas tran tcross WHEN v(v_out)=vout_limit
let vena_limit=0.5*CACE\{vdd\}
meas tran tstart WHEN v(v_ena)=vena_limit
let tsettle=tcross-tstart

echo $&tsettle > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {devices/vsource.sym} 680 -210 0 0 {name=Vdd value=CACE\{vdd\}}
C {devices/gnd.sym} 680 -160 0 0 {name=l3 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Copyright 2024-2025 Harald Pretl"}
C {lab_pin.sym} 680 -260 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/vsource.sym} 760 -210 0 0 {name=Vss value=0}
C {devices/gnd.sym} 760 -160 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 760 -260 0 0 {name=p1 sig_type=std_logic lab=v_ss}
C {capa.sym} 1460 -440 0 0 {name=C1
value=CACE\{cload\}}
C {lab_wire.sym} 1460 -510 0 0 {name=p3 sig_type=std_logic lab=v_out}
C {devices/vsource.sym} 860 -420 0 0 {name=Vin value=CACE\{vin\}}
C {lab_wire.sym} 920 -540 0 0 {name=p4 sig_type=std_logic lab=v_in}
C {isource.sym} 1250 -660 0 0 {name=I0 value="dc 0 pwl(0 0 1.1u 0 1.2u CACE\{ibias\})"}
C {vsource.sym} 1250 -310 0 0 {name=Venable value="dc 0 pwl(0 0 1u 0 1.1u CACE\{vdd\})" savecurrent=false}
C {spice_probe.sym} 980 -540 0 0 {name=p5 attrs=""}
C {spice_probe.sym} 1340 -510 0 0 {name=p6 attrs=""}
C {spice_probe.sym} 1250 -350 0 0 {name=p7 attrs=""}
C {lab_wire.sym} 1250 -410 0 0 {name=p8 sig_type=std_logic lab=v_ena}
C {ota-improved.sym} 1210 -510 0 0 {name=xota}
