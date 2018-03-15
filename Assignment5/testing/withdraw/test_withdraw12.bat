@echo off
echo Running Test withdraw12
python ../../qbasic-bo.py ./input/in_MA_withdraw12.txt ./input/in_TS_withdraw12.txt ./output/output/in_MA_withdraw12.txt ./output/output/in_VA_withdraw12.txt
ren "constraintsFailed.txt" "out_withdraw12_constraintsFailed.txt"
move .\out_withdraw12_constraintsFailed.txt .\output\output\
