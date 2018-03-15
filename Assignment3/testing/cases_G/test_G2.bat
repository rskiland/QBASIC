@echo off
echo Running Test G2
type ".\input\in_G2.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_G2.txt" > "./output/output/out_G2.log"
