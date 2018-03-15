@echo off
echo Running Test withdraw3
python ../../qbasic-bo.py ./input/in_TS_withdraw3.txt ./output/output/in_MA_withdraw3.txt ./output/output/in_VA_withdraw3.txt
ren "constraintsFailed.txt" "out_withdraw3_constraintsFailed.txt"
move .\out_withdraw3_constraintsFailed.txt .\output\output\
