@echo off
echo Running Test F8
type ".\input\in_F8.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F8.txt" > "./output/output/out_F8.log"
