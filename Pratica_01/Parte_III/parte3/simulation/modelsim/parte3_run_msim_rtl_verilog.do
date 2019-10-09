transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_01/Parte_III/parte3 {/home/joao/altera/LAOCII/Pratica_01/Parte_III/parte3/decoder.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_01/Parte_III/parte3 {/home/joao/altera/LAOCII/Pratica_01/Parte_III/parte3/parte3.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_01/Parte_III/parte3 {/home/joao/altera/LAOCII/Pratica_01/Parte_III/parte3/cache.v}

