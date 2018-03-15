:: Legendary Complex - CISC327 Assignment 5: QBASIC Back Office Whitebox Testing
:: 		Rob Skiland - 10186568 - r.skiland@queensu.ca
::		Tiffany Chan - 10181522 - tiffany.chan@queensu.ca
::		Noah Peneycad - 10194366 - 15njp@queensu.ca
::
:: The purpose of this batch file is to automatically execute all the tests we have created for 
:: the back-office of QBASIC. The tests are executed are create test groups then withdraw.
:: Each individual tests takes its respective input files. The output of each test is saved to its
:: respective output file found in the output folder.

@echo off

:: Iterate to each case check batch file and execute every batch test


cd create
call run_all_create.bat
cd ../withdraw
call run_all_withdraw.bat

