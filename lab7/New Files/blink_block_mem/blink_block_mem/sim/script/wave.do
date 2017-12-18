onerror {resume}
radix define SSD {
    "7'b1000000" "0" -color "orange",
    "7'b1111001" "1" -color "orange",
    "7'b0100100" "2" -color "orange",
    "7'b0110000" "3" -color "orange",
    "7'b0011001" "4" -color "orange",
    "7'b0010010" "5" -color "orange",
    "7'b0000010" "6" -color "orange",
    "7'b1111000" "7" -color "orange",
    "7'b0000000" "8" -color "orange",
    "7'b0011000" "9" -color "orange",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /blink_block_mem_tb/uut/clk
add wave -noupdate /blink_block_mem_tb/uut/reset
add wave -noupdate -radix SSD /blink_block_mem_tb/uut/led_out
add wave -noupdate -radix unsigned /blink_block_mem_tb/uut/address_sig
add wave -noupdate -radix unsigned /blink_block_mem_tb/uut/q_sig
add wave -noupdate /blink_block_mem_tb/uut/enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2353 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 134
configure wave -valuecolwidth 41
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
WaveRestoreZoom {0 ns} {5250 ns}
