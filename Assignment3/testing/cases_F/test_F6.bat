@echo off
echo Running Test F6
type ".\input\in_F6.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F6.txt" > "./output/output/out_F6.log"
