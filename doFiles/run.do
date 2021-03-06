# Create library
vlib work


# Compile and load
vcom ../vhdl/packages/*.vhd  
vcom ../vhdl/components/*.vhd 
vcom ../vhdl/modules/*.vhd 
vcom ../vhdl/system.vhd
vsim work.system


# Open View windows
view structure
view signals
view wave


# Changing wave view to hexdec
add wave -radix unsigned /system/pc/*
add wave -radix unsigned /system/mar/*
add wave -radix unsigned /system/mdr_component/*
add wave -radix unsigned /system/r0/*
add wave -radix unsigned /system/r1/*
add wave -radix unsigned /system/r2/*
add wave -radix unsigned /system/r3/*
add wave -radix unsigned /system/*


# Initialize ram memory
mem load -i ../memory/Test3-BONUS.mem /system/ram_component/ram_memory


# Run
force -freeze /system/i_clk 1 0, 0 {50 ps} -r 100
force -freeze /system/i_reset 1 0
run 50
force -freeze /system/i_reset 0 0
run 30000
