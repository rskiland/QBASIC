@echo off
echo Running Test E8
type ".\input\in_E8.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_E8.txt" > "./output/output/out_E8.log"
