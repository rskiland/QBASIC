@echo off
echo Running Test B10
type ".\input\in_B10.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_B10.txt" > "./output/output/out_B10.log"
