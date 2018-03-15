@echo off
echo Running Test B9
type ".\input\in_B9.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B9.txt" > "./output/output/out_B9.log"
