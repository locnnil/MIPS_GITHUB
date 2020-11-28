transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/Decoder/dec7442 {C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/Decoder/dec7442/dec7442.v}
vlog -vlog01compat -work work +incdir+C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/Decoder {C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/Decoder/Decoder.v}

vlog -vlog01compat -work work +incdir+C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/Decoder {C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/Decoder/Decoder_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  Decoder_TB

add wave *
view structure
view signals
run -all
