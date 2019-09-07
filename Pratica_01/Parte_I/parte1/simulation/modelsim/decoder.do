onerror {resume}
quietly virtual signal -install /parte1 { /parte1/SW[7:0]} Switches
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate -label Switches -radix hexadecimal /parte1/Switches
add wave -noupdate -divider Output
add wave -noupdate -label {Display Decimal} /parte1/HEX5
add wave -noupdate -label {Display Unitario} /parte1/HEX4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1570 ps}
