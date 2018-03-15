@echo off
echo Running Test E1
type ".\input\in_E1.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_E1.txt" > "./output/output/out_E1.log"
