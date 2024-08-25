v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {1.45 < 1.5(nom) < 1.55V} 190 -890 0 0 0.4 0.4 {}
T {4uA} 700 -150 0 0 0.4 0.4 {}
T {0.7 < 0.8(nom) < 0.9V} 290 -560 0 0 0.4 0.4 {}
N 720 -710 780 -710 {
lab=gate_p}
N 640 -660 640 -620 {
lab=gate_p}
N 640 -660 720 -660 {
lab=gate_p}
N 640 -680 640 -660 {
lab=gate_p}
N 720 -710 720 -660 {
lab=gate_p}
N 700 -710 720 -710 {
lab=gate_p}
N 820 -640 820 -620 {
lab=vout}
N 580 -280 680 -280 {
lab=gate_n}
N 580 -280 580 -240 {
lab=gate_n}
N 560 -280 580 -280 {
lab=gate_n}
N 460 -250 460 -160 {
lab=vss}
N 640 -160 720 -160 {
lab=vss}
N 720 -250 720 -160 {
lab=vss}
N 580 -180 580 -160 {
lab=vss}
N 460 -160 580 -160 {
lab=vss}
N 580 -210 640 -210 {
lab=vss}
N 640 -210 640 -160 {
lab=vss}
N 580 -160 640 -160 {
lab=vss}
N 720 -280 780 -280 {
lab=vss}
N 780 -280 780 -160 {
lab=vss}
N 720 -160 780 -160 {
lab=vss}
N 400 -280 460 -280 {
lab=vss}
N 400 -280 400 -160 {
lab=vss}
N 400 -160 460 -160 {
lab=vss}
N 640 -860 640 -740 {
lab=vdd}
N 700 -860 700 -820 {
lab=vdd}
N 640 -860 700 -860 {
lab=vdd}
N 820 -860 820 -740 {
lab=vdd}
N 700 -790 760 -790 {
lab=vdd}
N 760 -860 760 -790 {
lab=vdd}
N 700 -860 760 -860 {
lab=vdd}
N 820 -710 880 -710 {
lab=vdd}
N 880 -860 880 -710 {
lab=vdd}
N 820 -860 880 -860 {
lab=vdd}
N 760 -860 820 -860 {
lab=vdd}
N 580 -710 640 -710 {
lab=vdd}
N 580 -860 580 -710 {
lab=vdd}
N 580 -860 640 -860 {
lab=vdd}
N 780 -590 820 -590 {
lab=vss}
N 820 -640 1000 -640 {
lab=vout}
N 820 -680 820 -640 {
lab=vout}
N 640 -560 640 -520 {
lab=tail}
N 720 -520 820 -520 {
lab=tail}
N 820 -560 820 -520 {
lab=tail}
N 640 -590 780 -590 {
lab=vss}
N 640 -520 720 -520 {
lab=tail}
N 860 -590 920 -590 {
lab=vinn}
N 320 -860 580 -860 {
lab=vdd}
N 320 -160 400 -160 {
lab=vss}
N 180 -590 600 -590 {
lab=vinp}
N 180 -500 920 -500 {
lab=vinn}
N 260 -860 260 -820 {
lab=vdd}
N 180 -860 260 -860 {
lab=vdd}
N 260 -260 260 -240 {
lab=ena_n}
N 260 -180 260 -160 {
lab=vss}
N 180 -160 260 -160 {
lab=vss}
N 200 -790 220 -790 {
lab=d_ena}
N 200 -210 220 -210 {
lab=d_ena}
N 200 -740 480 -740 {
lab=d_ena}
N 200 -790 200 -740 {
lab=d_ena}
N 480 -790 480 -740 {
lab=d_ena}
N 480 -790 660 -790 {
lab=d_ena}
N 360 -260 360 -210 {
lab=ena_n}
N 180 -210 200 -210 {
lab=d_ena}
N 500 -280 560 -280 {
lab=gate_n}
N 920 -590 920 -500 {
lab=vinn}
N 560 -360 560 -280 {
lab=gate_n}
N 260 -760 260 -260 {
lab=ena_n}
N 780 -590 780 -280 {
lab=vss}
N 720 -520 720 -310 {
lab=tail}
N 200 -390 200 -210 {
lab=d_ena}
N 460 -440 560 -440 {
lab=ibias_20u}
N 460 -440 460 -310 {
lab=ibias_20u}
N 180 -440 460 -440 {
lab=ibias_20u}
N 200 -390 520 -390 {
lab=d_ena}
N 200 -740 200 -390 {
lab=d_ena}
N 260 -210 320 -210 {
lab=vss}
N 320 -210 320 -160 {
lab=vss}
N 260 -160 320 -160 {
lab=vss}
N 560 -440 560 -420 {
lab=ibias_20u}
N 560 -390 640 -390 {
lab=vss}
N 640 -390 640 -210 {
lab=vss}
N 260 -260 360 -260 {
lab=ena_n}
N 360 -210 540 -210 {
lab=ena_n}
N 700 -760 700 -710 {
lab=gate_p}
N 680 -710 700 -710 {
lab=gate_p}
N 260 -790 320 -790 {
lab=vdd}
N 320 -860 320 -790 {
lab=vdd}
N 260 -860 320 -860 {
lab=vdd}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Copyright 2024 Harald Pretl"}
C {sg13g2_pr/sg13_lv_nmos.sym} 700 -280 2 1 {name=M5
l=5u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 800 -710 0 0 {name=M4
l=5u
w=1.5u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 620 -590 2 1 {name=M1
l=5u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 840 -590 2 0 {name=M2
l=5u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 660 -710 0 1 {name=M3
l=5u
w=1.5u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 480 -280 2 0 {name=M6
l=5u
w=2.5u
ng=5
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 560 -210 2 1 {name=M9
l=0.13u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 680 -790 0 0 {name=M11
l=0.13u
w=1.5u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {ipin.sym} 180 -440 0 0 {name=p1 lab=ibias_20u}
C {iopin.sym} 180 -860 0 1 {name=p2 lab=vdd}
C {iopin.sym} 180 -160 0 1 {name=p3 lab=vss}
C {ipin.sym} 180 -590 0 0 {name=p4 lab=vinp}
C {ipin.sym} 180 -500 0 0 {name=p5 lab=vinn}
C {opin.sym} 1000 -640 0 0 {name=p6 lab=vout}
C {sg13g2_pr/sg13_lv_nmos.sym} 240 -210 2 1 {name=M7
l=0.13u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 240 -790 0 0 {name=M8
l=0.13u
w=1.5u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {ipin.sym} 180 -210 0 0 {name=p7 lab=d_ena}
C {sg13g2_pr/sg13_lv_nmos.sym} 540 -390 2 1 {name=M10
l=0.13u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_wire.sym} 360 -260 0 0 {name=p8 sig_type=std_logic lab=ena_n}
C {lab_wire.sym} 620 -280 0 0 {name=p9 sig_type=std_logic lab=gate_n}
C {lab_wire.sym} 760 -710 0 0 {name=p10 sig_type=std_logic lab=gate_p}
C {lab_wire.sym} 720 -440 0 0 {name=p11 sig_type=std_logic lab=tail}
