:: Day 4 Driver
:: Main Driver for running Day 4 processing.
:: Runs the 3 sessions, runs the transaction summary merging batch, and processes back office for day 4

@echo off
echo Starting Day 4

:: Get required inputs from Day 3
xcopy ..\day3\BackOffice\Output\activeaccts.txt .\FrontEnd\Input > nul
xcopy ..\day3\BackOffice\Output\masteraccts.txt .\BackOffice\Input > nul

echo Running Day 4 Session 1 Front End
type ".\FrontEnd\Input\session1.txt" | "../qbasic.py" "./FrontEnd/Input/activeaccts.txt" "./FrontEnd/Transactions/TS_session1.txt" > nul

echo Running Day 4 Session 2 Front End
type ".\FrontEnd\Input\session2.txt" | "../qbasic.py" "./FrontEnd/Input/activeaccts.txt" "./FrontEnd/Transactions/TS_session2.txt" > nul

echo Running Day 4 Session 3 Front End
type ".\FrontEnd\Input\session3.txt" | "../qbasic.py" "./FrontEnd/Input/activeaccts.txt" "./FrontEnd/Transactions/TS_session3.txt" > nul

echo Merging Transaction Summary Files
cd FrontEnd
call merge.bat > nul
cd ..

echo Running Day 4 Back Office
python ../qbasic-bo.py ./BackOffice/Input/masteraccts.txt ./BackOffice/Input/TS_day4.txt ./BackOffice/Output/masteraccts.txt ./BackOffice/Output/activeaccts.txt > nul

echo End of Day 4
pause