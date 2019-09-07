transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_01/Parte_I/parte1 {/home/joao/altera/LAOCII/Pratica_01/Parte_I/parte1/ramlpm.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_01/Parte_I/parte1 {/home/joao/altera/LAOCII/Pratica_01/Parte_I/parte1/parte1.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_01/Parte_I/parte1 {/home/joao/altera/LAOCII/Pratica_01/Parte_I/parte1/decodificador.v}

