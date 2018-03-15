@echo off
echo Running Test C11
type ".\input\in_C11.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_C11.txt" > "./output/output/out_C11.log"
