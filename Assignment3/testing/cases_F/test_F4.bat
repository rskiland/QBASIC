@echo off
echo Running Test F4
type ".\input\in_F4.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F4.txt" > "./output/output/out_F4.log"
