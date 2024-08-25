v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 770 120 790 120 {
lab=Vout}
N 790 120 790 140 {
lab=Vout}
N 60 160 60 180 {
lab=GND}
N 60 60 60 100 {
lab=VSS}
N 140 160 140 180 {
lab=GND}
N 60 180 60 200 {
lab=GND}
N 140 60 140 100 {
lab=VDD}
N 60 180 140 180 {
lab=GND}
N 220 60 220 100 {
lab=VDD}
N 220 160 220 180 {
lab=Ib}
N 220 180 220 200 {
lab=Ib}
N 690 120 770 120 {
lab=Vout}
N 730 120 730 290 {
lab=Vout}
N 690 260 690 280 {
lab=Vn}
N 510 260 690 260 {
lab=Vn}
N 510 160 510 260 {
lab=Vn}
N 510 160 540 160 {
lab=Vn}
N 690 340 690 420 {
lab=GND}
N 730 330 730 420 {
lab=GND}
N 690 420 730 420 {
lab=GND}
N 710 420 710 440 {
lab=GND}
N 300 60 300 100 {
lab=Vp}
N 300 160 300 200 {
lab=GND}
C {devices/code_shown.sym} 880 320 0 0 {name=CONTROL only_toplevel=false value="
.control
    * Step function applied at time 100ns, save transient data
    tran 10n CACE\{Tmax\}
    set wr_singlescale
    wrdata CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data V(Vout) V(Vp)
.endc
"}
C {devices/isource.sym} 220 130 0 0 {name=I0 value=CACE\{ib\}}
C {devices/lab_wire.sym} 600 60 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/capa.sym} 790 170 0 0 {name=C1
m=1
value=CACE\{cl\}
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 790 200 0 0 {name=l2 lab=GND}
C {devices/lab_wire.sym} 540 80 0 0 {name=p5 sig_type=std_logic lab=Vp}
C {devices/lab_wire.sym} 540 160 0 0 {name=p6 sig_type=std_logic lab=Vn}
C {devices/lab_wire.sym} 540 120 0 0 {name=p7 sig_type=std_logic lab=Ib}
C {devices/lab_wire.sym} 790 120 0 1 {name=p8 sig_type=std_logic lab=Vout}
C {devices/vsource.sym} 60 130 0 0 {name=V0 value=0 savecurrent=false}
C {devices/gnd.sym} 60 200 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 140 130 0 0 {name=V2 value=CACE\{vdd\} savecurrent=false}
C {devices/lab_wire.sym} 60 60 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 220 200 2 0 {name=p10 sig_type=std_logic lab=Ib}
C {devices/lab_wire.sym} 140 60 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 220 60 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 600 180 2 1 {name=p14 sig_type=std_logic lab=VSS}
C {ota-5t.sym} 610 120 0 0 {name=x2}
C {devices/vcvs.sym} 690 310 0 1 {name=Evdrv1 value=1}
C {devices/vsource.sym} 300 130 0 0 {name=V3 value="DC 0 PWL(0 0 100n 0 100.1n CACE\{vdd\})" savecurrent=false}
C {devices/gnd.sym} 710 440 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 300 60 0 0 {name=p15 sig_type=std_logic lab=Vp}
C {devices/gnd.sym} 300 200 0 0 {name=l5 lab=GND}
C {devices/code_shown.sym} 880 60 0 0 {name=SETUP
simulator=ngspice
only_toplevel=false
value="
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/combined/sky130.lib.spice CACE\{corner\}

.include CACE\{DUT_path\}

.temp CACE\{temperature\}

.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
"}
