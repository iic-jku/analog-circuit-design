v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 520 -300 520 -280 {
lab=GND}
N 600 -300 600 -280 {
lab=GND}
N 600 -380 600 -360 {
lab=v_ss}
N 1050 -830 1090 -830 {
lab=v_dd}
N 1050 -550 1050 -380 {
lab=v_ss}
N 1300 -530 1300 -380 {
lab=v_ss}
N 1150 -610 1300 -610 {
lab=voutp}
N 900 -610 970 -610 {
lab=#net1}
N 700 -510 700 -380 {
lab=v_ss}
N 600 -380 700 -380 {
lab=v_ss}
N 700 -650 700 -570 {
lab=v_cm}
N 830 -650 970 -650 {
lab=v_cm}
N 1090 -830 1090 -810 {
lab=v_dd}
N 1090 -750 1090 -710 {
lab=#net2}
N 1050 -760 1050 -710 {
lab=v_dd}
N 520 -760 1050 -760 {
lab=v_dd}
N 520 -760 520 -360 {
lab=v_dd}
N 1050 -830 1050 -760 {
lab=v_dd}
N 1090 -400 1090 -380 {
lab=v_ss}
N 1050 -380 1090 -380 {
lab=v_ss}
N 700 -380 1050 -380 {
lab=v_ss}
N 1090 -550 1090 -460 {
lab=v_ena}
N 830 -650 830 -630 {lab=v_cm}
N 700 -650 830 -650 {
lab=v_cm}
N 900 -610 900 -540 {lab=#net1}
N 830 -540 900 -540 {lab=#net1}
N 830 -570 830 -540 {lab=#net1}
N 1420 -570 1420 -380 {
lab=v_ss}
N 1300 -610 1300 -590 {lab=voutp}
N 1300 -380 1420 -380 {lab=v_ss}
N 1090 -380 1300 -380 {
lab=v_ss}
N 1150 -650 1420 -650 {lab=voutn}
N 1420 -650 1420 -630 {lab=voutn}
C {devices/code_shown.sym} 0 -180 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"}
C {devices/code_shown.sym} 0 -750 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
option sparse
set filetype=ascii
save all

op
write ota-diff_tb-acol.raw
set appendwrite

ac dec 101 1k 10G
write ota-diff_tb-acol.raw
plot 20*log10(voutp-voutn)

*noise v(voutp-voutn) Vin lin 1000 1MEG 10G 1
*print inoise_total
*print onoise_total

*setplot noise1
*plot inoise_spectrum linplot
*plot onoise_spectrum linplot

*setplot noise2
*write ota-diff_tb-acol.raw

.endc
"}
C {devices/vsource.sym} 520 -330 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 520 -280 0 0 {name=l3 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024-2025 H. Pretl, Apache-2.0 license"}
C {devices/launcher.sym} 500 -160 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 740 -160 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {lab_pin.sym} 520 -380 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {ota-diff.sym} 1050 -630 0 0 {name=xota}
C {devices/vsource.sym} 600 -330 0 0 {name=Vss value=0}
C {devices/gnd.sym} 600 -280 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 600 -380 0 0 {name=p1 sig_type=std_logic lab=v_ss}
C {capa.sym} 1300 -560 0 0 {name=C1
value=10f}
C {lab_wire.sym} 1300 -610 0 0 {name=p3 sig_type=std_logic lab=voutp}
C {devices/vsource.sym} 700 -540 0 0 {name=Vcm value="dc 0.75"}
C {lab_wire.sym} 760 -650 0 0 {name=p4 sig_type=std_logic lab=v_cm}
C {isource.sym} 1090 -780 0 0 {name=I0 value=20u pwl(0 0 10u 0 11u 20u)"}
C {vsource.sym} 1090 -430 0 0 {name=Venable value=1.5 savecurrent=false}
C {spice_probe.sym} 820 -650 0 0 {name=p5 attrs=""}
C {spice_probe.sym} 1180 -610 0 0 {name=p6 attrs=""}
C {spice_probe.sym} 1090 -470 0 0 {name=p7 attrs=""}
C {lab_wire.sym} 1090 -530 0 0 {name=p8 sig_type=std_logic lab=v_ena}
C {devices/vsource.sym} 830 -600 0 0 {name=Vin value="dc 0 ac 1"}
C {capa.sym} 1420 -600 0 0 {name=C2
value=10f}
C {lab_wire.sym} 1420 -650 0 0 {name=p9 sig_type=std_logic lab=voutn}
C {spice_probe.sym} 1300 -650 0 0 {name=p10 attrs=""}
