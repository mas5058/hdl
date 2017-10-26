onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/uut/a
add wave -noupdate /top_tb/uut/b
add wave -noupdate /top_tb/uut/add
add wave -noupdate /top_tb/uut/sub
add wave -noupdate /top_tb/uut/clk
add wave -noupdate /top_tb/uut/reset
add wave -noupdate /top_tb/uut/hex0
add wave -noupdate /top_tb/uut/hex1
add wave -noupdate /top_tb/uut/hex2
add wave -noupdate /top_tb/uut/asig
add wave -noupdate /top_tb/uut/bsig
add wave -noupdate /top_tb/uut/rezsig
add wave -noupdate /top_tb/uut/opersig
add wave -noupdate /top_tb/uut/subsig
add wave -noupdate /top_tb/uut/addsig
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
WaveRestoreZoom {0 ps} {1 ns}
