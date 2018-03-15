@echo off
echo Running Test create2
python ../../qbasic-bo.py ./input/in_MA_create2.txt ./input/in_TS_create2.txt ./output/output/out_MA_create2.txt ./output/output/out_VA_create2.txt
ren "constraintsFailed.txt" "out_create2_constraintsFailed.txt"
move .\out_create2_constraintsFailed.txt .\output\output\
