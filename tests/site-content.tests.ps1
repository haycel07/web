$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$indexPath = Join-Path $root 'index.html'

if (-not (Test-Path $indexPath)) {
    throw 'index.html should exist'
}

$html = Get-Content -Raw $indexPath
$requiredText = @(
    '汤启琛',
    '2025 大学生创新创业训练计划省赛入围',
    '全国中学生生物竞赛二等奖',
    '2026 全国微信小程序开发者选手',
    '生命科学',
    '教育',
    '数字工具'
)

foreach ($text in $requiredText) {
    if ($html -notmatch [regex]::Escape($text)) {
        throw "Missing required content: $text"
    }
}

@('header', 'main', 'footer', 'id="trajectory"', 'id="map"', 'id="about"') | ForEach-Object {
    if ($html -notmatch $_) { throw "Missing semantic landmark: $_" }
}

Write-Output 'site-content tests passed'
