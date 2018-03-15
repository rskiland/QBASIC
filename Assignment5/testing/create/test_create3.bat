@echo off
echo Running Test create3
python ../../qbasic-bo.py ./input/in_MA_create3.txt ./input/in_TS_create3.txt ./output/output/out_MA_create3.txt ./output/output/out_VA_create3.txt
ren "constraintsFailed.txt" "out_create3_constraintsFailed.txt"
move .\out_create3_constraintsFailed.txt .\output\output\
