transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/test_memory.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/SLC3_2.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/Mem2IO.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/ISDU.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/datapath.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/fetch.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/mux_2to1.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/Reg_16.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/mux_4to1.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/mux_4to1_concatenation.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/reg_file.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/decoder_3to8.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/mux_8to1.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/sext.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/ALU.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/Reg_1.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/slc3.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/memory_contents.sv}
vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/slc3_testtop.sv}

vlog -sv -work work +incdir+C:/Users/vverm2/ECE_Classes/ECE-385/Lab\ 5.2 {C:/Users/vverm2/ECE_Classes/ECE-385/Lab 5.2/5_1_testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 5000 ns
