onerror {resume}
radix define States {
    "7'b1000000" "0" -color "yellow",
    "7'b1111001" "1" -color "yellow",
    "7'b0100100" "2" -color "yellow",
    "7'b0110000" "3" -color "yellow",
    "7'b0011001" "4" -color "yellow",
    "7'b0010010" "5" -color "yellow",
    "7'b0000010" "6" -color "yellow",
    "7'b1111000" "7" -color "yellow",
    "7'b0000000" "8" -color "yellow",
    "7'b0011000" "9" -color "yellow",
    "7'b0001000" "a" -color "yellow",
    "7'b0000011" "b" -color "yellow",
    "7'b1000110" "c" -color "yellow",
    "7'b0100001" "d" -color "yellow",
    "7'b0000110" "e" -color "yellow",
    "7'b0001110" "f" -color "yellow",
    "7'b1111111" "null" -color "yellow",
    "5'b00001" "read_w" -color "yellow",
    "5'b00010" "read_r" -color "yellow",
    "5'b00100" "write_r" -color "yellow",
    "5'b01000" "write_w_no_op" -color "yellow",
    "5'b10000" "write_w" -color "yellow",
    "yellow" "-default",
    "default" "-default",
    "default" "-default",
    "default" "-default",
    "default" "-default",
    "default" "-default",
    "default" "",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/uut/clk
add wave -noupdate /top_tb/uut/reset_n
add wave -noupdate /top_tb/uut/execute
add wave -noupdate -radix unsigned -radixshowbase 0 /top_tb/uut/address_sig
add wave -noupdate -radix unsigned -radixshowbase 0 /top_tb/uut/q_sig
add wave -noupdate -radix States /top_tb/uut/seven_seg_hun
add wave -noupdate -radix States /top_tb/uut/seven_seg_ten
add wave -noupdate -radix States /top_tb/uut/seven_seg_one
add wave -noupdate -radix States /top_tb/uut/stateReg
add wave -noupdate -radix States /top_tb/uut/stateNext
add wave -noupdate /top_tb/uut/synced_execute
add wave -noupdate -radix binary -radixshowbase 0 /top_tb/uut/save
add wave -noupdate -radix unsigned -radixshowbase 0 /top_tb/uut/result_sig
add wave -noupdate /top_tb/uut/to_mem
add wave -noupdate /top_tb/uut/num
add wave -noupdate /top_tb/uut/ms
add wave -noupdate /top_tb/uut/mr
add wave -noupdate /top_tb/uut/opCode
add wave -noupdate -radix unsigned -radixshowbase 0 /top_tb/uut/ones
add wave -noupdate -radix unsigned -radixshowbase 0 /top_tb/uut/tens
add wave -noupdate /top_tb/uut/output_logic_we
add wave -noupdate -radix unsigned -radixshowbase 0 /top_tb/uut/output_logic_addr
add wave -noupdate /top_tb/uut/comp_memory/clk
add wave -noupdate -expand -group mem /top_tb/uut/comp_memory/we
add wave -noupdate -expand -group mem /top_tb/uut/comp_memory/addr
add wave -noupdate -expand -group mem /top_tb/uut/comp_memory/din
add wave -noupdate -expand -group mem /top_tb/uut/comp_memory/dout
add wave -noupdate -expand -group mem /top_tb/uut/comp_memory/RAM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {296 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 210
configure wave -valuecolwidth 73
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
WaveRestoreZoom {0 ns} {7455 ns}
