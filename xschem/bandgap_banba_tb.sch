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
N 660 -360 660 -320 {lab=GND}
N 560 -320 660 -320 {
lab=GND}
N 660 -520 660 -420 {lab=ena}
N 560 -600 560 -420 {lab=v_dd}
N 870 -320 1120 -320 {
lab=GND}
N 1120 -520 1120 -460 {lab=vref}
N 1120 -400 1120 -320 {lab=GND}
N 870 -600 870 -550 {lab=v_dd}
N 560 -600 870 -600 {lab=v_dd}
N 870 -490 870 -320 {lab=GND}
N 660 -320 870 -320 {
lab=GND}
N 960 -520 1120 -520 {lab=vref}
N 660 -520 820 -520 {lab=ena}
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
option method=gear
option noacct
option noinit
save v(vref)
save all

compose temp_vec start=-30 stop=125 step=5
let vref_vec=vector(length(temp_vec))
let idx=0

foreach tmp $&temp_vec
  option temp=$tmp
  tran 0.01u 50u
  meas tran vr FIND v(vref) AT=50u
  let vref_vec[idx]=vr
  let idx=idx+1
end

plot vref_vec vs temp_vec
wrdata bandgap_banba.txt vref_vec vs temp_vec

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
C {devices/lab_pin.sym} 560 -600 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/lab_wire.sym} 1120 -520 0 0 {name=p1 sig_type=std_logic lab=vref}
C {devices/vsource.sym} 660 -390 0 0 {name=V1 value="1.5 pwl(0 0 1u 0 1.001u 1.5)" savecurrent=false}
C {devices/lab_pin.sym} 660 -520 0 0 {name=p7 sig_type=std_logic lab=ena}
C {bandgap_banba.sym} 890 -520 0 0 {name=xbg}
C {devices/capa.sym} 1120 -430 0 0 {name=Cload
m=1
value=10f}
