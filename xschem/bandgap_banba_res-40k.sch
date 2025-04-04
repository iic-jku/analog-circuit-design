v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 320 -300 320 -260 {
lab=rp,r[1..3]}
N 320 -200 320 -160 {
lab=r[1..3],rn}
N 240 -160 320 -160 {
lab=r[1..3],rn}
N 240 -300 320 -300 {
lab=rp,r[1..3]}
N 180 -160 220 -160 {
lab=rn}
N 180 -300 220 -300 {
lab=rp}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 H. Pretl, Apache-2.0 license"}
C {devices/iopin.sym} 180 -300 0 1 {name=p2 lab=rp}
C {devices/iopin.sym} 180 -160 0 1 {name=p1 lab=rn}
C {devices/lab_wire.sym} 310 -300 0 0 {name=p3 sig_type=std_logic lab=rp,r[1..3]}
C {devices/lab_wire.sym} 310 -160 0 0 {name=p4 sig_type=std_logic lab=r[1..3],rn}
C {sg13g2_pr/rhigh.sym} 320 -230 0 0 {name=R[1..4]
w=0.5e-6
l=3e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
