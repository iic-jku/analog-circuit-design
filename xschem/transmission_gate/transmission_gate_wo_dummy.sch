v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Parameterizable Transmission Gate without Dummies} 590 -1690 0 0 1 1 {}
T {-) In most cases, equal W/L ratios for both p- and n-MOSFETs are used.

-) For transmission gates, the sizing of PMOS could be the same as NMOS because large PMOS increases its 
parasitic capacitance at the drain and the source. Thus, the speed is decreased in turn when (W/L)p=3(W/L)n.

-) If W is increased, the on-resistance decreases and vice versa.
 
-) If L is increased, the drain-source leakage current decreases but the TG gets slower and vice versa.

-) Furthermore, larger switches have more charge in the inversion layer, which leads to increased charge injection when the switches are turned off. 
Larger switches also increase the drain-source overlap capacitance, which leads to increased clock feedthrough.
Accordingly, larger switches are not always the solution. Alternatively, one can use bootstrapped switches [Wulff].

-) If available, minimum-sized thick-oxide MOSFETs decrease leakage currents and charge injection simultaneously [Fath].} 300 -1540 0 0 0.5 0.5 {}
T {di_tg_ctrl = 1, di_tg_ctrl_n = 0: v_a connected to v_b
di_tg_ctrl = 0, di_tg_ctrl_n = 1: v_a = X, v_b = HIGH-Z} 880 -360 0 0 0.5 0.5 {}
N 1200 -540 1200 -500 {
lab=di_tg_ctrl}
N 1200 -940 1200 -900 {
lab=di_tg_ctrl_n}
N 1230 -860 1240 -860 {
lab=v_b}
N 1240 -860 1240 -800 {
lab=v_b}
N 1160 -860 1170 -860 {
lab=v_a}
N 1160 -860 1160 -800 {
lab=v_a}
N 1040 -800 1160 -800 {
lab=v_a}
N 1160 -580 1170 -580 {
lab=v_a}
N 1160 -640 1160 -580 {
lab=v_a}
N 1040 -640 1160 -640 {
lab=v_a}
N 1240 -640 1240 -580 {
lab=v_b}
N 1230 -580 1240 -580 {
lab=v_b}
N 1200 -860 1200 -760 {
lab=VDD}
N 1200 -760 1340 -760 {
lab=VDD}
N 1200 -680 1200 -580 {
lab=VSS}
N 1340 -680 1340 -500 {
lab=VSS}
N 1200 -680 1340 -680 {
lab=VSS}
N 1040 -720 1040 -640 {
lab=v_a}
N 1000 -720 1040 -720 {
lab=v_a}
N 1040 -800 1040 -720 {
lab=v_a}
N 1460 -720 1460 -640 {
lab=v_b}
N 1460 -720 1500 -720 {
lab=v_b}
N 1460 -800 1460 -720 {
lab=v_b}
N 1340 -940 1340 -760 {lab=VDD}
N 1240 -640 1460 -640 {
lab=v_b}
N 1240 -800 1460 -800 {
lab=v_b}
C {devices/title-3.sym} 0 0 0 0 {name=l1 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/iopin.sym} 1000 -720 0 1 {name=p2 lab=v_a}
C {devices/iopin.sym} 1500 -720 0 0 {name=p4 lab=v_b}
C {sg13g2_pr/sg13_lv_nmos.sym} 1200 -560 1 1 {name=M1
l=L_N
w=W_N
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1200 -880 1 0 {name=M2
l=L_P
w=W_P
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/iopin.sym} 1340 -940 3 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 1340 -500 1 0 {name=p7 lab=VSS}
C {devices/ipin.sym} 1200 -500 3 0 {name=p8 lab=di_tg_ctrl}
C {devices/ipin.sym} 1200 -940 1 0 {name=p9 lab=di_tg_ctrl_n}
