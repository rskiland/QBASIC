:: Test all withdraw test cases
@echo off
for %%f in (test_*) do (
	call %%f
)
echo Withdraw Tests Ran Successfully!
pause