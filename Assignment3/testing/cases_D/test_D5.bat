@echo off
echo Running Test D5
type ".\input\in_D5.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_D5.txt" > "./output/output/out_D5.log"
