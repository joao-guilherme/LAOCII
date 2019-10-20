transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/pratica2.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/processador.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/memoria.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/decodificador.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/registrador.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/controle.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/ULA.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/multiplexador.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/multiplexadorBR.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/pratica2 {/home/joao/altera/LAOCII/Pratica_02/pratica2/displays.v}

