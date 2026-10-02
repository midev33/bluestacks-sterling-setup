[CmdletBinding()]
param(
    [switch]$SkipLaunch
)

$ErrorActionPreference = 'Stop'

# This is an official BlueStacks CDN URL referenced by BlueStacks Support.
# If BlueStacks changes the current version, use https://www.bluestacks.com/download.html
# and update this value from the official site before running the script.
$InstallerUrl = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.22.166.1003/e0cbf0a49445273dc3c94ced970fd7d4/FullInstaller/x64/BlueStacksFullInstaller_5.22.166.1003_amd64_native.exe'
$OfficialDownloadPage = 'https://www.bluestacks.com/download.html'
$InstallerName = 'BlueStacksFullInstaller_5.22.166.1003_amd64_native.exe'
$DownloadDirectory = Join-Path $env:TEMP 'BlueStacks-Sterling-Setup'
$InstallerPath = Join-Path $DownloadDirectory $InstallerName

$uri = [Uri]$InstallerUrl
if ($uri.Scheme -ne 'https' -or $uri.Host -notlike '*.bluestacks.com') {
    throw "Refusing a non-official installer URL: $InstallerUrl"
}

New-Item -ItemType Directory -Force -Path $DownloadDirectory | Out-Null
Write-Host "Downloading the official BlueStacks installer to $InstallerPath"
Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath -UseBasicParsing

if (-not (Test-Path -LiteralPath $InstallerPath)) {
    throw 'The installer download did not produce a file.'
}

$file = Get-Item -LiteralPath $InstallerPath
if ($file.Length -lt 1MB) {
    throw "The downloaded file is unexpectedly small ($($file.Length) bytes). Use the official download page: $OfficialDownloadPage"
}

Write-Host "Downloaded $([Math]::Round($file.Length / 1MB, 1)) MB."
Write-Host "The installer is from the official BlueStacks CDN. Review the UAC prompt and installer options before continuing."

if (-not $SkipLaunch) {
    Start-Process -FilePath $InstallerPath
    Write-Host 'Installer started. Complete the setup interactively, then open Google Play Store in BlueStacks.'
} else {
    Write-Host "Launch skipped. Start it manually with: `"$InstallerPath`""
}

Write-Host 'STOP before entering Sterling credentials; credentials are never stored in this repository.'
