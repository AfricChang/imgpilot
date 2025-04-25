@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

:: 设置代理（可选）
set HTTP_PROXY=http://127.0.0.1:7890
set HTTPS_PROXY=http://127.0.0.1:7890

:: 设置项目根目录
pushd %~dp0..\..\
set PROJECT_ROOT=%CD%
popd

:: 安装pkg全局工具
npm install -g pkg

:: 打包前端为独立可执行文件
echo Building frontend executable...
pkg .\photon\main.js --targets node18-win-x64 --output %PROJECT_ROOT%\deploy\windows\dist\frontend\imgpilot-frontend.exe

:: 复制前端资源文件
if not exist "%PROJECT_ROOT%\deploy\windows\dist\frontend\photon" (
    mkdir "%PROJECT_ROOT%\deploy\windows\dist\frontend\photon"
)
xcopy /E /I /Y "%PROJECT_ROOT%\photon" "%PROJECT_ROOT%\deploy\windows\dist\frontend\photon\"

echo Frontend build completed!
exit /b 0