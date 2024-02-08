@echo off

SetupWorkdrive.bat
set repository=%cd%

cd ModTemplate

taskkill /f /im "workbenchApp.exe"

for /f "tokens=2,*" %%a in ('reg query "HKCU\SOFTWARE\Bohemia Interactive\Dayz Tools" /v "path" 2^>nul') do (
    set "dayz_tools=%%b"
)

"%dayz_tools%\Bin\Workbench\workbenchApp.exe" "-mod=P:\DabsFramework;P:\ModTemplate -profiles=P:\Profiles\Workbench -repository=%repository%"