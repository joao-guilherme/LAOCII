transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/LAOCII/Pratica_04/parte_1/pratica1b {C:/altera/LAOCII/Pratica_04/parte_1/pratica1b/decoder.v}
vlog -vlog01compat -work work +incdir+C:/altera/LAOCII/Pratica_04/parte_1/pratica1b {C:/altera/LAOCII/Pratica_04/parte_1/pratica1b/pratica1b.v}

