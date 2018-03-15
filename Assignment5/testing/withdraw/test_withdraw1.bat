@echo off
echo Running Test withdraw1
python ../../qbasic-bo.py ./input/in_TS_withdraw1.txt ./output/output/in_MA_withdraw1.txt ./output/output/in_VA_withdraw1.txt
ren "constraintsFailed.txt" "out_withdraw1_constraintsFailed.txt"
move .\out_withdraw1_constraintsFailed.txt .\output\output\
