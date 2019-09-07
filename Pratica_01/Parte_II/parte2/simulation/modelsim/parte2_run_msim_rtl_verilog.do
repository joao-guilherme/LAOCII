transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_01/Parte_II/parte2 {/home/joao/altera/LAOCII/Pratica_01/Parte_II/parte2/parte2.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_01/Parte_II/parte2 {/home/joao/altera/LAOCII/Pratica_01/Parte_II/parte2/decodificador.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_01/Parte_II/parte2 {/home/joao/altera/LAOCII/Pratica_01/Parte_II/parte2/ramlpm.v}

