onerror {resume}
quietly virtual signal -install /parte2 { /parte2/SW[13:9]} Address
quietly virtual signal -install /parte2 { /parte2/SW[7:0]} DataIn
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate -label Clock {/parte2/SW[17]}
add wave -noupdate -label {Write Enable} {/parte2/SW[16]}
add wave -noupdate -label Address -radix unsigned /parte2/Address
add wave -noupdate -label {Data In} -radix hexadecimal /parte2/DataIn
add wave -noupdate -divider Output
add wave -noupdate -label {Read Data} -radix hexadecimal /parte2/data_out
add wave -noupdate -label Memory -radix hexadecimal -expand /parte2/mem/altsyncram_component/mem_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {497 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1802 ps}
