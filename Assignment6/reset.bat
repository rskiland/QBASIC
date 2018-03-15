:: Reset Batch File
:: Delete all files that the program output after running a full week test

:: Deleting Day 1 Output
del /Q .\day1\BackOffice\Output\*
del .\day1\BackOffice\Input\TS_day1.txt
del /Q .\day1\FrontEnd\Transactions\*

:: Deleting Day 2 Output
del /Q .\day2\BackOffice\Output\*
del .\day2\BackOffice\Input\TS_day2.txt
del /Q .\day2\FrontEnd\Transactions\*
del .\day2\FrontEnd\Input\activeaccts.txt
del .\day2\BackOffice\Input\masteraccts.txt

:: Deleting Day 3 Output
del /Q .\day3\BackOffice\Output\*
del .\day3\BackOffice\Input\TS_day3.txt
del /Q .\day3\FrontEnd\Transactions\*
del .\day3\FrontEnd\Input\activeaccts.txt
del .\day3\BackOffice\Input\masteraccts.txt

:: Deleting Day 4 Output
del /Q .\day4\BackOffice\Output\*
del .\day4\BackOffice\Input\TS_day4.txt
del /Q .\day4\FrontEnd\Transactions\*
del .\day4\FrontEnd\Input\activeaccts.txt
del .\day4\BackOffice\Input\masteraccts.txt

:: Deleting Day 5 Output
del /Q .\day5\BackOffice\Output\*
del .\day5\BackOffice\Input\TS_day5.txt
del /Q .\day5\FrontEnd\Transactions\*
del .\day5\FrontEnd\Input\activeaccts.txt
del .\day5\BackOffice\Input\masteraccts.txt

del .\masteraccts.txt
del .\activeaccts.txt