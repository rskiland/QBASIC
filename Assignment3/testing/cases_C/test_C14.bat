@echo off
echo Running Test C14
type ".\input\in_C14.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_C14.txt" > "./output/output/out_C14.log"
