v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 620 -300 620 -280 {
lab=GND}
N 700 -300 700 -280 {
lab=GND}
N 700 -380 700 -360 {
lab=v_ss}
N 1190 -380 1400 -380 {
lab=v_ss}
N 1150 -830 1190 -830 {
lab=v_dd}
N 1150 -550 1150 -380 {
lab=v_ss}
N 1400 -530 1400 -380 {
lab=v_ss}
N 1400 -630 1400 -590 {
lab=v_out}
N 1320 -630 1400 -630 {
lab=v_out}
N 1320 -630 1320 -510 {
lab=v_out}
N 1250 -630 1320 -630 {
lab=v_out}
N 1000 -510 1320 -510 {
lab=v_out}
N 1000 -600 1000 -510 {
lab=v_out}
N 1000 -600 1070 -600 {
lab=v_out}
N 800 -510 800 -380 {
lab=v_ss}
N 700 -380 800 -380 {
lab=v_ss}
N 800 -660 800 -570 {
lab=v_in}
N 800 -660 1070 -660 {
lab=v_in}
N 1190 -830 1190 -810 {
lab=v_dd}
N 1190 -750 1190 -710 {
lab=#net1}
N 1150 -760 1150 -710 {
lab=v_dd}
N 620 -760 1150 -760 {
lab=v_dd}
N 620 -760 620 -360 {
lab=v_dd}
N 1150 -830 1150 -760 {
lab=v_dd}
N 1190 -400 1190 -380 {
lab=v_ss}
N 1150 -380 1190 -380 {
lab=v_ss}
N 800 -380 1150 -380 {
lab=v_ss}
N 1190 -550 1190 -460 {
lab=v_ena}
C {devices/code_shown.sym} 0 -750 0 0 {name=NGSPICE only_toplevel=true 
value="
.lib cornerMOSlv.lib mos_CACE\{corner\}
.include CACE\{DUT_path\}
.temp CACE\{temp\}
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]
.ic v(v_vout)=0

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
C {devices/vsource.sym} 620 -330 0 0 {name=Vdd value=CACE\{vdd\}}
C {devices/gnd.sym} 620 -280 0 0 {name=l3 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Copyright 2024 Harald Pretl"}
C {lab_pin.sym} 620 -380 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/vsource.sym} 700 -330 0 0 {name=Vss value=0}
C {devices/gnd.sym} 700 -280 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 700 -380 0 0 {name=p1 sig_type=std_logic lab=v_ss}
C {capa.sym} 1400 -560 0 0 {name=C1
value=CACE\{cload\}}
C {lab_wire.sym} 1400 -630 0 0 {name=p3 sig_type=std_logic lab=v_out}
C {devices/vsource.sym} 800 -540 0 0 {name=Vin value=CACE\{vin\}}
C {lab_wire.sym} 860 -660 0 0 {name=p4 sig_type=std_logic lab=v_in}
C {isource.sym} 1190 -780 0 0 {name=I0 value="dc 0 pwl(0 0 1.1u 0 1.2u CACE\{ibias\})"}
C {vsource.sym} 1190 -430 0 0 {name=Venable value="dc 0 pwl(0 0 1u 0 1.1u CACE\{vdd\})" savecurrent=false}
C {spice_probe.sym} 920 -660 0 0 {name=p5 attrs=""}
C {spice_probe.sym} 1280 -630 0 0 {name=p6 attrs=""}
C {spice_probe.sym} 1190 -470 0 0 {name=p7 attrs=""}
C {lab_wire.sym} 1190 -530 0 0 {name=p8 sig_type=std_logic lab=v_ena}
C {ota-5t.sym} 1150 -630 0 0 {name=x1}
