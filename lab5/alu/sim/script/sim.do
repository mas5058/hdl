vlib work
vcom -93 -work work ../../src/alu.vhd
vcom -93 -work work ../src/alu_tb.vhd
vsim -novopt alu_tb
do wave.do
run 500 ns
