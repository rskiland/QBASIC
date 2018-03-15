:: Legendary Complex - CISC327 Assignment 5: QBASIC Back Office Whitebox Requirements Testing
::      Rob Skiland - 10186568 - r.skiland@queensu.ca
::      Tiffany Chan - 10181522 - tiffany.chan@queensu.ca
::      Noah Peneycad - 10194366 - 15njp@queensu.ca

@echo off

:: Iterate through each batch validate output files and validate them
:: Used after test_all.bat
:: All error outputs posted in the (test)/output folder

cd create/output
call validate_all_create.bat
cd ../../withdraw/output
call validate_all_withdraw.bat
