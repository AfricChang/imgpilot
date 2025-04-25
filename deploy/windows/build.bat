@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set BUILD_CPU=0
set BUILD_GPU=0

:: Get the project root directory (two levels up from deploy/windows)
pushd %~dp0..\..\
set PROJECT_ROOT=%CD%
echo PROJECT_ROOT: %PROJECT_ROOT%
popd


:: Set output directory to deploy/windows
set OUTPUT_DIR=%~dp0

:: Check if running from correct directory
if not exist "%PROJECT_ROOT%\photon" (
    echo Error: photon directory not found in %PROJECT_ROOT%
    echo Please ensure you're running the script from the correct location
    pause
    exit /b 1
)

:: Change to project root directory
cd /d "%PROJECT_ROOT%"


:: Parse command line arguments
:parse_args
if "%1"=="" goto done_args
if /i "%1"=="-CPU" set BUILD_CPU=1
if /i "%1"=="-GPU" set BUILD_GPU=1
shift
goto parse_args
:done_args

:: If no arguments provided, default to GPU
if %BUILD_CPU%==0 if %BUILD_GPU%==0 set BUILD_GPU=1

:: Clean previous builds
echo Cleaning previous builds...
if exist "%OUTPUT_DIR%\dist" rmdir /s /q "%OUTPUT_DIR%\dist"
if exist "%OUTPUT_DIR%\build" rmdir /s /q "%OUTPUT_DIR%\build"

:: Create output directories
if not exist "%OUTPUT_DIR%\dist" mkdir "%OUTPUT_DIR%\dist"
if not exist "%OUTPUT_DIR%\build" mkdir "%OUTPUT_DIR%\build"

:: Install dependencies if requirements.txt exists
if exist "%PROJECT_ROOT%\requirements.txt" (
    echo Installing dependencies...
) else (
    echo Warning: requirements.txt not found, skipping dependency installation
)

:: Verify main.py exists and set MAIN_SCRIPT
set MAIN_SCRIPT=%PROJECT_ROOT%\photon\main.py
echo Debug: MAIN_SCRIPT path is: %MAIN_SCRIPT%

if not exist "%MAIN_SCRIPT%" (
    echo Error: main.py not found at: %MAIN_SCRIPT%
    pause
    exit /b 1
)

echo Current directory: %CD%
echo Project root: %PROJECT_ROOT%
echo Output directory: %OUTPUT_DIR%

:: Build CPU version if requested
if %BUILD_CPU%==1 (
    echo Building CPU version...
    python -m PyInstaller --noconfirm ^
        --clean ^
        --log-level=DEBUG ^
        --add-data "photon;photon" ^
        --add-data "models/LCM_Dreamshaper_v7;models/LCM_Dreamshaper_v7" ^
        --name imgpilot-cpu ^
        --distpath "%OUTPUT_DIR%\dist\cpu" ^
        --workpath "%OUTPUT_DIR%\build\cpu" ^
        ".\photon\main.py"
    
    if %ERRORLEVEL% neq 0 (
        echo Error: CPU build failed with error code %ERRORLEVEL%
        pause
        exit /b 1
    )
)

:: Build GPU version if requested
if %BUILD_GPU%==1 (
    echo Building GPU version...
    echo Debug: Current directory before CD: %CD%
    
    :: Change to project root directory
    cd /d "%PROJECT_ROOT%"
    echo Debug: Current directory after CD: %CD%
    echo Debug: Running PyInstaller command...
    
    :: Execute the command with modified path format
    python -m PyInstaller ^
        --noconfirm ^
        --clean ^
        --log-level=DEBUG ^
        --add-data "photon;photon" ^
        --add-data "models\LCM_Dreamshaper_v7;models\LCM_Dreamshaper_v7" ^
        --collect-all torch ^
        --collect-all diffusers ^
        --collect-all pydantic ^
        --collect-all ledoc_ui ^
        --collect-submodules ledoc_ui ^
        --collect-data ledoc_ui ^
        --collect-submodules pydantic ^
        --collect-data pydantic ^
        --collect-submodules diffusers ^
        --collect-data diffusers ^
        --hidden-import pydantic.deprecated.decorator ^
        --hidden-import pydantic.deprecated ^
        --hidden-import pydantic._internal ^
        --hidden-import ledoc_ui ^
        --name "imgpilot-gpu" ^
        --distpath "%OUTPUT_DIR%dist\gpu" ^
        --workpath "%OUTPUT_DIR%build\gpu" ^
        "photon\main.py"
    
    if %ERRORLEVEL% neq 0 (
        echo Error: GPU build failed with error code %ERRORLEVEL%
        echo Debug: Last command failed. Error level: %ERRORLEVEL%
        pause
        exit /b 1
    )

    :: Copy models folder to dist directory
    echo Copying models folder to dist directory...
    if exist "%PROJECT_ROOT%\models" (
        xcopy /E /I /Y "%PROJECT_ROOT%\models" "%OUTPUT_DIR%dist\gpu\imgpilot-gpu\models"
        if %ERRORLEVEL% neq 0 (
            echo Error: Failed to copy models folder
            pause
            exit /b 1
        )
        echo Models folder copied successfully
    ) else (
        echo Warning: Models folder not found at %PROJECT_ROOT%\models
    )
)

echo Build completed successfully!
echo Output directory: %OUTPUT_DIR%\dist
dir "%OUTPUT_DIR%\dist"
pause