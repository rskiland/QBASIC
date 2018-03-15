@echo off
echo Running Test withdraw8
python ../../qbasic-bo.py ./input/in_MA_withdraw8.txt ./input/in_TS_withdraw8.txt ./output/output/in_MA_withdraw8.txt ./output/output/in_VA_withdraw8.txt
ren "constraintsFailed.txt" "out_withdraw8_constraintsFailed.txt"
move .\out_withdraw8_constraintsFailed.txt .\output\output\
