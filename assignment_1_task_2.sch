v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -290 90 -290 120 {lab=GND}
N 0 50 -0 90 {lab=GND}
N -60 90 -0 90 {lab=GND}
N -290 50 -290 90 {lab=GND}
N 190 50 190 90 {lab=GND}
N 0 90 190 90 {lab=GND}
N -60 20 0 20 {lab=GND}
N -60 20 -60 90 {lab=GND}
N -290 90 -60 90 {lab=GND}
N 190 20 260 20 {lab=GND}
N 260 20 260 90 {lab=GND}
N 190 90 260 90 {lab=GND}
N 70 20 150 20 {lab=v_gs}
N 0 -30 -0 -10 {lab=v_gs}
N 0 -30 70 -30 {lab=v_gs}
N -0 -50 0 -30 {lab=v_gs}
N 70 -30 70 20 {lab=v_gs}
N 40 20 70 20 {lab=v_gs}
N -290 -110 -290 -10 {lab=v_dd}
N -290 -110 -0 -110 {lab=v_dd}
N 190 -110 370 -110 {lab=v_out}
N 370 40 370 90 {lab=GND}
N 260 90 370 90 {lab=GND}
N 370 -110 370 -20 {lab=v_out}
N 190 -110 190 -90 {lab=v_out}
N 190 -30 190 -10 {lab=#net1}
C {sg13g2_pr/sg13_lv_nmos.sym} 20 20 0 1 {name=M1
l=0.5u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 170 20 0 0 {name=M2
l=0.5u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/vsource.sym} -290 20 0 0 {name=Vdd value=1.5}
C {isource.sym} 0 -80 0 0 {name=I0 value=\{I_in\}}
C {devices/gnd.sym} -290 120 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -290 -110 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/lab_pin.sym} 370 -110 0 1 {name=p7 sig_type=std_logic lab=v_out}
C {devices/vsource.sym} 370 10 0 0 {name=Vout value=1.5}
C {devices/code_shown.sym} -660 -170 0 0 {name=NGSPICE_CTRL only_toplevel=true 
value="
.temp 27
.control
save all

.param I_in = 10u


dc Vout 0 1.5 10m
plot i(Viout1) vs v(v_out)
op
show all

show n.xm2.nsg13_lv_nmos
*show xm2:sg13g2_lv_nmos_ps[gds]

.endc
"}
C {devices/lab_pin.sym} 100 20 1 1 {name=p1 sig_type=std_logic lab=v_gs}
C {devices/code_shown.sym} -670 220 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/ammeter.sym} 190 -60 0 0 {name=Viout1 savecurrent=true spice_ignore=0}
