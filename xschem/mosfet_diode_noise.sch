v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 750 -340 750 -280 {
lab=GND}
N 520 -340 520 -280 {
lab=GND}
N 750 -370 820 -370 {
lab=GND}
N 820 -370 820 -280 {
lab=GND}
N 750 -540 750 -500 {
lab=v_dd}
N 520 -540 520 -400 {
lab=v_dd}
N 520 -540 750 -540 {
lab=v_dd}
N 750 -420 750 -400 {
lab=v_gs}
N 680 -370 710 -370 {
lab=v_gs}
N 680 -420 680 -370 {
lab=v_gs}
N 680 -420 750 -420 {
lab=v_gs}
N 750 -440 750 -420 {
lab=v_gs}
C {devices/code_shown.sym} 0 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 0 -540 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
option sparse
save all
op
noise v(v_gs) Ibias dec 101 1k 300e9
setplot noise1
plot loglog onoise_spectrum
setplot noise2
print onoise_total
write mosfet_diode_noise.raw
.endc
"}
C {devices/gnd.sym} 750 -280 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 520 -370 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 520 -280 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 820 -280 0 0 {name=l4 lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 H. Pretl, Apache-2.0 license"}
C {sg13g2_pr/sg13_lv_nmos.sym} 730 -370 0 0 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/launcher.sym} 500 -160 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 740 -160 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/isource.sym} 750 -470 0 0 {name=Ibias value="dc 20u ac 1"}
C {devices/lab_pin.sym} 680 -420 0 0 {name=p1 sig_type=std_logic lab=v_gs}
C {devices/lab_pin.sym} 520 -540 0 0 {name=p2 sig_type=std_logic lab=v_dd}
