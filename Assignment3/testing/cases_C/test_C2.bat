@echo off
echo Running Test C2
type ".\input\in_C2.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_C2.txt" > "./output/output/out_C2.log"
