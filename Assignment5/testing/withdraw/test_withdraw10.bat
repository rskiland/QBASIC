@echo off
echo Running Test withdraw10
python ../../qbasic-bo.py ./input/in_MA_withdraw10.txt ./input/in_TS_withdraw10.txt ./output/output/in_MA_withdraw10.txt ./output/output/in_VA_withdraw10.txt
ren "constraintsFailed.txt" "out_withdraw10_constraintsFailed.txt"
move .\out_withdraw10_constraintsFailed.txt .\output\output\
