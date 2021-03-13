transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/ALU.v}
vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/reg_file.v}
vlog -vlog01compat -work work +incdir+D:/engn1640/projects/sultan_and_michael_lab5/proj1 {D:/engn1640/projects/sultan_and_michael_lab5/proj1/lab05.v}

