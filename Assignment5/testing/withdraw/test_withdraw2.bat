@echo off
echo Running Test withdraw2
python ../../qbasic-bo.py ./input/in_MA_withdraw2.txt ./input/in_TS_withdraw2.txt ./output/output/in_MA_withdraw2.txt ./output/output/in_VA_withdraw2.txt
ren "constraintsFailed.txt" "out_withdraw2_constraintsFailed.txt"
move .\out_withdraw2_constraintsFailed.txt .\output\output\
