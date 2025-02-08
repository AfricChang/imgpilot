@echo off
setlocal enabledelayedexpansion

echo Cleaning build artifacts...

:: Set output directory to deploy/windows (current directory)
set OUTPUT_DIR=%~dp0

:: Clean build directory
if exist "%OUTPUT_DIR%\build" (
    echo Removing build directory...
    rmdir /s /q "%OUTPUT_DIR%\build"
)

:: Clean dist directory
if exist "%OUTPUT_DIR%\dist" (
    echo Removing dist directory...
    rmdir /s /q "%OUTPUT_DIR%\dist"
)

:: Clean __pycache__ directories if they exist
if exist "%OUTPUT_DIR%\__pycache__" (
    echo Removing __pycache__ directory...
    rmdir /s /q "%OUTPUT_DIR%\__pycache__"
)

echo Cleanup completed successfully!
pause