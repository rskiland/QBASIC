@echo off
echo Running Test create1
python ../../qbasic-bo.py ./input/in_MA_create1.txt ./output/output/out_MA_create1.txt ./output/output/out_VA_create1.txt
ren "constraintsFailed.txt" "out_create1_constraintsFailed.txt"
move .\out_create1_constraintsFailed.txt .\output\output\
