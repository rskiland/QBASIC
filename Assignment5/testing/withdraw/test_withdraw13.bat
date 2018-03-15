@echo off
echo Running Test withdraw13
python ../../qbasic-bo.py ./input/in_MA_withdraw13.txt ./input/in_TS_withdraw13.txt ./output/output/in_MA_withdraw13.txt ./output/output/in_VA_withdraw13.txt
ren "constraintsFailed.txt" "out_withdraw13_constraintsFailed.txt"
move .\out_withdraw13_constraintsFailed.txt .\output\output\
