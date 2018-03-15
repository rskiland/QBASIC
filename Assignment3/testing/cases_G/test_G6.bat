@echo off
echo Running Test G6
type ".\input\in_G6.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_G6.txt" > "./output/output/out_G6.log"
