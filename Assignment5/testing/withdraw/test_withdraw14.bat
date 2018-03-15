@echo off
echo Running Test withdraw14
python ../../qbasic-bo.py ./input/in_MA_withdraw14.txt ./input/in_TS_withdraw14.txt ./output/output/in_MA_withdraw14.txt ./output/output/in_VA_withdraw14.txt
ren "constraintsFailed.txt" "out_withdraw14_constraintsFailed.txt"
move .\out_withdraw14_constraintsFailed.txt .\output\output\
