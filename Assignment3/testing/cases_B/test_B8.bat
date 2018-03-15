@echo off
echo Running Test B8
type ".\input\in_B8.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B8.txt" > "./output/output/out_B8.log"
