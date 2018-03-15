@echo off
echo Running Test F5
type ".\input\in_F5.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F5.txt" > "./output/output/out_F5.log"
