@echo off
echo Running Test F2
type ".\input\in_F2.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F2.txt" > "./output/output/out_F2.log"
