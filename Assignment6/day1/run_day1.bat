:: Day 1 Driver
:: Main Driver for running Day 1 processing.
:: Runs the 3 sessions, runs the transaction summary merging batch, and processes back office for day 1

@echo off
echo Starting Day 1

echo Running Day 1 Session 1 Front End
type ".\FrontEnd\Input\session1.txt" | "../qbasic.py" "./FrontEnd/Input/activeaccts.txt" "./FrontEnd/Transactions/TS_session1.txt" > nul

echo Running Day 1 Session 2 Front End
type ".\FrontEnd\Input\session2.txt" | "../qbasic.py" "./FrontEnd/Input/activeaccts.txt" "./FrontEnd/Transactions/TS_session2.txt" > nul

echo Running Day 1 Session 3 Front End
type ".\FrontEnd\Input\session3.txt" | "../qbasic.py" "./FrontEnd/Input/activeaccts.txt" "./FrontEnd/Transactions/TS_session3.txt" > nul

echo Merging Transaction Summary Files
cd FrontEnd
call merge.bat > nul
cd ..

echo Running Day 1 Back Office
python ../qbasic-bo.py ./BackOffice/Input/masteraccts.txt ./BackOffice/Input/TS_day1.txt ./BackOffice/Output/masteraccts.txt ./BackOffice/Output/activeaccts.txt > nul

echo End of Day 1
pause