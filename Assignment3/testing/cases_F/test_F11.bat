@echo off
echo Running Test F11
type ".\input\in_F11.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F11.txt" > "./output/output/out_F11.log"
