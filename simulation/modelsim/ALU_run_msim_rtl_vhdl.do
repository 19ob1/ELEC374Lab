transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/reg32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/encoder32to5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/bus32to1.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/MDR.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/datapath.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/AND32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/OR32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/NEG32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/NOT32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/SHL32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/SHR32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/SHRA32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/ROL32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/ROR32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/ADD32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/SUB32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/DIV32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/MUL32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/ALU.vhd}

vcom -93 -work work {C:/altera/13.0sp1/elec374/ALU/tb3_5.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  tb3_5

add wave *
view structure
view signals
run 500 ns
