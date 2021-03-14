transcript on
if ![file isdirectory lab05_iputf_libs] {
	file mkdir lab05_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "D:/engn1640/projects/sultan_and_michael_lab5/proj1/pll_lab5_sim/pll_lab5.vo"

vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/alu_control.v}
vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/imm_gen.v}
vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/ALU.v}
vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/reg_file.v}
vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/lab05.v}
vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/control_unit.v}
vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/lab5_ram.v}
vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/rom_lab5.v}

