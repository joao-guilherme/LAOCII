onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate -label Control /ALU/control
add wave -noupdate -label Rx -radix decimal /ALU/Rx
add wave -noupdate -label Ry -radix decimal /ALU/Ry
add wave -noupdate -divider Output
add wave -noupdate -label {Data Out} -radix decimal /ALU/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1408 ps} 0}
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
WaveRestoreZoom {0 ps} {2760 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern repeater -initialvalue 000 -period 100ps -sequence { 000 001 010 011 100 101  } -repeat forever -range 2 0 -starttime 0ps -endtime 1000ps sim:/ALU/control 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
