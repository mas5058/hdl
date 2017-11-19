onerror {resume}
radix define States {
    "7'b1000000" "0" -color "red",
    "7'b1111001" "1" -color "red",
    "7'b0100100" "2" -color "red",
    "7'b0110000" "3" -color "red",
    "7'b0011001" "4" -color "red",
    "7'b0010010" "5" -color "red",
    "7'b0000010" "6" -color "red",
    "7'b1111000" "7" -color "red",
    "7'b0000000" "8" -color "red",
    "7'b0011000" "9" -color "red",
    -default default
}
radix define en{
    "4'b0000" "read_write" -color "red",
    "4'b0100" "read_write" -color "red",
    "4'b0101" "writeNoper" -color "red",
    "4'b0111" "write_s" -color "red",
    "4'b0001" "read_s" -color "red",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/uut/clk
add wave -noupdate /top_tb/uut/reset
add wave -noupdate /top_tb/uut/execute
add wave -noupdate /top_tb/uut/oper
add wave -noupdate /top_tb/uut/mr
add wave -noupdate /top_tb/uut/ms
add wave -noupdate /top_tb/uut/input
add wave -noupdate -radix States /top_tb/uut/hex0
add wave -noupdate -radix States /top_tb/uut/hex1
add wave -noupdate -radix States /top_tb/uut/hex2
add wave -noupdate -group alu /top_tb/uut/addersub/clk
add wave -noupdate -group alu /top_tb/uut/addersub/reset
add wave -noupdate -group alu /top_tb/uut/addersub/a
add wave -noupdate -group alu /top_tb/uut/addersub/b
add wave -noupdate -group alu /top_tb/uut/addersub/op
add wave -noupdate -group alu /top_tb/uut/addersub/result
add wave -noupdate -group alu /top_tb/uut/addersub/result_temp
add wave -noupdate -expand -group statemachine /top_tb/uut/sta/clk
add wave -noupdate -expand -group statemachine /top_tb/uut/sta/reset
add wave -noupdate -expand -group statemachine /top_tb/uut/sta/execute
add wave -noupdate -expand -group statemachine /top_tb/uut/sta/ms
add wave -noupdate -expand -group statemachine /top_tb/uut/sta/mr
add wave -noupdate -expand -group statemachine /top_tb/uut/sta/we
add wave -noupdate -expand -group statemachine /top_tb/uut/sta/en
add wave -noupdate -expand -group statemachine /top_tb/uut/sta/state_reg
add wave -noupdate -expand -group statemachine /top_tb/uut/sta/state_next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {679867 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 307
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {566563 ps} {1022813 ps}
