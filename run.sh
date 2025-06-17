#!/bin/bash

set -eu

test () {
	cd tests_assembly
	
	# test ebreak
	# ./compile.sh 001_ebreak

	# test lb
	# ./compile.sh 002_lb
	# cp 002_dmem.txt ../dmem.txt
	# cp 002_lb_out/002_lb_hex.txt ../imem.txt

	# test lbu
	# ./compile.sh 003_lbu
	# cp 002_dmem.txt ../dmem.txt
	# cp 003_lbu_out/003_lbu_hex.txt ../imem.txt

	# test lh
	# ./compile.sh 004_lh
	# cp 004_dmem.txt ../dmem.txt
	# cp 004_lh_out/004_lh_hex.txt ../imem.txt

	# test lhu
	# ./compile.sh 005_lhu
	# cp 004_dmem.txt ../dmem.txt
	# cp 005_lhu_out/005_lhu_hex.txt ../imem.txt

	# test lw
	# ./compile.sh 006_lw
	# cp 006_dmem.txt ../dmem.txt
	# cp 006_lw_out/006_lw_hex.txt ../imem.txt

	# lui
	# ./compile.sh 007_lui
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 007_lui_out/007_lui_hex.txt ../imem.txt

	# addi
	# ./compile.sh 008_addi
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 008_addi_out/008_addi_hex.txt ../imem.txt

	# slli
	# ./compile.sh 009_slli
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 009_slli_out/009_slli_hex.txt ../imem.txt

	# slti
	./compile.sh 010_slti
	cp dmem_zeros_64.txt ../dmem.txt
	cp 010_slti_out/010_slti_hex.txt ../imem.txt

	cd ..
	core
	# wave
}


core () {
	rm -rf obj_dir 
	time verilator --binary core* --language 1800-2012 --trace --timescale 1ns/1ns --top core_tb
	./obj_dir/Vcore_tb
}

wave () {
	./surfer dump.vcd --state-file test.surfer
}

if [ "$#" -ne 1 ]; then
	echo "Usage: Provide exactly one argument to the script"
	exit 1
fi

$1
