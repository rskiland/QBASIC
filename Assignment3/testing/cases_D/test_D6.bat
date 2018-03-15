@echo off
echo Running Test D6
type ".\input\in_D6.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_D6.txt" > "./output/output/out_D6.log"
