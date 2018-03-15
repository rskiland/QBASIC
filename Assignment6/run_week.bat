@echo off
echo Starting Week

:: Run Day 1
cd day1
call run_day1.bat
cd ..

:: Run Day 2
cd day2
call run_day2.bat
cd ..

:: Run Day 3
cd day3
call run_day3.bat
cd ..

:: Run Day 4
cd day4
call run_day4.bat
cd ..

:: Run Day 5
cd day5
call run_day5.bat
cd ..

:: Place week end active account and master account in root folder
xcopy .\day5\BackOffice\Output\activeaccts.txt .\ > nul
xcopy .\day5\BackOffice\Output\masteraccts.txt .\ > nul

echo End of Week
pause