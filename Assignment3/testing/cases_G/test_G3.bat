@echo off
echo Running Test G3
type ".\input\in_G3.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_G3.txt" > "./output/output/out_G3.log"
