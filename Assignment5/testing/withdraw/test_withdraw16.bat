@echo off
echo Running Test withdraw16
python ../../qbasic-bo.py ./input/in_MA_withdraw16.txt ./input/in_TS_withdraw16.txt ./output/output/in_MA_withdraw16.txt ./output/output/in_VA_withdraw16.txt
ren "constraintsFailed.txt" "out_withdraw16_constraintsFailed.txt"
move .\out_withdraw16_constraintsFailed.txt .\output\output\
