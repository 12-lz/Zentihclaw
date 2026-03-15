@echo off
chcp 65001 >nul
echo ============================================
echo  Zenithclaw - 一键部署到 Vercel
echo ============================================
echo.

REM 检查是否安装了 Vercel CLI
where vercel >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 未检测到 Vercel CLI
    echo.
    echo 请先安装 Vercel CLI：
    echo npm install -g vercel
    echo.
    pause
    exit /b 1
)

echo ✅ Vercel CLI 已安装
echo.
echo 📦 准备部署到生产环境...
echo.

REM 执行部署
vercel --prod

echo.
echo ============================================
echo ✅ 部署完成！
echo ============================================
echo.
echo 你的网站已经上线！
echo.
pause
