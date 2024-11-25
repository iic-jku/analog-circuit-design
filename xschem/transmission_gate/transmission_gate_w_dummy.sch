v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Parameterizable Transmission Gate with Dummies} 590 -1690 0 0 1 1 {}
T {-) In most cases, equal W/L ratios for both p- and n-MOSFETs are used.

-) For transmission gates, the sizing of PMOS could be the same as NMOS because large PMOS increases its 
parasitic capacitance at the drain and the source. Thus, the speed is decreased in turn when (W/L)p=3(W/L)n.

-) If W is increased, the on-resistance decreases and vice versa.
 
-) If L is increased, the drain-source leakage current decreases but the TG gets slower and vice versa.

-) Furthermore, larger switches have more charge in the inversion layer, which leads to increased charge injection when the switches are turned off. 
Larger switches also increase the drain-source overlap capacitance, which leads to increased clock feedthrough.
Accordingly, larger switches are not always the solution. Alternatively, one can use bootstrapped switches [Wulff].

-) To compensate charge injection and clock feedthrough dummy MOSFETs with half W can be used [Baker].

-) If available, minimum-sized thick-oxide MOSFETs decrease leakage currents and charge injection simultaneously [Fath].} 300 -1560 0 0 0.5 0.5 {}
T {di_tg_ctrl = 1, di_tg_ctrl_n = 0: v_a connected to v_b
di_tg_ctrl = 0, di_tg_ctrl_n = 1: v_a = X, v_b = HIGH-Z} 880 -320 0 0 0.5 0.5 {}
N 1160 -520 1160 -480 {
lab=di_tg_ctrl}
N 1160 -920 1160 -880 {
lab=di_tg_ctrl_n}
N 1190 -840 1200 -840 {
lab=v_b}
N 1200 -840 1200 -780 {
lab=v_b}
N 1340 -780 1460 -780 {
lab=v_b}
N 1260 -840 1270 -840 {
lab=v_b}
N 1260 -840 1260 -780 {
lab=v_b}
N 1200 -780 1260 -780 {
lab=v_b}
N 1330 -840 1340 -840 {
lab=v_b}
N 1340 -840 1340 -780 {
lab=v_b}
N 1260 -780 1340 -780 {
lab=v_b}
N 1300 -920 1300 -880 {
lab=di_tg_ctrl}
N 1120 -840 1130 -840 {
lab=v_a}
N 1120 -840 1120 -780 {
lab=v_a}
N 1000 -780 1120 -780 {
lab=v_a}
N 1120 -560 1130 -560 {
lab=v_a}
N 1120 -620 1120 -560 {
lab=v_a}
N 1000 -620 1120 -620 {
lab=v_a}
N 1260 -560 1270 -560 {
lab=v_b}
N 1260 -620 1260 -560 {
lab=v_b}
N 1200 -620 1260 -620 {
lab=v_b}
N 1200 -620 1200 -560 {
lab=v_b}
N 1190 -560 1200 -560 {
lab=v_b}
N 1340 -620 1460 -620 {
lab=v_b}
N 1300 -520 1300 -480 {
lab=di_tg_ctrl_n}
N 1160 -840 1160 -740 {
lab=VDD}
N 1300 -740 1400 -740 {
lab=VDD}
N 1400 -920 1400 -740 {
lab=VDD}
N 1300 -840 1300 -740 {
lab=VDD}
N 1160 -740 1300 -740 {
lab=VDD}
N 1160 -660 1160 -560 {
lab=VSS}
N 1300 -660 1400 -660 {
lab=VSS}
N 1400 -660 1400 -480 {
lab=VSS}
N 1300 -660 1300 -560 {
lab=VSS}
N 1160 -660 1300 -660 {
lab=VSS}
N 1000 -700 1000 -620 {
lab=v_a}
N 960 -700 1000 -700 {
lab=v_a}
N 1000 -780 1000 -700 {
lab=v_a}
N 1460 -700 1460 -620 {
lab=v_b}
N 1460 -700 1500 -700 {
lab=v_b}
N 1460 -780 1460 -700 {
lab=v_b}
N 1330 -560 1340 -560 {lab=v_b}
N 1340 -620 1340 -560 {lab=v_b}
N 1260 -620 1340 -620 {
lab=v_b}
C {devices/title-3.sym} 0 0 0 0 {name=l1 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/iopin.sym} 960 -700 0 1 {name=p2 lab=v_a}
C {devices/iopin.sym} 1500 -700 0 0 {name=p4 lab=v_b}
C {sg13g2_pr/sg13_lv_nmos.sym} 1160 -540 1 1 {name=M1
l=L_N
w=W_N
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1160 -860 1 0 {name=M2
l=L_P
w=W_P
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1300 -860 1 0 {name=Mdummy2
l=L_P_D
w=W_P_D
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1300 -540 1 1 {name=Mdummy1
l=L_N_D
w=W_N_D
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1300 -920 1 0 {name=p12 sig_type=std_logic lab=di_tg_ctrl}
C {devices/lab_pin.sym} 1300 -480 3 0 {name=p13 sig_type=std_logic lab=di_tg_ctrl_n}
C {devices/iopin.sym} 1400 -920 3 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 1400 -480 1 0 {name=p7 lab=VSS}
C {devices/ipin.sym} 1160 -480 3 0 {name=p8 lab=di_tg_ctrl}
C {devices/ipin.sym} 1160 -920 1 0 {name=p9 lab=di_tg_ctrl_n}
