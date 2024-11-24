v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Parameterizable Transmission Gate with Dummies} 590 -1690 0 0 1 1 {}
T {-) In most cases, equal W/L ratios for both p- and n-MOSFETs are used. But sizing according to their µCox-ratio is also fine.

-) For transmission gates, the sizing of PMOS could be the same as NMOS because large PMOS increases its 
parasitic capacitance at the drain and the source. Thus, the speed is decreased in turn when (W/L)p=3(W/L)n.

-) Minimum-sized thick-oxide MOSFETs decrease leakage currents and charge injection simultaneously [Fath].

-) Dummy MOSFETs for compensating charge injection.} 480 -1520 0 0 0.5 0.5 {}
T {di_tg_ctrl = 1, di_tg_ctrl_n = 0: v_a connected to v_b
di_tg_ctrl = 0, di_tg_ctrl_n = 1: v_a = X, v_b = HIGH-Z} 880 -460 0 0 0.5 0.5 {}
N 1120 -700 1120 -660 {
lab=di_tg_ctrl}
N 1120 -1100 1120 -1060 {
lab=di_tg_ctrl_n}
N 1150 -1020 1160 -1020 {
lab=v_b}
N 1160 -1020 1160 -960 {
lab=v_b}
N 1300 -960 1420 -960 {
lab=v_b}
N 1220 -1020 1230 -1020 {
lab=v_b}
N 1220 -1020 1220 -960 {
lab=v_b}
N 1160 -960 1220 -960 {
lab=v_b}
N 1290 -1020 1300 -1020 {
lab=v_b}
N 1300 -1020 1300 -960 {
lab=v_b}
N 1220 -960 1300 -960 {
lab=v_b}
N 1260 -1100 1260 -1060 {
lab=di_tg_ctrl}
N 1080 -1020 1090 -1020 {
lab=v_a}
N 1080 -1020 1080 -960 {
lab=v_a}
N 960 -960 1080 -960 {
lab=v_a}
N 1080 -740 1090 -740 {
lab=v_a}
N 1080 -800 1080 -740 {
lab=v_a}
N 960 -800 1080 -800 {
lab=v_a}
N 1220 -740 1230 -740 {
lab=v_b}
N 1220 -800 1220 -740 {
lab=v_b}
N 1160 -800 1220 -800 {
lab=v_b}
N 1160 -800 1160 -740 {
lab=v_b}
N 1150 -740 1160 -740 {
lab=v_b}
N 1300 -800 1420 -800 {
lab=v_b}
N 1260 -700 1260 -660 {
lab=di_tg_ctrl_n}
N 1120 -1020 1120 -920 {
lab=VDD}
N 1260 -920 1360 -920 {
lab=VDD}
N 1360 -1100 1360 -920 {
lab=VDD}
N 1260 -1020 1260 -920 {
lab=VDD}
N 1120 -920 1260 -920 {
lab=VDD}
N 1120 -840 1120 -740 {
lab=VSS}
N 1260 -840 1360 -840 {
lab=VSS}
N 1360 -840 1360 -660 {
lab=VSS}
N 1260 -840 1260 -740 {
lab=VSS}
N 1120 -840 1260 -840 {
lab=VSS}
N 960 -880 960 -800 {
lab=v_a}
N 920 -880 960 -880 {
lab=v_a}
N 960 -960 960 -880 {
lab=v_a}
N 1420 -880 1420 -800 {
lab=v_b}
N 1420 -880 1460 -880 {
lab=v_b}
N 1420 -960 1420 -880 {
lab=v_b}
N 1290 -740 1300 -740 {lab=v_b}
N 1300 -800 1300 -740 {lab=v_b}
N 1220 -800 1300 -800 {
lab=v_b}
C {devices/title-3.sym} 0 0 0 0 {name=l1 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/iopin.sym} 920 -880 0 1 {name=p2 lab=v_a}
C {devices/iopin.sym} 1460 -880 0 0 {name=p4 lab=v_b}
C {sg13g2_pr/sg13_lv_nmos.sym} 1120 -720 1 1 {name=M1
l=L_N
w=W_N
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1120 -1040 1 0 {name=M2
l=L_P
w=W_P
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1260 -1040 1 0 {name=Mdummy2
l=L_P_D
w=W_P_D
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1260 -720 1 1 {name=Mdummy1
l=L_N_D
w=W_N_D
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1260 -1100 1 0 {name=p12 sig_type=std_logic lab=di_tg_ctrl}
C {devices/lab_pin.sym} 1260 -660 3 0 {name=p13 sig_type=std_logic lab=di_tg_ctrl_n}
C {devices/iopin.sym} 1360 -1100 3 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 1360 -660 1 0 {name=p7 lab=VSS}
C {devices/ipin.sym} 1120 -660 3 0 {name=p8 lab=di_tg_ctrl}
C {devices/ipin.sym} 1120 -1100 1 0 {name=p9 lab=di_tg_ctrl_n}
