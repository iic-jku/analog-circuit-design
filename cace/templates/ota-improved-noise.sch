v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 780 -240 780 -220 {
lab=GND}
N 940 -240 940 -220 {
lab=GND}
N 940 -320 940 -300 {
lab=v_ss}
N 1350 -320 1560 -320 {
lab=v_ss}
N 1310 -770 1350 -770 {
lab=v_dd}
N 1310 -490 1310 -320 {
lab=v_ss}
N 1560 -470 1560 -320 {
lab=v_ss}
N 1560 -570 1560 -530 {
lab=v_out}
N 1480 -570 1560 -570 {
lab=v_out}
N 1480 -570 1480 -450 {
lab=v_out}
N 1410 -570 1480 -570 {
lab=v_out}
N 1160 -450 1480 -450 {
lab=v_out}
N 1160 -540 1160 -450 {
lab=v_out}
N 1160 -540 1230 -540 {
lab=v_out}
N 960 -450 960 -320 {
lab=v_ss}
N 940 -320 960 -320 {
lab=v_ss}
N 960 -600 960 -510 {
lab=v_in}
N 960 -600 1230 -600 {
lab=v_in}
N 1350 -770 1350 -750 {
lab=v_dd}
N 1350 -690 1350 -650 {
lab=#net1}
N 1310 -700 1310 -650 {
lab=v_dd}
N 780 -700 1310 -700 {
lab=v_dd}
N 780 -700 780 -300 {
lab=v_dd}
N 1310 -770 1310 -700 {
lab=v_dd}
N 1350 -340 1350 -320 {
lab=v_ss}
N 1310 -320 1350 -320 {
lab=v_ss}
N 960 -320 1310 -320 {
lab=v_ss}
N 1350 -490 1350 -400 {
lab=v_ena}
C {devices/code_shown.sym} 0 -740 0 0 {name=NGSPICE only_toplevel=true 
value="
.include CACE\{DUT_path\}
.temp CACE\{temp\}
.param mc_ok = CACE\{sigma=1\}
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]
.option sparse

.control
set num_threads=1
save all
noise v(v_out) Vin dec 101 1k 100MEG

let noise=onoise_total
echo $&noise > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {devices/vsource.sym} 780 -270 0 0 {name=Vdd value=CACE\{vdd\}}
C {devices/gnd.sym} 780 -220 0 0 {name=l3 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Copyright 2024 Harald Pretl"}
C {lab_pin.sym} 780 -320 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/vsource.sym} 940 -270 0 0 {name=Vss value=0}
C {devices/gnd.sym} 940 -220 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 940 -320 0 0 {name=p1 sig_type=std_logic lab=v_ss}
C {capa.sym} 1560 -500 0 0 {name=C1
value=CACE\{cload\}}
C {lab_wire.sym} 1560 -570 0 0 {name=p3 sig_type=std_logic lab=v_out}
C {devices/vsource.sym} 960 -480 0 0 {name=Vin value="dc CACE\{vin\} ac 1"}
C {lab_wire.sym} 1020 -600 0 0 {name=p4 sig_type=std_logic lab=v_in}
C {isource.sym} 1350 -720 0 0 {name=I0 value=CACE\{ibias\}}
C {vsource.sym} 1350 -370 0 0 {name=Venable value=1.5 savecurrent=false}
C {spice_probe.sym} 1080 -600 0 0 {name=p5 attrs=""}
C {spice_probe.sym} 1440 -570 0 0 {name=p6 attrs=""}
C {spice_probe.sym} 1350 -410 0 0 {name=p7 attrs=""}
C {lab_wire.sym} 1350 -470 0 0 {name=p8 sig_type=std_logic lab=v_ena}
C {ota-improved.sym} 1310 -570 0 0 {name=xota}
C {devices/code_shown.sym} 0 -250 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_CACE\{corner_mos\}
.lib cornerMOShv.lib mos_CACE\{corner_mos\}
.lib cornerRES.lib res_CACE\{corner_res\}
"}
