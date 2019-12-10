transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/LAOCII/Pratica_04/parte_2 {C:/altera/LAOCII/Pratica_04/parte_2/parte_2.v}
vlog -vlog01compat -work work +incdir+C:/altera/LAOCII/Pratica_04/parte_2 {C:/altera/LAOCII/Pratica_04/parte_2/memory.v}
vlog -vlog01compat -work work +incdir+C:/altera/LAOCII/Pratica_04/parte_2 {C:/altera/LAOCII/Pratica_04/parte_2/cache.v}
vlog -vlog01compat -work work +incdir+C:/altera/LAOCII/Pratica_04/parte_2 {C:/altera/LAOCII/Pratica_04/parte_2/bus.v}
vlog -vlog01compat -work work +incdir+C:/altera/LAOCII/Pratica_04/parte_2 {C:/altera/LAOCII/Pratica_04/parte_2/counter.v}

