@echo off
chcp 65001 >nul
cls
echo.
echo ============================================
echo   Zenithclaw 图片问题诊断工具
echo ============================================
echo.

cd /d "D:\zenithclaw-vercel"

echo [检查 1/5] 验证目录位置...
if "%CD%"=="D:\zenithclaw-vercel" (
    echo     ✓ 在正确的目录
) else (
    echo     ✗ 目录错误
    echo     当前目录：%CD%
    pause
    exit /b 1
)

echo.
echo [检查 2/5] 验证 HTML 文件...
if exist "index.html" (
    echo     ✓ index.html 存在
    for %%A in ("index.html") do echo     大小：%%~zA 字节
) else (
    echo     ✗ index.html 不存在
    pause
    exit /b 1
)

echo.
echo [检查 3/5] 验证图片文件...
if exist "logo.png" (
    echo     ✓ logo.png 存在
    for %%A in ("logo.png") do echo     大小：%%~zA 字节
) else (
    echo     ✗ logo.png 不存在
    pause
    exit /b 1
)

if exist "qrcode_inverted.jpg" (
    echo     ✓ qrcode_inverted.jpg 存在
    for %%A in ("qrcode_inverted.jpg") do echo     大小：%%~zA 字节
) else (
    echo     ✗ qrcode_inverted.jpg 不存在
    pause
    exit /b 1
)

echo.
echo [检查 4/5] 验证 HTML 中的图片路径...
findstr /C:"src=\"logo.png\"" index.html >nul
if %errorlevel% equ 0 (
    echo     ✓ logo.png 路径正确
) else (
    echo     ✗ logo.png 路径未找到
)

findstr /C:"src=\"qrcode_inverted.jpg\"" index.html >nul
if %errorlevel% equ 0 (
    echo     ✓ qrcode_inverted.jpg 路径正确
) else (
    echo     ✗ qrcode_inverted.jpg 路径未找到
)

echo.
echo [检查 5/5] 打开测试页面...
if exist "图片测试.html" (
    echo     ✓ 打开图片测试页面...
    start 图片测试.html
) else (
    echo     ✗ 图片测试.html 不存在
)

echo.
echo ============================================
echo   诊断完成
echo ============================================
echo.
echo 可能的原因和解决方案：
echo.
echo 1. 浏览器缓存问题
echo    → 按 Ctrl+F5 强制刷新
echo    → 清除浏览器缓存
echo.
echo 2. 文件路径问题
echo    → 确保通过 HTTP 服务器访问，不是 file://
echo    → 部署到 Vercel 后会自动解决
echo.
echo 3. 图片已损坏
echo    → 从 D:\openclaw\ 重新复制图片
echo.
echo 4. 浏览器安全限制
echo    → 使用 Chrome/Edge/Firefox 等现代浏览器
echo    → 不要直接双击 HTML 文件，部署到 Vercel
echo.
echo ============================================
echo.
echo 💡 最佳实践：
echo    直接部署到 Vercel，避免本地文件路径问题
echo    访问 vercel.com 开始部署
echo.
pause
