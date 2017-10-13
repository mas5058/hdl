vlib work
vcom -93 -work work ../../src/top.vhd
vcom -93 -work work ../../src/alu.vhd
vcom -93 -work work ../../src/ssd.vhd
vcom -93 -work work ../../src/top.vhd
vcom -93 -work work ../../src/synchronizer.vhd
vcom -93 -work work ../src/top_tb.vhd
vsim -novopt seven_seg_tb
do wave.do
run 500 ns
