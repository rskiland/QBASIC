@echo off
echo Running Test B3
type ".\input\in_B3.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B3.txt" > "./output/output/out_B3.log"
