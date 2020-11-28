transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Rodrigo\ Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/counter {C:/Users/Rodrigo Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/counter/counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Rodrigo\ Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/controller {C:/Users/Rodrigo Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/controller/controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/Rodrigo\ Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/acc {C:/Users/Rodrigo Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/acc/acc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Rodrigo\ Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/4_bit_adder {C:/Users/Rodrigo Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/4_bit_adder/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Rodrigo\ Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador {C:/Users/Rodrigo Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/multiplicador.v}

vlog -vlog01compat -work work +incdir+C:/Users/Rodrigo\ Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador {C:/Users/Rodrigo Coelho/Desktop/unifei/ELTD15/MIPS/MIPS_CPU/Multiplicador/multiplicador_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  multiplicador_TB

add wave *
view structure
view signals
run -all
