onerror {resume}
quietly virtual signal -install /parte1 { /parte1/SW[13:9]} Address
quietly virtual signal -install /parte1 { /parte1/SW[7:0]} DataIn
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate -label Clock {/parte1/SW[17]}
add wave -noupdate -label {Write Enable} {/parte1/SW[16]}
add wave -noupdate -label Address -radix unsigned /parte1/Address
add wave -noupdate -label {Data In} -radix hexadecimal /parte1/DataIn
add wave -noupdate -divider Output
add wave -noupdate -label {Read Data} -radix hexadecimal /parte1/data_out
add wave -noupdate -label Memory -radix hexadecimal -childformat {{{/parte1/mem/altsyncram_component/mem_data[0]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[1]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[2]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[3]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[4]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[5]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[6]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[7]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[8]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[9]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[10]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[11]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[12]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[13]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[14]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[15]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[16]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[17]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[18]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[19]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[20]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[21]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[22]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[23]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[24]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[25]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[26]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[27]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[28]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[29]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[30]} -radix hexadecimal} {{/parte1/mem/altsyncram_component/mem_data[31]} -radix hexadecimal}} -expand -subitemconfig {{/parte1/mem/altsyncram_component/mem_data[0]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[1]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[2]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[3]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[4]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[5]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[6]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[7]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[8]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[9]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[10]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[11]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[12]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[13]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[14]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[15]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[16]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[17]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[18]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[19]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[20]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[21]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[22]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[23]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[24]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[25]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[26]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[27]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[28]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[29]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[30]} {-radix hexadecimal} {/parte1/mem/altsyncram_component/mem_data[31]} {-radix hexadecimal}} /parte1/mem/altsyncram_component/mem_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1299 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {5852 ps}
