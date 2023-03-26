transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/altera/13.0sp1/newlab/reg32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/encoder32to5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/bus32to1.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/MDR.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/datapath.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/AND32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/OR32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/NEG32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/NOT32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/SHL32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/SHR32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/SHRA32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/ROL32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/ROR32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/ADD32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/SUB32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/DIV32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/MUL32.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/ALU.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/selandEncode.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/RAM.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/reg0.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/CONFF.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/MARreg.vhd}
vcom -93 -work work {C:/altera/13.0sp1/newlab/preloadVal.vhd}

vcom -93 -work work {C:/altera/13.0sp1/newlab/brmi_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  brmi_tb

add wave *
view structure
view signals
run 500 ns
