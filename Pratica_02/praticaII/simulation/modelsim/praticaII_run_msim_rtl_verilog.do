transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/praticaII.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/RB.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/ALU.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/register.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/multiplex.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/processor.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/MEM.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/control.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/decoder.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/decoderRB.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_02/praticaII {/home/joao/altera/LAOCII/Pratica_02/praticaII/register_PC.v}

