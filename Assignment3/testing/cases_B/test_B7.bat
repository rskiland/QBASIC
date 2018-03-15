@echo off
echo Running Test B7
type ".\input\in_B7.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B7.txt" > "./output/output/out_B7.log"
