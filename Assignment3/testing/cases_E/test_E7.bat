@echo off
echo Running Test E7
type ".\input\in_E7.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_E7.txt" > "./output/output/out_E7.log"
