@echo off
echo Running Test F12
type ".\input\in_F12.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F12.txt" > "./output/output/out_F12.log"
