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
	./compile.sh 003_lbu
	cp 002_dmem.txt ../dmem.txt
	cp 003_lbu_out/003_lbu_hex.txt ../imem.txt

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
