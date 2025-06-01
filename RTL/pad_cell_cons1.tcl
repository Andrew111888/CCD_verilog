# Create corners pads
create_cell {cornerll cornerlr cornerul cornerur} PCORNERW
# Define corner pad locations
set_pad_physical_constraints -pad_name "cornerul" -side 1
set_pad_physical_constraints -pad_name "cornerur" -side 2
set_pad_physical_constraints -pad_name "cornerlr" -side 3
set_pad_physical_constraints -pad_name "cornerll" -side 4

# Create P/G pads dian yuan
create_cell {vss1left vss1right vss1top vss1bottom} PVSS1W
create_cell {vdd1left vdd1right vdd1top vdd1bottom} PVDD1W

create_cell {vss2left vss2right vss2top vss2bottom} PVSS2W
create_cell {vdd2left vdd2right vdd2top vdd2bottom} PVDD2W
# Define signal and PG pad locations
#left
set_pad_physical_constraints -pad_name "data_iopad_0" -side 1 -order 1
set_pad_physical_constraints -pad_name "data_iopad_1" -side 1 -order 2
set_pad_physical_constraints -pad_name "data_iopad_2" -side 1 -order 3
set_pad_physical_constraints -pad_name "data_iopad_3" -side 1 -order 4
set_pad_physical_constraints -pad_name "vdd1left"     -side 1 -order 5
set_pad_physical_constraints -pad_name "vss1left"     -side 1 -order 6
set_pad_physical_constraints -pad_name "vdd2left"     -side 1 -order 7
set_pad_physical_constraints -pad_name "vss2left"     -side 1 -order 8

#upper
set_pad_physical_constraints -pad_name "data_iopad_4" -side 2 -order 1
set_pad_physical_constraints -pad_name "data_iopad_5" -side 2 -order 2
set_pad_physical_constraints -pad_name "data_iopad_6" -side 2 -order 3
set_pad_physical_constraints -pad_name "data_iopad_7" -side 2 -order 4
set_pad_physical_constraints -pad_name "clk_iopad"    -side 2 -order 5
set_pad_physical_constraints -pad_name "rst_iopad"    -side 2 -order 6
set_pad_physical_constraints -pad_name "vdd1top"      -side 2 -order 7
set_pad_physical_constraints -pad_name "vss1top"      -side 2 -order 8
set_pad_physical_constraints -pad_name "vdd2top"      -side 2 -order 9
set_pad_physical_constraints -pad_name "vss2top"      -side 2 -order 10

#right
set_pad_physical_constraints -pad_name "data_iopad_8" -side 3 -order 1
set_pad_physical_constraints -pad_name "data_iopad_9" -side 3 -order 2
set_pad_physical_constraints -pad_name "data_iopad_10" -side 3 -order 3
set_pad_physical_constraints -pad_name "data_iopad_11" -side 3 -order 4
set_pad_physical_constraints -pad_name "sload_iopad"   -side 3 -order 5
set_pad_physical_constraints -pad_name "sclk_iopad"    -side 3 -order 6
set_pad_physical_constraints -pad_name "vdd1right"     -side 3 -order 7
set_pad_physical_constraints -pad_name "vss1right"     -side 3 -order 8
set_pad_physical_constraints -pad_name "vdd2right"     -side 3 -order 9
set_pad_physical_constraints -pad_name "vss2right"     -side 3 -order 10

#bottom
set_pad_physical_constraints -pad_name "cdsclk2_iopad" -side 4 -order 1
set_pad_physical_constraints -pad_name "cdsclk1_iopad" -side 4 -order 2
set_pad_physical_constraints -pad_name "adcclk_iopad"  -side 4 -order 3
set_pad_physical_constraints -pad_name "CLK_iopad"     -side 4 -order 4
set_pad_physical_constraints -pad_name "ROG_iopad"     -side 4 -order 5
set_pad_physical_constraints -pad_name "vdd1bottom"    -side 4 -order 6
set_pad_physical_constraints -pad_name "vss1bottom"    -side 4 -order 7
set_pad_physical_constraints -pad_name "vdd2bottom"    -side 4 -order 8
set_pad_physical_constraints -pad_name "vss2bottom"    -side 4 -order 9


