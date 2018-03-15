@echo off
echo Running Test E3
type ".\input\in_E3.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_E3.txt" > "./output/output/out_E3.log"
