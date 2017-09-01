vlib work
vcom -93 -work work ../../src/adderBehave.vhd
vcom -93 -work work ../src/adderBehave_tb.vhd
vsim -novopt adderBehave_tb
do wave.do
run 500 ns
