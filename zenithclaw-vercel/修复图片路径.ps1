# Vercel 图片路径修复脚本
# 自动将相对路径改为绝对路径

$basePath = "D:\zenithclaw-vercel"
$htmlFile = Join-Path $basePath "index.html"
$backupFile = Join-Path $basePath "index.html.backup"

Write-Host "`n============================================" -ForegroundColor Cyan
Write-Host "  Vercel 图片路径修复工具" -ForegroundColor Cyan
Write-Host "============================================`n" -ForegroundColor Cyan

# 检查文件是否存在
if (-not (Test-Path $htmlFile)) {
    Write-Host "❌ 错误：找不到 index.html" -ForegroundColor Red
    Write-Host "   路径：$htmlFile" -ForegroundColor Red
    pause
    exit 1
}

# 备份原文件
Write-Host "📦 备份原文件..." -ForegroundColor Yellow
Copy-Item $htmlFile $backupFile -Force
Write-Host "   ✓ 备份完成：index.html.backup`n" -ForegroundColor Green

# 读取文件内容
$content = Get-Content $htmlFile -Raw -Encoding UTF8

# 统计替换次数
$replaceCount = 0

# 修复图片路径
Write-Host "🔧 修复图片路径...`n" -ForegroundColor Yellow

# 修复 logo.png
if ($content -match 'src="logo\.png"') {
    $content = $content -replace 'src="logo\.png"', 'src="/logo.png"'
    Write-Host "   ✓ logo.png → /logo.png" -ForegroundColor Green
    $replaceCount++
} else {
    Write-Host "   - logo.png 路径已是绝对路径或不存在" -ForegroundColor Gray
}

# 修复 qrcode_inverted.jpg
if ($content -match 'src="qrcode_inverted\.jpg"') {
    $content = $content -replace 'src="qrcode_inverted\.jpg"', 'src="/qrcode_inverted.jpg"'
    Write-Host "   ✓ qrcode_inverted.jpg → /qrcode_inverted.jpg" -ForegroundColor Green
    $replaceCount++
} else {
    Write-Host "   - qrcode_inverted.jpg 路径已是绝对路径或不存在" -ForegroundColor Gray
}

# 保存修改后的文件
if ($replaceCount -gt 0) {
    Write-Host "`n💾 保存修改..." -ForegroundColor Yellow
    Set-Content $htmlFile -Value $content -Encoding UTF8 -NoNewline
    Write-Host "   ✓ 修改完成！`n" -ForegroundColor Green
} else {
    Write-Host "`nℹ️  未发现需要修复的路径`n" -ForegroundColor Cyan
}

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  修复完成！" -ForegroundColor Green
Write-Host "============================================`n" -ForegroundColor Cyan

if ($replaceCount -gt 0) {
    Write-Host "下一步操作：" -ForegroundColor Yellow
    Write-Host "  1. 提交更改到 Git（如果使用 Git）" -ForegroundColor White
    Write-Host "     git add index.html" -ForegroundColor Gray
    Write-Host "     git commit -m '修复图片路径'" -ForegroundColor Gray
    Write-Host "     git push" -ForegroundColor Gray
    Write-Host "`n  2. 或重新上传到 Vercel" -ForegroundColor White
    Write-Host "`n  3. 在 Vercel Dashboard 中重新部署" -ForegroundColor White
    Write-Host "`n原始文件已备份为：index.html.backup" -ForegroundColor Cyan
}

Write-Host "`n按任意键退出..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
