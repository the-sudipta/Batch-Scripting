@echo off
setlocal enabledelayedexpansion

rem Prompt for the text file name
set /p fileName=Enter the name of the text file containing the URLs: 

rem Check if the file exists
if not exist "%fileName%" (
    echo The file "%fileName%" does not exist.
    pause
    exit /b
)

rem Open each URL in a new browser tab
for /f "usebackq delims=" %%a in ("%fileName%") do (
    start "" "%%a"
)

echo All URLs have been opened.
pause
