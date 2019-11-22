transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_04/parte_1/pratica1a {/home/joao/altera/LAOCII/Pratica_04/parte_1/pratica1a/pratica1a.v}
vlog -vlog01compat -work work +incdir+/home/joao/altera/LAOCII/Pratica_04/parte_1/pratica1a {/home/joao/altera/LAOCII/Pratica_04/parte_1/pratica1a/decoder.v}

