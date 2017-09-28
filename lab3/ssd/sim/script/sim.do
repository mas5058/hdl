vlib work
vcom -93 -work work ../../src/ssd.vhd
vcom -93 -work work ../src/seven_seg_tb.vhd
vsim -novopt blink_tb
do wave.do
run 500 ns
