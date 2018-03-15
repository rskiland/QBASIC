@echo off
echo Running Test E5
type ".\input\in_E5.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_E5.txt" > "./output/output/out_E5.log"
