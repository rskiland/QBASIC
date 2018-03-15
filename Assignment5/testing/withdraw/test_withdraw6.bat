@echo off
echo Running Test withdraw6
python ../../qbasic-bo.py ./input/in_MA_withdraw6.txt ./input/in_TS_withdraw6.txt ./output/output/in_MA_withdraw6.txt ./output/output/in_VA_withdraw6.txt
ren "constraintsFailed.txt" "out_withdraw6_constraintsFailed.txt"
move .\out_withdraw6_constraintsFailed.txt .\output\output\