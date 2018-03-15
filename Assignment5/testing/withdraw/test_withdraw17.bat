@echo off
echo Running Test withdraw17
python ../../qbasic-bo.py ./input/in_TS_withdraw17.txt ./output/output/in_MA_withdraw17.txt ./output/output/in_VA_withdraw17.txt
ren "constraintsFailed.txt" "out_withdraw17_constraintsFailed.txt"
move .\out_withdraw17_constraintsFailed.txt .\output\output\