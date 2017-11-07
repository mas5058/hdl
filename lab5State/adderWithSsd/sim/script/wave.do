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
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/clk
add wave -noupdate /top_tb/reset
add wave -noupdate /top_tb/stateChange
add wave -noupdate /top_tb/input
add wave -noupdate -radix States /top_tb/hex0
add wave -noupdate -radix States /top_tb/hex1
add wave -noupdate -radix States /top_tb/hex2
add wave -noupdate -expand -group dabble /top_tb/uut/dd/binIn
add wave -noupdate -expand -group dabble /top_tb/uut/dd/ones
add wave -noupdate -expand -group dabble /top_tb/uut/dd/tens
add wave -noupdate -expand -group dabble /top_tb/uut/dd/hundreds
add wave -noupdate -group alu /top_tb/uut/addersub/a
add wave -noupdate -group alu /top_tb/uut/addersub/b
add wave -noupdate -group alu /top_tb/uut/addersub/oper
add wave -noupdate -group alu /top_tb/uut/addersub/clk
add wave -noupdate -group alu /top_tb/uut/addersub/reset
add wave -noupdate -group alu /top_tb/uut/addersub/output
add wave -noupdate -group alu /top_tb/uut/addersub/rez
add wave -noupdate -radix binary /top_tb/uut/sta/state_reg
add wave -noupdate -radix binary /top_tb/uut/sta/state_next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
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
WaveRestoreZoom {0 ns} {1825 ns}
