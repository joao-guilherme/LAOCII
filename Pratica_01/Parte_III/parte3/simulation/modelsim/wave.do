onerror {resume}
quietly virtual signal -install /parte3 { /parte3/SW[15:8]} Address
quietly virtual signal -install /parte3 { /parte3/SW[7:0]} Data
quietly virtual function -install /parte3/L1 -env /parte3/L1 { &{/parte3/L1/mem[0][16], /parte3/L1/mem[0][15], /parte3/L1/mem[0][14], /parte3/L1/mem[0][13], /parte3/L1/mem[0][12], /parte3/L1/mem[0][11], /parte3/L1/mem[0][10], /parte3/L1/mem[0][9], /parte3/L1/mem[0][8], /parte3/L1/mem[0][7], /parte3/L1/mem[0][6], /parte3/L1/mem[0][5], /parte3/L1/mem[0][4], /parte3/L1/mem[0][3], /parte3/L1/mem[0][2], /parte3/L1/mem[0][1] }} Mem0
quietly virtual function -install /parte3/L1 -env /parte3/L1 { &{/parte3/L1/mem[1][16], /parte3/L1/mem[1][15], /parte3/L1/mem[1][14], /parte3/L1/mem[1][13], /parte3/L1/mem[1][12], /parte3/L1/mem[1][11], /parte3/L1/mem[1][10], /parte3/L1/mem[1][9], /parte3/L1/mem[1][8], /parte3/L1/mem[1][7], /parte3/L1/mem[1][6], /parte3/L1/mem[1][5], /parte3/L1/mem[1][4], /parte3/L1/mem[1][3], /parte3/L1/mem[1][2], /parte3/L1/mem[1][1] }} Mem1
quietly virtual function -install /parte3/L1 -env /parte3/L1 { &{/parte3/L1/mem[2][16], /parte3/L1/mem[2][15], /parte3/L1/mem[2][14], /parte3/L1/mem[2][13], /parte3/L1/mem[2][12], /parte3/L1/mem[2][11], /parte3/L1/mem[2][10], /parte3/L1/mem[2][9], /parte3/L1/mem[2][8], /parte3/L1/mem[2][7], /parte3/L1/mem[2][6], /parte3/L1/mem[2][5], /parte3/L1/mem[2][4], /parte3/L1/mem[2][3], /parte3/L1/mem[2][2], /parte3/L1/mem[2][1] }} Mem2
quietly virtual function -install /parte3/L1 -env /parte3/L1 { &{/parte3/L1/mem[3][16], /parte3/L1/mem[3][15], /parte3/L1/mem[3][14], /parte3/L1/mem[3][13], /parte3/L1/mem[3][12], /parte3/L1/mem[3][11], /parte3/L1/mem[3][10], /parte3/L1/mem[3][9], /parte3/L1/mem[3][8], /parte3/L1/mem[3][7], /parte3/L1/mem[3][6], /parte3/L1/mem[3][5], /parte3/L1/mem[3][4], /parte3/L1/mem[3][3], /parte3/L1/mem[3][2], /parte3/L1/mem[3][1] }} Mem3
quietly virtual function -install /parte3/L1 -env /parte3/L1 { &{/parte3/L1/mem[4][16], /parte3/L1/mem[4][15], /parte3/L1/mem[4][14], /parte3/L1/mem[4][13], /parte3/L1/mem[4][12], /parte3/L1/mem[4][11], /parte3/L1/mem[4][10], /parte3/L1/mem[4][9], /parte3/L1/mem[4][8], /parte3/L1/mem[4][7], /parte3/L1/mem[4][6], /parte3/L1/mem[4][5], /parte3/L1/mem[4][4], /parte3/L1/mem[4][3], /parte3/L1/mem[4][2], /parte3/L1/mem[4][1] }} Mem4
quietly virtual function -install /parte3/L1 -env /parte3/L1 { &{/parte3/L1/mem[5][16], /parte3/L1/mem[5][15], /parte3/L1/mem[5][14], /parte3/L1/mem[5][13], /parte3/L1/mem[5][12], /parte3/L1/mem[5][11], /parte3/L1/mem[5][10], /parte3/L1/mem[5][9], /parte3/L1/mem[5][8], /parte3/L1/mem[5][7], /parte3/L1/mem[5][6], /parte3/L1/mem[5][5], /parte3/L1/mem[5][4], /parte3/L1/mem[5][3], /parte3/L1/mem[5][2], /parte3/L1/mem[5][1] }} Mem5
quietly virtual function -install /parte3/L1 -env /parte3/L1 { &{/parte3/L1/mem[6][16], /parte3/L1/mem[6][15], /parte3/L1/mem[6][14], /parte3/L1/mem[6][13], /parte3/L1/mem[6][12], /parte3/L1/mem[6][11], /parte3/L1/mem[6][10], /parte3/L1/mem[6][9], /parte3/L1/mem[6][8], /parte3/L1/mem[6][7], /parte3/L1/mem[6][6], /parte3/L1/mem[6][5], /parte3/L1/mem[6][4], /parte3/L1/mem[6][3], /parte3/L1/mem[6][2], /parte3/L1/mem[6][1] }} Mem6
quietly virtual function -install /parte3/L1 -env /parte3/L1 { &{/parte3/L1/mem[7][16], /parte3/L1/mem[7][15], /parte3/L1/mem[7][14], /parte3/L1/mem[7][13], /parte3/L1/mem[7][12], /parte3/L1/mem[7][11], /parte3/L1/mem[7][10], /parte3/L1/mem[7][9], /parte3/L1/mem[7][8], /parte3/L1/mem[7][7], /parte3/L1/mem[7][6], /parte3/L1/mem[7][5], /parte3/L1/mem[7][4], /parte3/L1/mem[7][3], /parte3/L1/mem[7][2], /parte3/L1/mem[7][1] }} Mem7
quietly virtual function -install /parte3/L1 -env /parte3/L1 { &{/parte3/L1/index[2], /parte3/L1/index[1], /parte3/L1/index[0] }} Index
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate -label Clock {/parte3/SW[17]}
add wave -noupdate -label Write {/parte3/SW[16]}
add wave -noupdate -label Address -radix hexadecimal /parte3/Address
add wave -noupdate -label Data -radix hexadecimal /parte3/Data
add wave -noupdate -divider Output
add wave -noupdate -label Miss {/parte3/LEDG[8]}
add wave -noupdate -label Valid {/parte3/LEDG[7]}
add wave -noupdate -label Dirty {/parte3/LEDG[6]}
add wave -noupdate -label LRU {/parte3/LEDG[5]}
add wave -noupdate -label {Data Out} -radix hexadecimal /parte3/cache_data_out
add wave -noupdate -divider Memory
add wave -noupdate -label Index -radix hexadecimal /parte3/L1/Index
add wave -noupdate -label 0 -radix hexadecimal /parte3/L1/Mem0
add wave -noupdate -label 1 -radix hexadecimal /parte3/L1/Mem1
add wave -noupdate -label 2 -radix hexadecimal /parte3/L1/Mem2
add wave -noupdate -label 3 -radix hexadecimal /parte3/L1/Mem3
add wave -noupdate -label 4 -radix hexadecimal /parte3/L1/Mem4
add wave -noupdate -label 5 -radix hexadecimal /parte3/L1/Mem5
add wave -noupdate -label 6 -radix hexadecimal /parte3/L1/Mem6
add wave -noupdate -label 7 -radix hexadecimal /parte3/L1/Mem7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {403 ps} 0}
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
WaveRestoreZoom {0 ps} {1 ns}
