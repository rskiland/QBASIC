@echo off
echo Running Test B4
type ".\input\in_B4.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B4.txt" > "./output/output/out_B4.log"
