@echo off
setlocal enabledelayedexpansion


set "HTTP_PROXY=http://127.0.0.1:7890"
set "HTTPS_PROXY=http://127.0.0.1:7890"


set ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/
set ELECTRON_BUILDER_BINARIES_MIRROR=https://npmmirror.com/mirrors/electron-builder-binaries/


cd /d "%~dp0"
cd ..\..\
set "PROJECT_ROOT=%CD%"


echo Building Frontend...
call npm install
call npm run build


echo Build completed successfully!
exit /b 0 