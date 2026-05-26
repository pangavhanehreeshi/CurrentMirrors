v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -320 -160 -130 -160 {lab=v_dd}
N -130 -90 -130 -70 {lab=Vout}
N -130 -10 -130 80 {lab=GND}
N -190 80 -130 80 {lab=GND}
N -130 -90 -0 -90 {lab=Vout}
N -130 -100 -130 -90 {lab=Vout}
N -90 -40 -0 -40 {lab=Vout}
N 0 20 -0 80 {lab=GND}
N -130 80 -0 80 {lab=GND}
N -0 -90 -0 -40 {lab=Vout}
N -0 -90 300 -90 {lab=Vout}
N -320 -160 -320 -70 {lab=v_dd}
N -320 -10 -320 80 {lab=GND}
N -190 -40 -130 -40 {lab=GND}
N -190 -40 -190 80 {lab=GND}
N -320 80 -190 80 {lab=GND}
C {isource.sym} -130 -130 0 0 {name=I0 value=\{I_in\}}
C {sg13g2_pr/sg13_lv_nmos.sym} -110 -40 0 1 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {capa.sym} 0 -10 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/code_shown.sym} -870 -390 0 0 {name=NGSPICE_CTRL only_toplevel=true 
value="
.temp 27
.control
save all
.ic v(Vout)=0
.param I_in = 1u



tran 0.05u 3u uic
plot v(Vout)








*.temp 27
*.control
*option numdgt=4
*set wr_singlescale
*set wr_vecnames
*save all
*.ic v(Vout)=0
*.param I_in = 1u

*compose IC_vec start=0 stop=1.8 step=0.3

*foreach icval $&IC_vec
*    alterparam IC_start = $icval
*    reset
    
*    tran 0.05u 3u uic
*    plot v(Vout) 
*end


.endc
"}
C {devices/vsource.sym} -320 -40 0 0 {name=Vdd value=1.5}
C {devices/lab_pin.sym} 300 -90 0 1 {name=p7 sig_type=std_logic lab=Vout}
C {devices/lab_pin.sym} -320 -160 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/gnd.sym} -320 80 0 0 {name=l3 lab=GND}
C {devices/code_shown.sym} -350 260 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
