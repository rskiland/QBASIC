@echo off
echo Running Test A2
type ".\input\in_A2.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_A2.txt" > "./output/output/out_A2.log"
