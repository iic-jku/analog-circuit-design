v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Keep a few dummy resistors around
to compensate TC.} 420 -470 0 0 0.4 0.4 {}
N 180 -160 220 -160 {
lab=rn}
N 220 -300 260 -300 {
lab=rp}
N 460 -300 460 -260 {
lab=rp1,r[1..6]}
N 460 -200 460 -160 {
lab=r[1..6],rn}
N 380 -160 460 -160 {
lab=r[1..6],rn}
N 380 -300 460 -300 {
lab=rp1,r[1..6]}
N 320 -300 360 -300 {lab=rp1}
N 220 -460 260 -460 {lab=rp}
N 220 -460 220 -300 {lab=rp}
N 180 -300 220 -300 {
lab=rp}
N 320 -460 360 -460 {lab=rp}
N 360 -500 360 -460 {lab=rp}
N 220 -500 360 -500 {lab=rp}
N 220 -500 220 -460 {lab=rp}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2025 H. Pretl, Apache-2.0 license"}
C {devices/iopin.sym} 180 -300 0 1 {name=p2 lab=rp}
C {devices/iopin.sym} 180 -160 0 1 {name=p1 lab=rn}
C {devices/lab_wire.sym} 450 -300 0 0 {name=p5 sig_type=std_logic lab=rp1,r[1..6]}
C {devices/lab_wire.sym} 450 -160 0 0 {name=p6 sig_type=std_logic lab=r[1..6],rn}
C {sg13g2_pr/rppd.sym} 460 -230 0 0 {name=R[1..7]
w=0.5e-6
l=10e-6
model=rppd
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 290 -300 1 0 {name=R1[1..2]
w=0.5e-6
l=10e-6
model=rppd
spiceprefix=X
b=0
m=1
}
C {devices/lab_wire.sym} 360 -300 0 0 {name=p3 sig_type=std_logic lab=rp1}
C {sg13g2_pr/rppd.sym} 290 -460 1 0 {name=Rdummy[1..5]
w=0.5e-6
l=10e-6
model=rppd
spiceprefix=X
b=0
m=1
}
