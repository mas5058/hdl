onerror {resume}
radix define States {
    "11'b0001" "input_a" -color "orange",
    "11'b0010" "input_b" -color "red",
    "11'b0110" "disp_sum" -color "blue",
    "11'b0101" "disp_dif" -color "yellow",
    -default hexadecimal
    -defaultcolor white
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /state_machine_tb/clk
add wave -noupdate /state_machine_tb/reset
add wave -noupdate -radix binary /state_machine_tb/stateChange
add wave -noupdate -radix binary /state_machine_tb/en
add wave -noupdate -radix States /state_machine_tb/uut/state_reg
add wave -noupdate -radix States /state_machine_tb/uut/state_next
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
