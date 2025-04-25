@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

pkg . --targets node18-win-x64 --output imgpilot.exe

if exist "imgpilot.exe" (
    echo Success: imgpilot.exe generated
) else (
    echo Error: Build failed
    exit /b 1
)