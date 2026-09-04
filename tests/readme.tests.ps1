$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$readmePath = Join-Path $root 'README.md'
if (-not (Test-Path $readmePath)) { throw 'README.md should exist' }
$readme = Get-Content -Raw $readmePath
@('GitHub Pages', 'Settings', 'Pages', '联系信息') | ForEach-Object {
    if ($readme -notmatch [regex]::Escape($_)) { throw "Missing README guidance: $_" }
}
Write-Output 'readme tests passed'
