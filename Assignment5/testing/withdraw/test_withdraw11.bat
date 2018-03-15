@echo off
echo Running Test withdraw11
python ../../qbasic-bo.py ./input/in_MA_withdraw11.txt ./input/in_TS_withdraw11.txt ./output/output/in_MA_withdraw11.txt ./output/output/in_VA_withdraw11.txt
ren "constraintsFailed.txt" "out_withdraw11_constraintsFailed.txt"
move .\out_withdraw11_constraintsFailed.txt .\output\output\