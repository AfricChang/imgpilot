@echo off
setlocal enabledelayedexpansion

:: 仅保留核心代理设置
set "HTTP_PROXY=http://127.0.0.1:7890"
set "HTTPS_PROXY=http://127.0.0.1:7890"

:: 设置Electron镜像（可选）
set ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/
set ELECTRON_BUILDER_BINARIES_MIRROR=https://npmmirror.com/mirrors/electron-builder-binaries/

:: 使用项目本地配置
cd /d "%~dp0"
cd ..\..\
set "PROJECT_ROOT=%CD%"

:: 核心构建流程
echo Building Frontend...
git config --global core.autocrlf false
git rm --cached -r .
git reset --hard
call npm install
call npm run build
call npm run electron:build -- --win --x64
npm run lint:fix
npx prettier --write . --end-of-line lf

echo Build completed successfully!
exit /b 0 