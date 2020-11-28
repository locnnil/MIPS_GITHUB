transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/PC {C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/PC/PC.v}

vlog -vlog01compat -work work +incdir+C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/PC {C:/Users/rodri/Documents/GitHub/MIPS/MIPS_CPU/PC/PC_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  PC_TB

add wave *
view structure
view signals
run -all
