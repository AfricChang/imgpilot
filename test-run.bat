@echo off
chcp 65001 > nul
echo ===== 测试ImgPilot应用 =====
echo.

echo 1. 检查依赖是否安装...
IF NOT EXIST node_modules\node-fetch (
    echo 安装node-fetch依赖...
    call npm install node-fetch@2.6.7 --save
)

IF NOT EXIST node_modules\web-streams-polyfill (
    echo 安装web-streams-polyfill依赖...
    call npm install web-streams-polyfill@3.2.1 --save
)

IF NOT EXIST node_modules\http-proxy (
    echo 安装http-proxy依赖...
    call npm install http-proxy --save
)

echo.
echo 2. 直接运行server.js测试...
echo 这将启动服务器而不使用pkg打包版本
echo 如果此测试成功但pkg版本失败，则说明是pkg打包问题
echo.
echo 按任意键开始测试，或按Ctrl+C取消
pause > nul

node server.js

echo.
echo 测试完成
echo 如果服务器成功启动，说明修复有效
echo 如果仍有错误，请检查控制台输出
echo.
pause