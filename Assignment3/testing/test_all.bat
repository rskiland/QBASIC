:: Legendary Complex - CISC327 Assignment 3: QBASIC Front End Requirements Testing
:: 		Rob Skiland - 10186568 - r.skiland@queensu.ca
::		Tiffany Chan - 10181522 - tiffany.chan@queensu.ca
::		Noah Peneycad - 10194366 - 15njp@queensu.ca
::
:: The purpose of this batch file is to automatically execute all the tests we have created for 
:: the front-end of QBASIC. The tests are executed in order of tests groups, starting with cases_A
:: and ending with cases_G. Each individual tests takes its respective input file, as well as a 
:: valid accounts file and a transaction summary file. The output of each test is saved to its
:: respective output file found in the output folder.

@echo off

:: Iterate to each case check batch file and execute every batch test

cd cases_A
call run_all_A.bat
cd ../cases_B
call run_all_B.bat
cd ../cases_C
call run_all_C.bat
cd ../cases_D
call run_all_D.bat
cd ../cases_E
call run_all_E.bat
cd ../cases_F
call run_all_F.bat
cd ../cases_G
call run_all_G.bat
