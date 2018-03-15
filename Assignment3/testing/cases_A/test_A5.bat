@echo off
echo Running Test A5
type ".\input\in_A5.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_A5.txt" > "./output/output/out_A5.log"
