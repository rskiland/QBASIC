@echo off
echo Running Test E6
type ".\input\in_E6.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_E6.txt" > "./output/output/out_E6.log"
