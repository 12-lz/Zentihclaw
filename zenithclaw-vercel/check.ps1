# Zenithclaw 部署前检查脚本

Write-Host "`n============================================" -ForegroundColor Cyan
Write-Host "  Zenithclaw - 部署前检查" -ForegroundColor Cyan
Write-Host "============================================`n" -ForegroundColor Cyan

$requiredFiles = @(
    "index.html",
    "logo.png",
    "qrcode_inverted.jpg",
    "vercel.json"
)

$allGood = $true

Write-Host "📁 检查必需文件...`n" -ForegroundColor Yellow

foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        $size = (Get-Item $file).Length
        Write-Host "  ✅ $file ($size bytes)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $file - 文件缺失！" -ForegroundColor Red
        $allGood = $false
    }
}

Write-Host "`n🔍 检查 index.html 完整性...`n" -ForegroundColor Yellow

$content = Get-Content "index.html" -Raw

$checks = @{
    "</html>" = "HTML 闭合标签"
    "</script>" = "Script 闭合标签"
    "function scrollToIndex" = "滚动导航函数"
    "function moveBlob" = "背景动画函数"
    "function openModal" = "弹窗开启函数"
    "function closeModal" = "弹窗关闭函数"
}

foreach ($key in $checks.Keys) {
    if ($content -match [regex]::Escape($key)) {
        Write-Host "  ✅ $($checks[$key])" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $($checks[$key]) - 缺失！" -ForegroundColor Red
        $allGood = $false
    }
}

Write-Host "`n============================================" -ForegroundColor Cyan
if ($allGood) {
    Write-Host "  ✅ 所有检查通过！可以部署了！" -ForegroundColor Green
    Write-Host "============================================`n" -ForegroundColor Cyan
    Write-Host "下一步：" -ForegroundColor Yellow
    Write-Host "  1. 双击运行 deploy.bat（自动部署）" -ForegroundColor White
    Write-Host "  2. 或手动运行: vercel --prod`n" -ForegroundColor White
} else {
    Write-Host "  ❌ 发现问题，请先修复！" -ForegroundColor Red
    Write-Host "============================================`n" -ForegroundColor Cyan
}
