@echo off
echo Running Test withdraw5
python ../../qbasic-bo.py ./input/in_MA_withdraw5.txt ./input/in_TS_withdraw5.txt ./output/output/in_MA_withdraw5.txt ./output/output/in_VA_withdraw5.txt
ren "constraintsFailed.txt" "out_withdraw5_constraintsFailed.txt"
move .\out_withdraw5_constraintsFailed.txt .\output\output\
