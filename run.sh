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
	# ./compile.sh 010_slti
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 010_slti_out/010_slti_hex.txt ../imem.txt

	# sltiu
	# ./compile.sh 011_sltiu
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 011_sltiu_out/011_sltiu_hex.txt ../imem.txt

	# xori
	# ./compile.sh 012_xori
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 012_xori_out/012_xori_hex.txt ../imem.txt

	# srli
	# ./compile.sh 013_srli
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 013_srli_out/013_srli_hex.txt ../imem.txt

	# srai
	# ./compile.sh 014_srai
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 014_srai_out/014_srai_hex.txt ../imem.txt

	# ori
	# ./compile.sh 015_ori
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 015_ori_out/015_ori_hex.txt ../imem.txt

	# andi
	# ./compile.sh 016_andi
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 016_andi_out/016_andi_hex.txt ../imem.txt

	# andi
	# ./compile.sh 017_auipc
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 017_auipc_out/017_auipc_hex.txt ../imem.txt

	# sb
	# ./compile.sh 018_sb
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 018_sb_out/018_sb_hex.txt ../imem.txt

	# sh
	# ./compile.sh 019_sh
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 019_sh_out/019_sh_hex.txt ../imem.txt

	# sw
	# ./compile.sh 020_sw
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 020_sw_out/020_sw_hex.txt ../imem.txt

	# add
	# ./compile.sh 021_add
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 021_add_out/021_add_hex.txt ../imem.txt

	# sub
	# ./compile.sh 022_sub
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 022_sub_out/022_sub_hex.txt ../imem.txt

	# sll
	# ./compile.sh 023_sll
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 023_sll_out/023_sll_hex.txt ../imem.txt

	# slt
	# ./compile.sh 024_slt
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 024_slt_out/024_slt_hex.txt ../imem.txt

	# sltu
	# ./compile.sh 025_sltu
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 025_sltu_out/025_sltu_hex.txt ../imem.txt

	# xor 
	# ./compile.sh 026_xor
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 026_xor_out/026_xor_hex.txt ../imem.txt

	# srl 
	# ./compile.sh 027_srl
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 027_srl_out/027_srl_hex.txt ../imem.txt

	# sra
	# ./compile.sh 028_sra
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 028_sra_out/028_sra_hex.txt ../imem.txt

	# or
	# ./compile.sh 029_or
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 029_or_out/029_or_hex.txt ../imem.txt

	# and
	# ./compile.sh 030_and
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 030_and_out/030_and_hex.txt ../imem.txt

	# beq
	# ./compile.sh 031_beq
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 031_beq_out/031_beq_hex.txt ../imem.txt

	# bne
	# ./compile.sh 032_bne
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 032_bne_out/032_bne_hex.txt ../imem.txt

	# blt
	# ./compile.sh 033_blt
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 033_blt_out/033_blt_hex.txt ../imem.txt

	# bge
	# ./compile.sh 034_bge
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 034_bge_out/034_bge_hex.txt ../imem.txt

	# bltu
	# ./compile.sh 035_bltu
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 035_bltu_out/035_bltu_hex.txt ../imem.txt

	# bgeu
	# ./compile.sh 036_bgeu
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 036_bgeu_out/036_bgeu_hex.txt ../imem.txt

	# jalr
	# ./compile.sh 037_jalr
	# cp dmem_zeros_64.txt ../dmem.txt
	# cp 037_jalr_out/037_jalr_hex.txt ../imem.txt

	# # jal
	./compile.sh 038_jal
	cp dmem_zeros_64.txt ../dmem.txt
	cp 038_jal_out/038_jal_hex.txt ../imem.txt


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
