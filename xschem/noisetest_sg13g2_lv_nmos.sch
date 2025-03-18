v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 860 -660 1320 -140 {flags=graph
y1=-14
y2=-7.0999996
ypos1=0
ypos2=2
divy=5
subdivy=8
unity=1
x1=-0.20312846
x2=10.796872
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0
node="\\"total; stot\\"
\\"1/f; sfl\\"
\\"id_thermal; sth\\"
"
color="4 10 5 16"
dataset=-1
unitx=1
logx=1
logy=1
rainbow=0}
T {tcleval(
gm = [to_eng [xschem raw value \\@n.xm1.nsg13_lv_nmos\\\\[gm\\\\]  0]]
ID = [to_eng [xschem raw value i(\\@n.xm1.nsg13_lv_nmos\\\\[ids\\\\])  0]]
gm/ID = [to_eng [xschem raw value \\@n.xm1.nsg13_lv_nmos\\\\[gm\\\\]  0]/[xschem raw value i(\\@n.xm1.nsg13_lv_nmos\\\\[ids\\\\])  0]]
id_thermal =[to_eng [xschem raw value onoise_n.xm1.nsg13_lv_nmos_idid 0] ]
gamma = [to_eng [expr [xschem raw value onoise_n.xm1.nsg13_lv_nmos_idid 0]**2/[xschem raw value \\@n.xm1.nsg13_lv_nmos\\\\[gm\\\\] 0]/4/1.38e-23/300 ]]
)} 600 -540 0 0 0.3 0.3 {floater=1}
N 510 -350 510 -330 {
lab=d}
N 390 -180 390 -150 {
lab=GND}
N 700 -180 700 -150 {
lab=GND}
N 610 -180 610 -150 {
lab=GND}
N 510 -270 510 -150 {
lab=GND}
N 610 -300 610 -240 {
lab=b}
N 390 -300 390 -240 {
lab=g}
N 390 -300 470 -300 {
lab=g}
N 510 -300 610 -300 {
lab=b}
N 510 -350 700 -350 {
lab=d}
N 700 -350 700 -240 {
lab=d}
N 780 -180 780 -150 {
lab=GND}
N 780 -280 780 -240 {
lab=n}
C {devices/gnd.sym} 510 -150 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 390 -210 0 0 {name=vg value="DC 0.75 AC 1" savecurrent=false}
C {devices/gnd.sym} 390 -150 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 700 -210 0 0 {name=vd value=0.9 savecurrent=false}
C {devices/gnd.sym} 700 -150 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 610 -210 2 1 {name=vsb value=\{vbx\} savecurrent=false}
C {devices/lab_wire.sym} 440 -300 0 0 {name=p1 sig_type=std_logic lab=g}
C {devices/lab_wire.sym} 610 -350 0 0 {name=p2 sig_type=std_logic lab=d}
C {devices/lab_wire.sym} 610 -300 0 0 {name=p3 sig_type=std_logic lab=b}
C {devices/code_shown.sym} 5 -1150 0 0 {name=COMMANDS1 only_toplevel=false
value="
.option sparse
.param wx=5u lx=0.13u vbx=0
.save all
.save @n.xm1.nsg13_lv_nmos[gm]
.save @n.xm1.nsg13_lv_nmos[ids]
.save @n.xm1.nsg13_lv_nmos[sid]
.save @n.xm1.nsg13_lv_nmos[sfl]

.control
set wr_vecnames
op
noise v(n) vg dec 10 1 1e11 1
noise v(n) vg lin  1 1 1 1
echo $plots

setplot noise1
let sth = sqrt(onoise_n.xm1.nsg13_lv_nmos^2 - onoise_n.xm1.nsg13_lv_nmos_flicker^2)
let sfl = onoise_n.xm1.nsg13_lv_nmos_flicker
let stot = onoise_n.xm1.nsg13_lv_nmos
write noisetest_sg13g2_lv_nmos.raw noise1.all

setplot noise3
print sqrt(@n.xm1.nsg13_lv_nmos[sfl])
print sqrt(@n.xm1.nsg13_lv_nmos[sid])
print onoise_spectrum
print onoise_n.xm1.nsg13_lv_nmos_flicker
print onoise_n.xm1.nsg13_lv_nmos_idid
print onoise_n.xm1.nsg13_lv_nmos_ibs
print onoise_n.xm1.nsg13_lv_nmos_idid
print onoise_n.xm1.nsg13_lv_nmos_ididedge
print onoise_n.xm1.nsg13_lv_nmos_ibd
print onoise_n.xm1.nsg13_lv_nmos_igd
print onoise_n.xm1.nsg13_lv_nmos_igig
print onoise_n.xm1.nsg13_lv_nmos_igs
print onoise_n.xm1.nsg13_lv_nmos_rdrain
print onoise_n.xm1.nsg13_lv_nmos_rgate
print onoise_n.xm1.nsg13_lv_nmos_rjund
print onoise_n.xm1.nsg13_lv_nmos_rjuns
print onoise_n.xm1.nsg13_lv_nmos_rsource
print onoise_n.xm1.nsg13_lv_nmos_rwell

.endc
"}
C {devices/title.sym} 160 -40 0 0 {name=l5 author="(c) 2024 M. Koefinger, Apache-2.0 license (adapted from B. Murmann)"}
C {devices/launcher.sym} 520 -1020 0 0 {name=h3
descr="save, netlist & simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
value="
.param wx=5u lx=0.13u vbx=0
.save all
.save @n.xm1.nsg13_lv_nmos[gm]
.save @n.xm1.nsg13_lv_nmos[ids]
.save @n.xm1.nsg13_lv_nmos[sid]
.save @n.xm1.nsg13_lv_nmos[sfl]

.control
set wr_vecnames
op
noise v(n) vg dec 10 1 1e11 1
noise v(n) vg lin  1 1 1 1
echo $plots
write noisetest_sg13g2_lv_nmos.raw noise1.all

setplot noise3
print onoise_spectrum
print onoise_n.xm1.nsg13_lv_nmos_flicker
print onoise_n.xm1.nsg13_lv_nmos_idid
print sqrt(@n.xm1.nsg13_lv_nmos[sfl])
print sqrt(@n.xm1.nsg13_lv_nmos[sid])
.endc
"}
C {devices/gnd.sym} 610 -150 0 0 {name=l4 lab=GND}
C {devices/ccvs.sym} 780 -210 0 0 {name=Hn vnam=vd value=1}
C {devices/gnd.sym} 780 -150 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 780 -280 0 0 {name=p4 sig_type=std_logic lab=n}
C {devices/launcher.sym} 520 -980 0 0 {name=h27
descr="load noise" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw noise; set show_hidden_texts 1 

"
}
C {devices/code_shown.sym} 5 -112.5 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {sg13g2_pr/sg13_lv_nmos.sym} 490 -300 0 0 {name=M1
l=\{lx\}
w=\{wx\}
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
