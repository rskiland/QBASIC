@echo off
echo Running Test A1
type ".\input\in_A1.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_A1.txt" > "./output/output/out_A1.log"
