:: Used by the run_day#.bat batch file as a helper function to merge the transaction summaries from each session into one file.

@echo off

:: Merging Files
:: Iterate through each transaction summary contained in transaction
(
  for %%x in (.\Transactions\*.txt) do (
    type "%%x"
    findstr /v $ "%%x" >nul && echo(
  )
)>TS_merged_temp.txt

:: Remove all EOS
type TS_merged_temp.txt | findstr /v EOS > TS_day2.txt

:: Add bottom EOS
ECHO EOS 0000000 000 0000000 ***>>".\TS_day2.txt"

:: Delete TS_merged_temp.txt
del .\TS_merged_temp.txt

:: Move merged transaction summary file to the Back Office input folder
move TS_day2.txt ..\BackOffice\Input