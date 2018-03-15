:: Test all create test cases
@echo off
for %%f in (test_*) do (
	call %%f
)
echo Account Create Tests Ran Successfully!
pause