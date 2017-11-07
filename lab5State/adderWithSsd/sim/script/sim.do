vlib work
vcom -93 -work work ../../src/state_machine.vhd
vcom -93 -work work ../../src/ssd.vhd
vcom -93 -work work ../../src/alu.vhd
vcom -93 -work work ../../src/doubledabble.vhd
vcom -93 -work work ../../src/top.vhd
vcom -93 -work work ../src/top_tb.vhd
vsim -novopt top_tb
do wave.do
run 1 us
