transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {ALU_6_1200mv_85c_slow.vho}

vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/control_unit.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /NA=ALU_6_1200mv_85c_vhd_slow.sdo -L altera -L cycloneiii -L gate_work -L work -voptargs="+acc"  control_unit

add wave *
view structure
view signals
run 1000 ns
