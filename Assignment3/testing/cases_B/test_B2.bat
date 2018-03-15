@echo off
echo Running Test B2
type ".\input\in_B2.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B2.txt" > "./output/output/out_B2.log"
