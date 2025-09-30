# GISAXS Book - Sync Markdown to Notebooks Script
# 同步 notebooks/*.md 文件到 nb_src/*.ipynb

Write-Host "开始同步 Markdown 文件到 Notebook 格式..." -ForegroundColor Green

# 确保 nb_src 目录存在
if (!(Test-Path "nb_src")) {
    Write-Host "创建 nb_src 目录..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path "nb_src" | Out-Null
}

# 检查 notebooks 目录是否存在
if (!(Test-Path "notebooks")) {
    Write-Host "错误: notebooks 目录不存在!" -ForegroundColor Red
    exit 1
}

# 获取所有 .md 文件并转换
$mdFiles = Get-ChildItem notebooks/ -Filter "*.md"

if ($mdFiles.Count -eq 0) {
    Write-Host "在 notebooks/ 目录中没有找到 .md 文件" -ForegroundColor Yellow
    exit 0
}

Write-Host "找到 $($mdFiles.Count) 个 Markdown 文件:" -ForegroundColor Cyan

foreach ($file in $mdFiles) {
    $outputFile = "nb_src/" + $file.BaseName + ".ipynb"
    Write-Host "  转换: $($file.Name) -> $outputFile" -ForegroundColor White
    
    try {
        # 使用 jupytext 转换文件
        & jupytext $file.FullName --to notebook --output $outputFile
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "    ✓ 成功" -ForegroundColor Green
        } else {
            Write-Host "    ✗ 失败" -ForegroundColor Red
        }
    }
    catch {
        Write-Host "    ✗ 错误: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`n同步完成!" -ForegroundColor Green
Write-Host "Notebook 文件已保存到 nb_src/ 目录" -ForegroundColor Cyan

# 显示结果
$nbFiles = Get-ChildItem nb_src/ -Filter "*.ipynb" -ErrorAction SilentlyContinue
if ($nbFiles) {
    Write-Host "`n生成的 Notebook 文件:" -ForegroundColor Cyan
    foreach ($nb in $nbFiles) {
        Write-Host "  - $($nb.Name)" -ForegroundColor White
    }
}