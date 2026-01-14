# Foxvui Tauri Dev Script (PowerShell version with proper VS environment)

Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  Foxvui Tauri Development Mode" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Check if running in Developer PowerShell
$vsDevShell = $env:VSINSTALLDIR
if ($vsDevShell) {
    Write-Host "[OK] Running in Visual Studio Developer Environment" -ForegroundColor Green
} else {
    Write-Host "[!] Not in VS Developer Environment. Loading..." -ForegroundColor Yellow
    
    # Try to find and import VS Developer environment
    $vsPath = "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Launch-VsDevShell.ps1"
    
    if (Test-Path $vsPath) {
        Write-Host "    Loading Visual Studio 2022 environment..." -ForegroundColor Yellow
        & $vsPath -Arch amd64 -HostArch amd64
        Write-Host "[OK] VS Environment loaded" -ForegroundColor Green
    } else {
        Write-Host "[ERROR] Visual Studio 2022 not found!" -ForegroundColor Red
        Write-Host "Please run this script from 'Developer PowerShell for VS 2022'" -ForegroundColor Red
        Write-Host "Or install Visual Studio 2022 with C++ build tools" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

Write-Host ""

# Add Rust to PATH
Write-Host "[1/3] Checking Rust..." -ForegroundColor Cyan
$cargoPath = "$env:USERPROFILE\.cargo\bin"
if (Test-Path "$cargoPath\cargo.exe") {
    $env:PATH = "$cargoPath;$env:PATH"
    $cargoVersion = & cargo --version
    Write-Host "[OK] $cargoVersion" -ForegroundColor Green
} else {
    Write-Host "[ERROR] Rust not found!" -ForegroundColor Red
    Write-Host "Please install Rust from https://rustup.rs/" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""

# Check Node.js
Write-Host "[2/3] Checking Node.js..." -ForegroundColor Cyan
try {
    $nodeVersion = node --version
    $npmVersion = npm --version
    Write-Host "[OK] Node $nodeVersion, npm $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Node.js not found!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""

# Verify linker
Write-Host "[3/3] Verifying C++ linker..." -ForegroundColor Cyan
try {
    $null = & link.exe /? 2>&1
    Write-Host "[OK] MSVC linker available" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] MSVC linker not found!" -ForegroundColor Red
    Write-Host "Please run from 'Developer PowerShell for VS 2022'" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  All checks passed!" -ForegroundColor Green
Write-Host "  Starting Tauri dev server..." -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Change to script directory
Set-Location $PSScriptRoot

# Run Tauri dev
npm run tauri dev

Write-Host ""
Read-Host "Press Enter to exit"
