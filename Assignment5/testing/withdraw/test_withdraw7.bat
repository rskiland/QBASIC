@echo off
echo Running Test withdraw7
python ../../qbasic-bo.py ./input/in_MA_withdraw7.txt ./input/in_TS_withdraw7.txt ./output/output/in_MA_withdraw7.txt ./output/output/in_VA_withdraw7.txt
ren "constraintsFailed.txt" "out_withdraw7_constraintsFailed.txt"
move .\out_withdraw7_constraintsFailed.txt .\output\output\
