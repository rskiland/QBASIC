@echo off
echo Running Test G4
type ".\input\in_G4.txt" | "../../qbasic.py" "../../activeaccts.txt" "./output/output/out_G4.txt" > "./output/output/out_G4.log"
