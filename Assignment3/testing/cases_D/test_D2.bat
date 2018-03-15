@echo off
echo Running Test D2
type ".\input\in_D2.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_D2.txt" > "./output/output/out_D2.log"
