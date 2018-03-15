:: Legendary Complex - CISC327 Assignment 3: QBASIC Front End Requirements Testing
::      Rob Skiland - 10186568 - r.skiland@queensu.ca
::      Tiffany Chan - 10181522 - tiffany.chan@queensu.ca
::      Noah Peneycad - 10194366 - 15njp@queensu.ca

@echo off

:: Iterate through each batch validate output files and validate them
:: Used after test_all.bat
:: All error outputs posted in the cases_X/output folder

cd cases_A/output
call validate_all_A.bat
cd ../../cases_B/output
call validate_all_B.bat
cd ../../cases_C/output
call validate_all_C.bat
cd ../../cases_D/output
call validate_all_D.bat
cd ../../cases_E/output
call validate_all_E.bat
cd ../../cases_F/output
call validate_all_F.bat
cd ../../cases_G/output
call validate_all_G.bat
