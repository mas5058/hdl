# Dr. Kaputa
# Quartus II compile script for DE1-SoC  board

# 1] name your project here
set project_name "blink_block_mem"

file delete -force project
file delete -force output_files
file mkdir project
cd project
load_package flow
project_new $project_name
set_global_assignment -name FAMILY Cyclone
set_global_assignment -name DEVICE 5CSEMA5F31C6 
set_global_assignment -name TOP_LEVEL_ENTITY top
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY ../output_files

# 2] include your relative path files here
set_global_assignment -name QIP_FILE ../../src/rom/blink_rom.qip
set_global_assignment -name VHDL_FILE ../../src/generic_counter.vhd
set_global_assignment -name VHDL_FILE ../../src/seven_seg.vhd
set_global_assignment -name VHDL_FILE ../../src/blink_block_mem.vhd
set_global_assignment -name VHDL_FILE ../../src/top.vhd

# 3] set your pin constraints here
set_location_assignment PIN_AB12 -to reset
set_location_assignment PIN_AF14 -to clk
set_location_assignment PIN_AE26 -to led_out[0]
set_location_assignment PIN_AE27 -to led_out[1]
set_location_assignment PIN_AE28 -to led_out[2]
set_location_assignment PIN_AG27 -to led_out[3]
set_location_assignment PIN_AF28 -to led_out[4]
set_location_assignment PIN_AG28 -to led_out[5]
set_location_assignment PIN_AH28 -to led_out[6]

execute_flow -compile
project_close