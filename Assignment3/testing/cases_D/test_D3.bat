@echo off
echo Running Test D3
type ".\input\in_D3.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_D3.txt" > "./output/output/out_D3.log"
