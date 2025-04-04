v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 260 -200 260 -160 {lab=rn}
N 180 -160 260 -160 {
lab=rn}
N 180 -300 420 -300 {lab=rp}
N 420 -300 420 -260 {lab=rp}
N 260 -280 260 -260 {lab=#net1}
N 260 -280 380 -280 {lab=#net1}
N 380 -180 420 -180 {lab=#net1}
N 380 -280 380 -180 {lab=#net1}
N 420 -200 420 -180 {lab=#net1}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 H. Pretl, Apache-2.0 license"}
C {devices/iopin.sym} 180 -300 0 1 {name=p2 lab=rp}
C {devices/iopin.sym} 180 -160 0 1 {name=p1 lab=rn}
C {sg13g2_pr/rhigh.sym} 260 -230 0 0 {name=R1
w=0.5e-6
l=3e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rhigh.sym} 420 -230 0 0 {name=R2[1..3]
w=0.5e-6
l=3e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
