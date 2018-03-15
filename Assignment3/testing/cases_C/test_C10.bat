@echo off
echo Running Test C10
type ".\input\in_C10.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_C10.txt" > "./output/output/out_C10.log"
