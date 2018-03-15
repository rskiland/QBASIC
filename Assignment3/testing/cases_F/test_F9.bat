@echo off
echo Running Test F9
type ".\input\in_F9.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F9.txt" > "./output/output/out_F9.log"
