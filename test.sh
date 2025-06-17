#!/bin/bash

GREEN='\033[0;32m'        # Green
NC='\033[0m'       # Text Reset
set -eu

compile_all () {
	cd tests_assembly
	./compile.sh 001_ebreak
	./compile.sh 002_lb
	./compile.sh 003_lbu
	./compile.sh 004_lh
	./compile.sh 005_lhu
	./compile.sh 006_lw
	./compile.sh 007_lui
	./compile.sh 008_addi
	./compile.sh 009_slli
	./compile.sh 010_slti
	./compile.sh 011_sltiu
	./compile.sh 012_xori
	./compile.sh 013_srli
	./compile.sh 014_srai
	./compile.sh 015_ori
	./compile.sh 016_andi
	./compile.sh 017_auipc
	./compile.sh 018_sb
	./compile.sh 019_sh
	./compile.sh 020_sw
	./compile.sh 021_add
	./compile.sh 022_sub
	./compile.sh 023_sll
	./compile.sh 024_slt
	./compile.sh 025_sltu
	./compile.sh 026_xor
	./compile.sh 027_srl
	./compile.sh 028_sra
	./compile.sh 029_or
	./compile.sh 030_and
	./compile.sh 031_beq
	./compile.sh 032_bne
	./compile.sh 033_blt
	./compile.sh 034_bge
	./compile.sh 035_bltu
	./compile.sh 036_bgeu
	./compile.sh 037_jalr
	./compile.sh 038_jal
	cd ..
}

test_ebreak () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 001_ebreak_out/001_ebreak_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/001_ebreak_out/001_ebreak_dump.txt"'
}

test_lb () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp 002_dmem.txt ../dmem.txt
	cp 002_lb_out/002_lb_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/002_lb_out/002_lb_dump.txt"'
}

test_lbu () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp 003_dmem.txt ../dmem.txt
	cp 003_lbu_out/003_lbu_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/003_lbu_out/003_lbu_dump.txt"'
}

test_lh () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp 004_dmem.txt ../dmem.txt
	cp 004_lh_out/004_lh_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/004_lh_out/004_lh_dump.txt"'
}

test_lhu () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp 005_dmem.txt ../dmem.txt
	cp 005_lhu_out/005_lhu_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/005_lhu_out/005_lhu_dump.txt"'
}

test_lw () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp 006_dmem.txt ../dmem.txt
	cp 006_lw_out/006_lw_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/006_lw_out/006_lw_dump.txt"'
}

test_lui () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 007_lui_out/007_lui_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/007_lui_out/007_lui_dump.txt"'
}

test_addi () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 008_addi_out/008_addi_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/008_addi_out/008_addi_dump.txt"'
}

test_slli () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 009_slli_out/009_slli_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/009_slli_out/009_slli_dump.txt"'
}

test_slti () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 010_slti_out/010_slti_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/010_slti_out/010_slti_dump.txt"'
}

test_sltiu () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 011_sltiu_out/011_sltiu_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/011_sltiu_out/011_sltiu_dump.txt"'
}

test_xori () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 012_xori_out/012_xori_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/012_xori_out/012_xori_dump.txt"'
}

test_srli () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 013_srli_out/013_srli_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/013_srli_out/013_srli_dump.txt"'
}

test_srai () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 014_srai_out/014_srai_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/014_srai_out/014_srai_dump.txt"'
}

test_ori () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 015_ori_out/015_ori_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/015_ori_out/015_ori_dump.txt"'
}

test_andi () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 016_andi_out/016_andi_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/016_andi_out/016_andi_dump.txt"'
}

test_auipc () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 017_auipc_out/017_auipc_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/017_auipc_out/017_auipc_dump.txt"'
}

test_sb () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 018_sb_out/018_sb_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/018_sb_out/018_sb_dump.txt"'
}

test_sh () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 019_sh_out/019_sh_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/019_sh_out/019_sh_dump.txt"'
}

test_sw () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 020_sw_out/020_sw_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/020_sw_out/020_sw_dump.txt"'
}

test_add () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 021_add_out/021_add_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/021_add_out/021_add_dump.txt"'
}

test_sub () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 022_sub_out/022_sub_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/022_sub_out/022_sub_dump.txt"'
}

test_sll () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 023_sll_out/023_sll_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/023_sll_out/023_sll_dump.txt"'
}

test_slt () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 024_slt_out/024_slt_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/024_slt_out/024_slt_dump.txt"'
}

test_sltu () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 025_sltu_out/025_sltu_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/025_sltu_out/025_sltu_dump.txt"'
}

test_xor () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 026_xor_out/026_xor_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/026_xor_out/026_xor_dump.txt"'
}

test_srl () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 027_srl_out/027_srl_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/027_srl_out/027_srl_dump.txt"'
}

test_sra () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 028_sra_out/028_sra_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/028_sra_out/028_sra_dump.txt"'
}

test_or () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 029_or_out/029_or_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/029_or_out/029_or_dump.txt"'
}

test_and () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 030_and_out/030_and_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/030_and_out/030_and_dump.txt"'
}

test_beq () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 031_beq_out/031_beq_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/031_beq_out/031_beq_dump.txt"'
}

test_bne () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 032_bne_out/032_bne_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/032_bne_out/032_bne_dump.txt"'
}

test_blt () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 033_blt_out/033_blt_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/033_blt_out/033_blt_dump.txt"'
}

test_bge () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 034_bge_out/034_bge_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/034_bge_out/034_bge_dump.txt"'
}

test_bltu () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 035_bltu_out/035_bltu_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/035_bltu_out/035_bltu_dump.txt"'
}

test_bgeu () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 036_bgeu_out/036_bgeu_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/036_bgeu_out/036_bgeu_dump.txt"'
}

test_jalr () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 037_jalr_out/037_jalr_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/037_jalr_out/037_jalr_dump.txt"'
}

test_jal () {
	rm -rf dmem.txt imem.txt
	cd tests_assembly
	cp dmem_zeros_64.txt ../dmem.txt
	cp 038_jal_out/038_jal_hex.txt ../imem.txt
	cd ..
	core '"tests_assembly/038_jal_out/038_jal_dump.txt"'
}

test_all () {
	echo -e "${GREEN}Compiling all assembly tests${NC}"
	compile_all
	echo "------------------------------------------"

echo -e "${GREEN}[1/38] Testing : ebreak${NC}"
	test_ebreak
	echo "------------------------------------------"
	echo -e "${GREEN}[2/38] Testing : lb${NC}"
	test_lb
	echo "------------------------------------------"
	echo -e "${GREEN}[3/38] Testing : lbu${NC}"
	test_lbu
	echo "------------------------------------------"
	echo -e "${GREEN}[4/38] Testing : lh${NC}"
	test_lh
	echo "------------------------------------------"
	echo -e "${GREEN}[5/38] Testing : lhu${NC}"
	test_lhu
	echo "------------------------------------------"
	echo -e "${GREEN}[6/38] Testing : lw${NC}"
	test_lw
	echo "------------------------------------------"
	echo -e "${GREEN}[7/38] Testing : lui${NC}"
	test_lui
	echo "------------------------------------------"
	echo -e "${GREEN}[8/38] Testing : addi${NC}"
	test_addi
	echo "------------------------------------------"
	echo -e "${GREEN}[9/38] Testing : slli${NC}"
	test_slli
	echo "------------------------------------------"
	echo -e "${GREEN}[10/38] Testing : slti${NC}"
	test_slti
	echo "------------------------------------------"
	echo -e "${GREEN}[11/38] Testing : sltiu${NC}"
	test_sltiu
	echo "------------------------------------------"
	echo -e "${GREEN}[12/38] Testing : xori${NC}"
	test_xori
	echo "------------------------------------------"
	echo -e "${GREEN}[13/38] Testing : srli${NC}"
	test_srli
	echo "------------------------------------------"
	echo -e "${GREEN}[14/38] Testing : srai${NC}"
	test_srai
	echo "------------------------------------------"
	echo -e "${GREEN}[15/38] Testing : ori${NC}"
	test_ori
	echo "------------------------------------------"
	echo -e "${GREEN}[16/38] Testing : andi${NC}"
	test_andi
	echo "------------------------------------------"
	echo -e "${GREEN}[17/38] Testing : auipc${NC}"
	test_auipc
	echo "------------------------------------------"
	echo -e "${GREEN}[18/38] Testing : sb${NC}"
	test_sb
	echo "------------------------------------------"
	echo -e "${GREEN}[19/38] Testing : sh${NC}"
	test_sh
	echo "------------------------------------------"
	echo -e "${GREEN}[20/38] Testing : sw${NC}"
	test_sw
	echo "------------------------------------------"
	echo -e "${GREEN}[21/38] Testing : add${NC}"
	test_add
	echo "------------------------------------------"
	echo -e "${GREEN}[22/38] Testing : sub${NC}"
	test_sub
	echo "------------------------------------------"
	echo -e "${GREEN}[23/38] Testing : sll${NC}"
	test_sll
	echo "------------------------------------------"
	echo -e "${GREEN}[24/38] Testing : slt${NC}"
	test_slt
	echo "------------------------------------------"
	echo -e "${GREEN}[25/38] Testing : sltu${NC}"
	test_sltu
	echo "------------------------------------------"
	echo -e "${GREEN}[26/38] Testing : xor${NC}"
	test_xor
	echo "------------------------------------------"
	echo -e "${GREEN}[27/38] Testing : srl${NC}"
	test_srl
	echo "------------------------------------------"
	echo -e "${GREEN}[28/38] Testing : sra${NC}"
	test_sra
	echo "------------------------------------------"
	echo -e "${GREEN}[29/38] Testing : or${NC}"
	test_or
	echo "------------------------------------------"
	echo -e "${GREEN}[30/38] Testing : and${NC}"
	test_and
	echo "------------------------------------------"
	echo -e "${GREEN}[31/38] Testing : beq${NC}"
	test_beq
	echo "------------------------------------------"
	echo -e "${GREEN}[32/38] Testing : bne${NC}"
	test_bne
	echo "------------------------------------------"
	echo -e "${GREEN}[33/38] Testing : blt${NC}"
	test_blt
	echo "------------------------------------------"
	echo -e "${GREEN}[34/38] Testing : bge${NC}"
	test_bge
	echo "------------------------------------------"
	echo -e "${GREEN}[35/38] Testing : bltu${NC}"
	test_bltu
	echo "------------------------------------------"
	echo -e "${GREEN}[36/38] Testing : bgeu${NC}"
	test_bgeu
	echo "------------------------------------------"
	echo -e "${GREEN}[37/38] Testing : jalr${NC}"
	test_jalr
	echo "------------------------------------------"
	echo -e "${GREEN}[38/38] Testing : jal${NC}"
	test_jal
	echo "------------------------------------------"
	TOTAL_DUMPS=$(find . -type f -name "*_dump.txt" | wc -l)
	echo -e "Total dump files : ${TOTAL_DUMPS}"
}

# test () {
# 	cd tests_assembly
	
# 	# test ebreak
# 	# ./compile.sh 001_ebreak

# 	# test lb
# 	# ./compile.sh 002_lb
# 	# cp 002_dmem.txt ../dmem.txt
# 	# cp 002_lb_out/002_lb_hex.txt ../imem.txt

# 	# test lbu
# 	# ./compile.sh 003_lbu
# 	# cp 002_dmem.txt ../dmem.txt
# 	# cp 003_lbu_out/003_lbu_hex.txt ../imem.txt

# 	# test lh
# 	# ./compile.sh 004_lh
# 	# cp 004_dmem.txt ../dmem.txt
# 	# cp 004_lh_out/004_lh_hex.txt ../imem.txt

# 	# test lhu
# 	# ./compile.sh 005_lhu
# 	# cp 004_dmem.txt ../dmem.txt
# 	# cp 005_lhu_out/005_lhu_hex.txt ../imem.txt

# 	# test lw
# 	# ./compile.sh 006_lw
# 	# cp 006_dmem.txt ../dmem.txt
# 	# cp 006_lw_out/006_lw_hex.txt ../imem.txt

# 	# lui
# 	# ./compile.sh 007_lui
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 007_lui_out/007_lui_hex.txt ../imem.txt

# 	# addi
# 	# ./compile.sh 008_addi
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 008_addi_out/008_addi_hex.txt ../imem.txt

# 	# slli
# 	# ./compile.sh 009_slli
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 009_slli_out/009_slli_hex.txt ../imem.txt

# 	# slti
# 	# ./compile.sh 010_slti
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 010_slti_out/010_slti_hex.txt ../imem.txt

# 	# sltiu
# 	# ./compile.sh 011_sltiu
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 011_sltiu_out/011_sltiu_hex.txt ../imem.txt

# 	# xori
# 	# ./compile.sh 012_xori
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 012_xori_out/012_xori_hex.txt ../imem.txt

# 	# srli
# 	# ./compile.sh 013_srli
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 013_srli_out/013_srli_hex.txt ../imem.txt

# 	# srai
# 	# ./compile.sh 014_srai
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 014_srai_out/014_srai_hex.txt ../imem.txt

# 	# ori
# 	# ./compile.sh 015_ori
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 015_ori_out/015_ori_hex.txt ../imem.txt

# 	# andi
# 	# ./compile.sh 016_andi
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 016_andi_out/016_andi_hex.txt ../imem.txt

# 	# andi
# 	# ./compile.sh 017_auipc
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 017_auipc_out/017_auipc_hex.txt ../imem.txt

# 	# sb
# 	# ./compile.sh 018_sb
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 018_sb_out/018_sb_hex.txt ../imem.txt

# 	# sh
# 	# ./compile.sh 019_sh
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 019_sh_out/019_sh_hex.txt ../imem.txt

# 	# sw
# 	# ./compile.sh 020_sw
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 020_sw_out/020_sw_hex.txt ../imem.txt

# 	# add
# 	# ./compile.sh 021_add
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 021_add_out/021_add_hex.txt ../imem.txt

# 	# sub
# 	# ./compile.sh 022_sub
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 022_sub_out/022_sub_hex.txt ../imem.txt

# 	# sll
# 	# ./compile.sh 023_sll
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 023_sll_out/023_sll_hex.txt ../imem.txt

# 	# slt
# 	# ./compile.sh 024_slt
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 024_slt_out/024_slt_hex.txt ../imem.txt

# 	# sltu
# 	# ./compile.sh 025_sltu
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 025_sltu_out/025_sltu_hex.txt ../imem.txt

# 	# xor 
# 	# ./compile.sh 026_xor
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 026_xor_out/026_xor_hex.txt ../imem.txt

# 	# srl 
# 	# ./compile.sh 027_srl
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 027_srl_out/027_srl_hex.txt ../imem.txt

# 	# sra
# 	# ./compile.sh 028_sra
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 028_sra_out/028_sra_hex.txt ../imem.txt

# 	# or
# 	# ./compile.sh 029_or
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 029_or_out/029_or_hex.txt ../imem.txt

# 	# and
# 	# ./compile.sh 030_and
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 030_and_out/030_and_hex.txt ../imem.txt

# 	# beq
# 	# ./compile.sh 031_beq
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 031_beq_out/031_beq_hex.txt ../imem.txt

# 	# bne
# 	# ./compile.sh 032_bne
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 032_bne_out/032_bne_hex.txt ../imem.txt

# 	# blt
# 	# ./compile.sh 033_blt
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 033_blt_out/033_blt_hex.txt ../imem.txt

# 	# bge
# 	# ./compile.sh 034_bge
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 034_bge_out/034_bge_hex.txt ../imem.txt

# 	# bltu
# 	# ./compile.sh 035_bltu
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 035_bltu_out/035_bltu_hex.txt ../imem.txt

# 	# bgeu
# 	# ./compile.sh 036_bgeu
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 036_bgeu_out/036_bgeu_hex.txt ../imem.txt

# 	# jalr
# 	# ./compile.sh 037_jalr
# 	# cp dmem_zeros_64.txt ../dmem.txt
# 	# cp 037_jalr_out/037_jalr_hex.txt ../imem.txt

# 	# # jal
# 	./compile.sh 038_jal
# 	cp dmem_zeros_64.txt ../dmem.txt
# 	cp 038_jal_out/038_jal_hex.txt ../imem.txt


# 	cd ..
# 	core
# }

core () {
	rm -rf obj_dir
	time verilator --binary core* --language 1800-2012 --trace --timescale 1ns/1ns --top core_tb -DDUMP_FILE="$1"
	./obj_dir/Vcore_tb
}

# wave () {
# 	./surfer dump.vcd
# }

# # make sure you have a surfer state file here
# wave_1 () {
# 	./surfer dump.vcd --state-file test.surfer
# }

if [ "$#" -ne 1 ]; then
	echo "Usage: Provide exactly one argument to the script"
	exit 1
fi

$1