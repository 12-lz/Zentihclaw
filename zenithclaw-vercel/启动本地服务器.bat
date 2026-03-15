@echo off
chcp 65001 >nul
cls
echo.
echo ============================================
echo   启动本地 HTTP 服务器
echo ============================================
echo.
echo 这将启动一个本地服务器，让你在浏览器中
echo 正常查看网页和图片（避免 file:// 协议限制）
echo.
echo 服务器地址：http://localhost:8080
echo 按 Ctrl+C 停止服务器
echo.
echo ============================================
echo.

cd /d "D:\zenithclaw-vercel"

echo 正在启动服务器...
echo.

REM 尝试使用 npx http-server
npx http-server -p 8080 -c-1 --cors

echo.
echo ============================================
echo.
echo 如果上面的命令失败，请尝试：
echo.
echo 1. 确保已安装 Node.js
echo 2. 或者直接部署到 Vercel（推荐）
echo.
pause
