#!/bin/bash

set -eu

core () {
	rm -rf obj_dir 
	time verilator --binary core* --language 1800-2012 --trace --timescale 1ns/1ns --top core_tb -DDUMP_FILE='"pc_rf_dmem_dump.txt"'
	./obj_dir/Vcore_tb
}

wave () {
	./surfer dump.vcd
}

# make sure you have a surfer state file here
wave_1 () {
	./surfer dump.vcd --state-file test.surfer
}

if [ "$#" -ne 1 ]; then
	echo "Usage: Provide exactly one argument to the script"
	exit 1
fi

$1
