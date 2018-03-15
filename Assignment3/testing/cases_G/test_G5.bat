@echo off
echo Running Test G5
type ".\input\in_G5.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_G5.txt" > "./output/output/out_G5.log"
