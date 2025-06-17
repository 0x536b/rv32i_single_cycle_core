#!/bin/bash

set -eu

generate_reference_output () {
	cd tests_assembly
	
	cd ..
}

core () {
	rm -rf obj_dir 
	time verilator --binary core* --language 1800-2012 --trace --timescale 1ns/1ns --top core_tb -DDUMP_FILE=$1
	./obj_dir/Vcore_tb
}


if [ "$#" -lt 1 ]; then
	echo "Usage: Provide atleast one argument to the script"
	exit 1
fi

$1