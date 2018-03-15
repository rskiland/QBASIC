@echo off
echo Running Test D1
type ".\input\in_D1.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_D1.txt" > "./output/output/out_D1.log"
