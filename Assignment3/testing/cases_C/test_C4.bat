@echo off
echo Running Test C4
type ".\input\in_C4.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_C4.txt" > "./output/output/out_C4.log"
