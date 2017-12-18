# Dr. Kaputa
# Quartus II compile script for DE1-SoC board

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
set_global_assignment -name VHDL_FILE ../../src/seven_seg.vhd
set_global_assignment -name VHDL_FILE ../../src/rising_edge_synchronizer.vhd
set_global_assignment -name VHDL_FILE ../../src/memory.vhd
set_global_assignment -name VHDL_FILE ../../src/alu.vhd
set_global_assignment -name VHDL_FILE ../../src/top.vhd

set_location_assignment PIN_AF14 -to clk
set_location_assignment PIN_AA14 -to reset_n
set_location_assignment PIN_Y16  -to execute

set_location_assignment PIN_AE26 -to seven_seg_one[0]
set_location_assignment PIN_AE27 -to seven_seg_one[1]
set_location_assignment PIN_AE28 -to seven_seg_one[2]
set_location_assignment PIN_AG27 -to seven_seg_one[3]
set_location_assignment PIN_AF28 -to seven_seg_one[4]
set_location_assignment PIN_AG28 -to seven_seg_one[5]
set_location_assignment PIN_AH28 -to seven_seg_one[6]

set_location_assignment PIN_AJ29 -to seven_seg_ten[0]
set_location_assignment PIN_AH29 -to seven_seg_ten[1]
set_location_assignment PIN_AH30 -to seven_seg_ten[2]
set_location_assignment PIN_AG30 -to seven_seg_ten[3]
set_location_assignment PIN_AF29 -to seven_seg_ten[4]
set_location_assignment PIN_AF30 -to seven_seg_ten[5]
set_location_assignment PIN_AD27 -to seven_seg_ten[6]

set_location_assignment PIN_AB23 -to seven_seg_hun[0]
set_location_assignment PIN_AE29 -to seven_seg_hun[1]
set_location_assignment PIN_AD29 -to seven_seg_hun[2]
set_location_assignment PIN_AC28 -to seven_seg_hun[3]
set_location_assignment PIN_AD30 -to seven_seg_hun[4]
set_location_assignment PIN_AC29 -to seven_seg_hun[5]
set_location_assignment PIN_AC30 -to seven_seg_hun[6]

# set_location_assignment PIN_AD26 -to bcd_3[0]
# set_location_assignment PIN_AC27 -to bcd_3[1]
# set_location_assignment PIN_AD25 -to bcd_3[2]
# set_location_assignment PIN_AC25 -to bcd_3[3]
# set_location_assignment PIN_AB28 -to bcd_3[4]
# set_location_assignment PIN_AB25 -to bcd_3[5]
# set_location_assignment PIN_AB22 -to bcd_3[6]

# set_location_assignment PIN_AA24 -to bcd_4[0]
# set_location_assignment PIN_Y23  -to bcd_4[1]
# set_location_assignment PIN_Y24  -to bcd_4[2]
# set_location_assignment PIN_W22  -to bcd_4[3]
# set_location_assignment PIN_W24  -to bcd_4[4]
# set_location_assignment PIN_V23  -to bcd_4[5]
# set_location_assignment PIN_W25  -to bcd_4[6]

# set_location_assignment PIN_V25  -to bcd_5[0]
# set_location_assignment PIN_AA28 -to bcd_5[1]
# set_location_assignment PIN_Y27  -to bcd_5[2]
# set_location_assignment PIN_AB27 -to bcd_5[3]
# set_location_assignment PIN_AB26 -to bcd_5[4]
# set_location_assignment PIN_AA26 -to bcd_5[5]
# set_location_assignment PIN_AA25 -to bcd_5[6]

execute_flow -compile
project_close