vlib work
vcom -93 -work work ../../src/adderStruct.vhd
vcom -93 -work work ../src/adderStruct_tb.vhd
vsim -novopt blink_tb
do wave.do
run 500 ns
