@echo off
setlocal
cd /d "%~dp0"
title GrabCash Professional Trading Terminal

echo ========================================
echo GrabCash Professional Trading Terminal
echo ========================================
echo.

if not exist "main.py" (
    echo main.py was not found in %CD%.
    echo Please run this file from the GrabCash folder.
    pause
    exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
    echo GrabCash is not installed yet. Running installer first...
    call "%~dp0GrabCash_Installer.bat"
    if errorlevel 1 (
        echo Installer failed. GrabCash cannot start.
        pause
        exit /b 1
    )
)

echo Starting GrabCash...
call ".venv\Scripts\python.exe" main.py
if errorlevel 1 (
    echo.
    echo GrabCash closed with an error.
    pause
    exit /b 1
)

endlocal
