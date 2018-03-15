@echo off
echo Running Test create7
python ../../qbasic-bo.py ./input/in_MA_create7.txt ./input/in_TS_create7.txt ./output/output/out_MA_create7.txt ./output/output/out_VA_create7.txt
ren "constraintsFailed.txt" "out_create7_constraintsFailed.txt"
move .\out_create7_constraintsFailed.txt .\output\output\
