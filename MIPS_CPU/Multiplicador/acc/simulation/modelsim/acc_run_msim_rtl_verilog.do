transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/rodri/Documents/UNIFEI/ELTD15/Lab04/Multiplicador_A/acc {C:/Users/rodri/Documents/UNIFEI/ELTD15/Lab04/Multiplicador_A/acc/acc.v}

