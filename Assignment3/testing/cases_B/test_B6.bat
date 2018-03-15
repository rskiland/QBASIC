@echo off
echo Running Test B6
type ".\input\in_B6.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B6.txt" > "./output/output/out_B6.log"
