@echo off
echo Running Test C12
type ".\input\in_C12.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_C12.txt" > "./output/output/out_C12.log"
