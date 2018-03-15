@echo off
echo Running Test E9
type ".\input\in_E9.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_E9.txt" > "./output/output/out_E9.log"
