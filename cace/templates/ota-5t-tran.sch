v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 700 -180 700 -160 {
lab=GND}
N 780 -180 780 -160 {
lab=GND}
N 780 -260 780 -240 {
lab=v_ss}
N 1270 -260 1480 -260 {
lab=v_ss}
N 1230 -710 1270 -710 {
lab=v_dd}
N 1230 -430 1230 -260 {
lab=v_ss}
N 1480 -410 1480 -260 {
lab=v_ss}
N 1480 -510 1480 -470 {
lab=v_out}
N 1400 -510 1480 -510 {
lab=v_out}
N 1400 -510 1400 -390 {
lab=v_out}
N 1330 -510 1400 -510 {
lab=v_out}
N 1080 -390 1400 -390 {
lab=v_out}
N 1080 -480 1080 -390 {
lab=v_out}
N 1080 -480 1150 -480 {
lab=v_out}
N 880 -390 880 -260 {
lab=v_ss}
N 780 -260 880 -260 {
lab=v_ss}
N 880 -540 880 -450 {
lab=v_in}
N 880 -540 1150 -540 {
lab=v_in}
N 1270 -710 1270 -690 {
lab=v_dd}
N 1270 -630 1270 -590 {
lab=#net1}
N 1230 -640 1230 -590 {
lab=v_dd}
N 700 -640 1230 -640 {
lab=v_dd}
N 700 -640 700 -240 {
lab=v_dd}
N 1230 -710 1230 -640 {
lab=v_dd}
N 1270 -280 1270 -260 {
lab=v_ss}
N 1230 -260 1270 -260 {
lab=v_ss}
N 880 -260 1230 -260 {
lab=v_ss}
N 1270 -430 1270 -340 {
lab=v_ena}
C {devices/code_shown.sym} 0 -650 0 0 {name=NGSPICE only_toplevel=true 
value="
.lib cornerMOSlv.lib mos_CACE\{corner\}
.include CACE\{DUT_path\}
.temp CACE\{temp\}
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

.ic v(v_out)=0
.option method=gear

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
C {devices/vsource.sym} 700 -210 0 0 {name=Vdd value=CACE\{vdd\}}
C {devices/gnd.sym} 700 -160 0 0 {name=l3 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Copyright 2024-2025 Harald Pretl"}
C {lab_pin.sym} 700 -260 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/vsource.sym} 780 -210 0 0 {name=Vss value=0}
C {devices/gnd.sym} 780 -160 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 780 -260 0 0 {name=p1 sig_type=std_logic lab=v_ss}
C {capa.sym} 1480 -440 0 0 {name=C1
value=CACE\{cload\}}
C {lab_wire.sym} 1480 -510 0 0 {name=p3 sig_type=std_logic lab=v_out}
C {devices/vsource.sym} 880 -420 0 0 {name=Vin value=CACE\{vin\}}
C {lab_wire.sym} 940 -540 0 0 {name=p4 sig_type=std_logic lab=v_in}
C {isource.sym} 1270 -660 0 0 {name=I0 value="dc 0 pwl(0 0 1.1u 0 1.2u CACE\{ibias\})"}
C {vsource.sym} 1270 -310 0 0 {name=Venable value="dc 0 pwl(0 0 1u 0 1.1u CACE\{vdd\})" savecurrent=false}
C {spice_probe.sym} 1000 -540 0 0 {name=p5 attrs=""}
C {spice_probe.sym} 1360 -510 0 0 {name=p6 attrs=""}
C {spice_probe.sym} 1270 -350 0 0 {name=p7 attrs=""}
C {lab_wire.sym} 1270 -410 0 0 {name=p8 sig_type=std_logic lab=v_ena}
C {ota-5t.sym} 1230 -510 0 0 {name=xota}
