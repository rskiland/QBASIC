@echo off
echo Running Test withdraw9
python ../../qbasic-bo.py ./input/in_MA_withdraw9.txt ./input/in_TS_withdraw9.txt ./output/output/in_MA_withdraw9.txt ./output/output/in_VA_withdraw9.txt
ren "constraintsFailed.txt" "out_withdraw9_constraintsFailed.txt"
move .\out_withdraw9_constraintsFailed.txt .\output\output\
