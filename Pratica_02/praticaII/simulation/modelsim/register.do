onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate -label Clock /register/Clock
add wave -noupdate -label {Write Enabled} /register/Wr
add wave -noupdate -label {Data In} -radix unsigned /register/data
add wave -noupdate -divider Output
add wave -noupdate -label {Data Out} -radix unsigned /register/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {640 ps} 0}
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
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/register/Clock 
WaveCollapseAll -1
wave clipboard restore
