@echo off
echo Running Test C1
type ".\input\in_C1.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_C1.txt" > "./output/output/out_C1.log"
