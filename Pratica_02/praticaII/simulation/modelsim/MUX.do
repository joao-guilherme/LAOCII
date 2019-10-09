onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate -label Control -radix unsigned /multiplex/control
add wave -noupdate -label A -radix unsigned /multiplex/A
add wave -noupdate -label B -radix unsigned /multiplex/B
add wave -noupdate -label C -radix unsigned /multiplex/C
add wave -noupdate -divider Output
add wave -noupdate -label {Data Out} -radix unsigned /multiplex/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {334 ps} 0}
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
WaveRestoreZoom {0 ps} {2 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern repeater -initialvalue 001 -period 100ps -sequence { 001 100 001 010 010 100  } -repeat forever -range 2 0 -starttime 0ps -endtime 1000ps sim:/multiplex/control 
WaveExpandAll -1
wave create -driver freeze -pattern random -initialvalue 16'b0 -period 100ps -random_type Uniform -seed 5 -range 15 0 -starttime 0ps -endtime 1000ps sim:/multiplex/A 
WaveExpandAll -1
wave create -driver freeze -pattern random -initialvalue 16'b0 -period 100ps -random_type Uniform -seed 6 -range 15 0 -starttime 0ps -endtime 1000ps sim:/multiplex/B 
WaveExpandAll -1
wave create -driver freeze -pattern random -initialvalue 16'b0 -period 100ps -random_type Uniform -seed 7 -range 15 0 -starttime 0ps -endtime 1000ps sim:/multiplex/C 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
