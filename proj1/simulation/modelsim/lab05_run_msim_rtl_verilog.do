transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/gohar/OneDrive/Documents/ENGN\ 1640-DESKTOP-LGI5C03/sultan_and_michael_lab5/proj1 {C:/Users/gohar/OneDrive/Documents/ENGN 1640-DESKTOP-LGI5C03/sultan_and_michael_lab5/proj1/reg_file.v}
vlog -vlog01compat -work work +incdir+C:/Users/gohar/OneDrive/Documents/ENGN\ 1640-DESKTOP-LGI5C03/sultan_and_michael_lab5/proj1 {C:/Users/gohar/OneDrive/Documents/ENGN 1640-DESKTOP-LGI5C03/sultan_and_michael_lab5/proj1/lab05.v}
