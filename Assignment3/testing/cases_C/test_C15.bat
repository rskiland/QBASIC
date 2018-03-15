@echo off
echo Running Test C15
type ".\input\in_C15.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_C15.txt" > "./output/output/out_C15.log"
