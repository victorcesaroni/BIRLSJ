onerror {exit -code 1}
vlib work
vlog -work work Projeto3.vo
vlog -work work Projeto3.vwf.vt
vsim -novopt -c -t 1ps -L maxii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.Projeto3_V2_vlg_vec_tst -voptargs="+acc"
vcd file -direction Projeto3.msim.vcd
vcd add -internal Projeto3_V2_vlg_vec_tst/*
vcd add -internal Projeto3_V2_vlg_vec_tst/i1/*
run -all
quit -f
