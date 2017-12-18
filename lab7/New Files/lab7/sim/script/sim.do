vlib work
vmap altera_mf ../../src/altera_mf
vcom -93 -work work ../../src/rom/blink_rom.vhd
vcom -93 -work work ../../src/top.vhd
vcom -93 -work work ../../src/memory.vhd
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../../src/rising_edge_synchronizer.vhd
vcom -93 -work work ../../src/alu.vhd
vcom -93 -work work ../src/top_tb.vhd
vsim -novopt top_tb
do wave.do
run 7100 ns