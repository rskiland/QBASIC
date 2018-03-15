@echo off
echo Running Test withdraw18
python ../../qbasic-bo.py ./input/in_MA_withdraw18.txt ./input/in_TS_withdraw18.txt ./output/output/in_MA_withdraw18.txt ./output/output/in_VA_withdraw18.txt
ren "constraintsFailed.txt" "out_withdraw18_constraintsFailed.txt"
move .\out_withdraw18_constraintsFailed.txt .\output\output\
