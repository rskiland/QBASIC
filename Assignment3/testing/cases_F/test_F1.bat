@echo off
echo Running Test F1
type ".\input\in_F1.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F1.txt" > "./output/output/out_F1.log"
