@echo off
echo Running Test G1
type ".\input\in_G1.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_G1.txt" > "./output/output/out_G1.log"
