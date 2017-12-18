vlib work
vmap altera_mf ../../src/altera_mf
vcom -93 -work work ../../src/rom/blink_rom.vhd
vcom -93 -work work ../../src/generic_counter.vhd
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../../src/blink_block_mem.vhd
vcom -93 -work work ../src/blink_block_mem_tb.vhd
vsim -novopt blink_block_mem_tb
do wave.do
run 5 us