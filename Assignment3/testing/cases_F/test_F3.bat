@echo off
echo Running Test F3
type ".\input\in_F3.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F3.txt" > "./output/output/out_F3.log"
