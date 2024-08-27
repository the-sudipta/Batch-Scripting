@echo off
setlocal

REM Define the source folder path
set "sourceFolder=%localappdata%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"

REM Define the target folder name
set "targetFolder=Windows Lock Screen Wallpaper"

REM Get the full path of the current directory (where the batch file is located)
set "currentDir=%~dp0"

REM Create the "Windows Lock Screen Wallpaper" folder in the current directory
mkdir "%currentDir%%targetFolder%"

REM Copy all files from the source folder to the target folder
xcopy "%sourceFolder%\*" "%currentDir%%targetFolder%\" /i /h /k /y

REM Navigate to the target folder
cd /d "%currentDir%%targetFolder%"

REM Rename all files in the folder to .png
for %%f in (*) do (
    ren "%%f" "%%~nf.png"
)

echo All files have been copied and renamed to .png in "%targetFolder%"
