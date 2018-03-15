@echo off
echo Running Test create5
python ../../qbasic-bo.py ./input/in_MA_create5.txt ./input/in_TS_create5.txt ./output/output/out_MA_create5.txt ./output/output/out_VA_create5.txt
ren "constraintsFailed.txt" "out_create5_constraintsFailed.txt"
move .\out_create5_constraintsFailed.txt .\output\output\
