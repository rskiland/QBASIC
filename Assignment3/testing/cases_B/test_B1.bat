@echo off
echo Running Test B1
type ".\input\in_B1.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B1.txt" > "./output/output/out_B1.log"
