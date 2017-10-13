vlib work
vcom -93 -work work ../../src/synch.vhd
vcom -93 -work work ../src/synch_tb.vhd
vsim -novopt synch_tb
do wave.do
run 500 ns
