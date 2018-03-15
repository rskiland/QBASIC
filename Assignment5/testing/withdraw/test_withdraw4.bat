@echo off
echo Running Test withdraw4
python ../../qbasic-bo.py ./input/in_MA_withdraw4.txt ./input/in_TS_withdraw4.txt ./output/output/in_MA_withdraw4.txt ./output/output/in_VA_withdraw4.txt
ren "constraintsFailed.txt" "out_withdraw4_constraintsFailed.txt"
move .\out_withdraw4_constraintsFailed.txt .\output\output\
