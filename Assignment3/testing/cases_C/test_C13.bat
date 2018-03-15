@echo off
echo Running Test C13
type ".\input\in_C13.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_C13.txt" > "./output/output/out_C13.log"
