v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 180 -160 240 -160 {
lab=rn}
N 240 -200 240 -160 {lab=rn}
N 180 -300 400 -300 {lab=rp}
N 400 -300 400 -260 {lab=rp}
N 240 -280 240 -260 {lab=#net1}
N 240 -280 360 -280 {lab=#net1}
N 360 -280 360 -160 {lab=#net1}
N 360 -160 400 -160 {lab=#net1}
N 400 -200 400 -160 {lab=#net1}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2025 H. Pretl, Apache-2.0 license"}
C {devices/iopin.sym} 180 -300 0 1 {name=p2 lab=rp}
C {devices/iopin.sym} 180 -160 0 1 {name=p1 lab=rn}
C {sg13g2_pr/rppd.sym} 240 -230 0 0 {name=R1
w=0.5e-6
l=10e-6
model=rppd
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 400 -230 0 0 {name=R2[1..5]
w=0.5e-6
l=10e-6
model=rppd
spiceprefix=X
b=0
m=1
}
