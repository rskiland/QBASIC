@echo off
echo Running Test B5
type ".\input\in_B5.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B5.txt" > "./output/output/out_B5.log"
