@echo off

setlocal EnableDelayedExpansion
echo. > error_log.txt

for /r %%i in (expected\*) do (
	fc "%%i" ".\output\%%~nxi"
	if errorlevel 1 (
		echo ERROR: Different Output >> error_log.txt
		fc "%%i" ".\output\%%~nxi" >> error_log.txt
	)
	if errorlevel 2 (
		echo ERROR: Missing Output >> error_log.txt
		fc "%%i" ".\output\%%~nxi" >> error_log.txt
	)
)
pause