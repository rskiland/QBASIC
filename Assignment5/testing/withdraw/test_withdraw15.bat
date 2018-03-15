@echo off
echo Running Test withdraw15
python ../../qbasic-bo.py ./input/in_MA_withdraw15.txt ./input/in_TS_withdraw15.txt ./output/output/in_MA_withdraw15.txt ./output/output/in_VA_withdraw15.txt
ren "constraintsFailed.txt" "out_withdraw15_constraintsFailed.txt"
move .\out_withdraw15_constraintsFailed.txt .\output\output\