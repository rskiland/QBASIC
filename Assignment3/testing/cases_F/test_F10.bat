@echo off
echo Running Test F10
type ".\input\in_F10.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_F10.txt" > "./output/output/out_F10.log"
