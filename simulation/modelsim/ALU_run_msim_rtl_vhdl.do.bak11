transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/control_unit.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/reg32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/encoder32to5.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/bus32to1.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/MDR.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/datapath.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/AND32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/OR32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/NEG32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/NOT32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/SHL32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/SHR32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/SHRA32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/ROL32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/ROR32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/ADD32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/SUB32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/DIV32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/MUL32.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/ALU.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/selandEncode.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/RAM.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/reg0.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/CONFF.vhd}
vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/MARreg.vhd}

vcom -93 -work work {C:/Users/salvi/repos/ELEC374Lab/phase3_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  phase3_tb

add wave *
view structure
view signals
run 1000 ns
