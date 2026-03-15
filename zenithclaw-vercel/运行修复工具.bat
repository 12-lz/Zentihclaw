@echo off
chcp 65001 >nul
cls
echo.
echo ============================================
echo   Vercel 图片路径修复工具
echo ============================================
echo.
echo 此工具将：
echo 1. 备份原始 index.html
echo 2. 修复图片路径（添加 / 前缀）
echo 3. 保存修改后的文件
echo.
echo ============================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0修复图片路径.ps1"

pause
