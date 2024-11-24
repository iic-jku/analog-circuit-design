v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Parameterizable Transmission Gate without Dummies} 590 -1690 0 0 1 1 {}
T {-) In most cases, equal W/L ratios for both p- and n-MOSFETs are used. But sizing according to their µCox-ratio is also fine.

-) For transmission gates, the sizing of PMOS could be the same as NMOS because large PMOS increases its 
parasitic capacitance at the drain and the source. Thus, the speed is decreased in turn when (W/L)p=3(W/L)n.

-) Minimum-sized thick-oxide MOSFETs decrease leakage currents and charge injection simultaneously [Fath].} 480 -1520 0 0 0.5 0.5 {}
T {di_tg_ctrl = 1, di_tg_ctrl_n = 0: v_a connected to v_b
di_tg_ctrl = 0, di_tg_ctrl_n = 1: v_a = X, v_b = HIGH-Z} 880 -460 0 0 0.5 0.5 {}
N 1200 -700 1200 -660 {
lab=di_tg_ctrl}
N 1200 -1100 1200 -1060 {
lab=di_tg_ctrl_n}
N 1230 -1020 1240 -1020 {
lab=v_b}
N 1240 -1020 1240 -960 {
lab=v_b}
N 1160 -1020 1170 -1020 {
lab=v_a}
N 1160 -1020 1160 -960 {
lab=v_a}
N 1040 -960 1160 -960 {
lab=v_a}
N 1160 -740 1170 -740 {
lab=v_a}
N 1160 -800 1160 -740 {
lab=v_a}
N 1040 -800 1160 -800 {
lab=v_a}
N 1240 -800 1240 -740 {
lab=v_b}
N 1230 -740 1240 -740 {
lab=v_b}
N 1200 -1020 1200 -920 {
lab=VDD}
N 1200 -920 1340 -920 {
lab=VDD}
N 1200 -840 1200 -740 {
lab=VSS}
N 1340 -840 1340 -660 {
lab=VSS}
N 1200 -840 1340 -840 {
lab=VSS}
N 1040 -880 1040 -800 {
lab=v_a}
N 1000 -880 1040 -880 {
lab=v_a}
N 1040 -960 1040 -880 {
lab=v_a}
N 1460 -880 1460 -800 {
lab=v_b}
N 1460 -880 1500 -880 {
lab=v_b}
N 1460 -960 1460 -880 {
lab=v_b}
N 1340 -1100 1340 -920 {lab=VDD}
N 1240 -800 1460 -800 {
lab=v_b}
N 1240 -960 1460 -960 {
lab=v_b}
C {devices/title-3.sym} 0 0 0 0 {name=l1 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/iopin.sym} 1000 -880 0 1 {name=p2 lab=v_a}
C {devices/iopin.sym} 1500 -880 0 0 {name=p4 lab=v_b}
C {sg13g2_pr/sg13_lv_nmos.sym} 1200 -720 1 1 {name=M1
l=L_N
w=W_N
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1200 -1040 1 0 {name=M2
l=L_P
w=W_P
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/iopin.sym} 1340 -1100 3 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 1340 -660 1 0 {name=p7 lab=VSS}
C {devices/ipin.sym} 1200 -660 3 0 {name=p8 lab=di_tg_ctrl}
C {devices/ipin.sym} 1200 -1100 1 0 {name=p9 lab=di_tg_ctrl_n}
