@echo off
echo Running Test create4
python ../../qbasic-bo.py ./input/in_MA_create4.txt ./input/in_TS_create4.txt ./output/output/out_MA_create4.txt ./output/output/out_VA_create4.txt
ren "constraintsFailed.txt" "out_create4_constraintsFailed.txt"
move .\out_create4_constraintsFailed.txt .\output\output\
