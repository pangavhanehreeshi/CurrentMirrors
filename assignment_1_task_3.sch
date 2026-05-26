v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 70 -120 70 -90 {lab=GND}
N 360 -160 360 -120 {lab=GND}
N 300 -120 360 -120 {lab=GND}
N 70 -160 70 -120 {lab=GND}
N 550 -160 550 -120 {lab=GND}
N 360 -120 550 -120 {lab=GND}
N 300 -190 360 -190 {lab=GND}
N 300 -190 300 -120 {lab=GND}
N 70 -120 300 -120 {lab=GND}
N 550 -190 620 -190 {lab=GND}
N 620 -190 620 -120 {lab=GND}
N 550 -120 620 -120 {lab=GND}
N 430 -190 510 -190 {lab=v_gs}
N 360 -240 360 -220 {lab=v_gs}
N 360 -240 430 -240 {lab=v_gs}
N 360 -260 360 -240 {lab=v_gs}
N 430 -240 430 -190 {lab=v_gs}
N 400 -190 430 -190 {lab=v_gs}
N 70 -320 70 -220 {lab=v_dd}
N 70 -320 360 -320 {lab=v_dd}
N 550 -410 730 -410 {lab=v_out}
N 730 -170 730 -120 {lab=GND}
N 620 -120 730 -120 {lab=GND}
N 730 -410 730 -230 {lab=v_out}
N 550 -410 550 -380 {lab=v_out}
N 550 -230 550 -220 {lab=#net1}
N 550 -270 620 -270 {lab=#net1}
N 620 -270 620 -230 {lab=#net1}
N 550 -230 620 -230 {lab=#net1}
N 550 -240 550 -230 {lab=#net1}
N 550 -320 550 -300 {lab=#net2}
C {sg13g2_pr/sg13_lv_nmos.sym} 380 -190 0 1 {name=M1
l=1u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 530 -190 0 0 {name=M2
l=1u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/vsource.sym} 70 -190 0 0 {name=Vdd value=1.5}
C {isource.sym} 360 -290 0 0 {name=I0 value=\{I_in\}}
C {devices/gnd.sym} 70 -90 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 70 -320 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/lab_pin.sym} 730 -410 0 1 {name=p7 sig_type=std_logic lab=v_out}
C {devices/vsource.sym} 730 -200 0 0 {name=Vout value=1.5}
C {devices/lab_pin.sym} 460 -190 1 1 {name=p1 sig_type=std_logic lab=v_gs}
C {devices/ammeter.sym} 550 -350 0 0 {name=Viout1 savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_lv_nmos.sym} 530 -270 0 0 {name=M3
l=0.5u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 510 -270 2 1 {name=p3 sig_type=std_logic lab=v_c}
C {devices/code_shown.sym} -350 -430 0 0 {name=NGSPICE_CTRL only_toplevel=true 
value="
.temp 27
.control
save all

.param I_in = 10u


dc Vout 0 1.5 10m
plot i(Viout1) vs v(v_out)


.endc
"}
C {devices/code_shown.sym} -360 -130 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/vsource.sym} 70 -440 0 0 {name=v_c value=1.2}
C {devices/gnd.sym} 70 -410 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 70 -470 2 1 {name=p4 sig_type=std_logic lab=v_c}
