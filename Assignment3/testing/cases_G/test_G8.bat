@echo off
echo Running Test G8
type ".\input\in_G8.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_G8.txt" > "./output/output/out_G8.log"
