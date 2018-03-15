@echo off
echo Running Test E2
type ".\input\in_E2.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_E2.txt" > "./output/output/out_E2.log"
