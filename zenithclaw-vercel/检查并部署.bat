@echo off
chcp 65001 >nul
cls
echo.
echo ============================================
echo   Zenithclaw - 部署检查工具
echo ============================================
echo.

REM 检查项目文件
echo [1/3] 检查项目文件...
if exist "index.html" (
    echo     ✓ index.html 存在
) else (
    echo     ✗ index.html 缺失
    pause
    exit /b 1
)

if exist "logo.png" (
    echo     ✓ logo.png 存在
) else (
    echo     ✗ logo.png 缺失
    pause
    exit /b 1
)

if exist "qrcode_inverted.jpg" (
    echo     ✓ qrcode_inverted.jpg 存在
) else (
    echo     ✗ qrcode_inverted.jpg 缺失
    pause
    exit /b 1
)

echo.
echo [2/3] 检查文件完整性...
findstr /C:"</html>" index.html >nul
if %errorlevel% equ 0 (
    echo     ✓ HTML 结构完整
) else (
    echo     ✗ HTML 结构不完整
    pause
    exit /b 1
)

findstr /C:"function scrollToIndex" index.html >nul
if %errorlevel% equ 0 (
    echo     ✓ JavaScript 函数完整
) else (
    echo     ✗ JavaScript 函数缺失
    pause
    exit /b 1
)

echo.
echo [3/3] 检查 Vercel CLI...
where vercel >nul 2>&1
if %errorlevel% equ 0 (
    echo     ✓ Vercel CLI 已安装
    echo.
    echo ============================================
    echo   准备部署...
    echo ============================================
    echo.
    vercel --prod
) else (
    echo     ! Vercel CLI 未安装
    echo.
    echo ============================================
    echo   请选择安装方式：
    echo ============================================
    echo.
    echo   方式 1: 网页部署（推荐，最简单）
    echo   ----------------------------------------
    echo   1. 访问 https://vercel.com
    echo   2. 登录/注册账号
    echo   3. 上传此文件夹
    echo   4. 点击 Deploy
    echo.
    echo   方式 2: 命令行部署
    echo   ----------------------------------------
    echo   1. 打开新的 PowerShell 窗口
    echo   2. 运行: npm install -g vercel
    echo   3. 运行此脚本
    echo.
    echo   详细说明请查看：部署指南.txt
    echo ============================================
)

echo.
pause
