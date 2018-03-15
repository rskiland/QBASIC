@echo off
echo Running Test F7
type ".\input\in_F7.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F7.txt" > "./output/output/out_F7.log"
