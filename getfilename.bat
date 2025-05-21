@echo off
setlocal enabledelayedexpansion

set "folderPath=C:\GRPC_BOOKSTORE_PROJECT\Dependency\lib"  REM Replace with the path to your folder
set "outputFile=C:\GRPC_BOOKSTORE_PROJECT\output.txt"

del "%outputFile%" 2>nul

for %%F in ("%folderPath%\*") do (
    echo %%~nxF >> "%outputFile%"
)

echo File names have been written to %outputFile%
