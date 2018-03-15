@echo off
echo Running Test G7
type ".\input\in_G7.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_G7.txt" > "./output/output/out_G7.log"
