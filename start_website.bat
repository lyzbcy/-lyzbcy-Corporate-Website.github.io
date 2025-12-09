@echo off
chcp 65001 >nul
echo ============================================
echo       Starting Agency Website Server
echo ============================================
echo.

:: 切换到脚本所在目录
cd /d "%~dp0"
echo Current directory: %CD%
echo.

:: 检查 Ruby 环境
echo [检查环境] Checking Ruby...
where ruby >nul 2>&1
if errorlevel 1 (
    echo [错误] Ruby 未找到！请确保 Ruby 已安装并添加到 PATH。
    echo.
    pause
    exit /b 1
)
ruby -v
echo.

:: 检查 Bundle
echo [检查环境] Checking Bundle...
where bundle >nul 2>&1
if errorlevel 1 (
    echo [错误] Bundle 未找到！请运行: gem install bundler
    echo.
    pause
    exit /b 1
)
call bundle -v
echo.

:: 检查依赖是否安装
echo [检查环境] Checking dependencies...
if not exist "Gemfile.lock" (
    echo [警告] Gemfile.lock 未找到，正在安装依赖...
    call bundle install
    if errorlevel 1 (
        echo [错误] 依赖安装失败！
        echo.
        pause
        exit /b 1
    )
)
echo Dependencies OK!
echo.

:: 等待后打开浏览器
echo [1/2] Opening browser in 5 seconds...
timeout /t 5 /nobreak >nul
start "" "http://127.0.0.1:4001/corporate-website/"
echo Browser opened!
echo.

:: 启动 Jekyll 服务器
echo [2/2] Launching Jekyll Server...
echo Please wait for "Server running..." message.
echo Press Ctrl+C to stop the server.
echo.
echo ============================================
call bundle exec jekyll serve --port 4001

:: 如果 Jekyll 异常退出，显示错误信息
if errorlevel 1 (
    echo.
    echo ============================================
    echo [错误] Jekyll 服务器启动失败！
    echo ============================================
    echo.
)

pause
