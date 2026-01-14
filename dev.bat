@echo off
REM Debug version - shows all output and keeps window open
REM This helps identify what went wrong

echo ====================================
echo   Foxvui Tauri Dev - DEBUG MODE
echo ====================================
echo.

echo [1/5] Checking Visual Studio...
if not exist "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" (
    echo ERROR: Visual Studio 2022 Community not found!
    echo Please install Visual Studio 2022 with C++ build tools
    pause
    exit /b 1
)
echo OK - Visual Studio found

echo.
echo [2/5] Loading Visual Studio environment...
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to load Visual Studio environment
    pause
    exit /b 1
)
echo OK - Environment loaded

echo.
echo [3/5] Checking Rust installation...
if not exist "%USERPROFILE%\.cargo\bin\cargo.exe" (
    echo ERROR: Rust/Cargo not found!
    echo Please install Rust from https://rustup.rs/
    pause
    exit /b 1
)
echo OK - Rust found

echo.
echo [4/5] Adding Rust to PATH...
set PATH=%USERPROFILE%\.cargo\bin;%PATH%
cargo --version
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Cargo not working
    pause
    exit /b 1
)
echo OK - Cargo is working

echo.
echo [5/5] Checking Node.js...
node --version
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Node.js not found!
    pause
    exit /b 1
)
npm --version
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: npm not found!
    pause
    exit /b 1
)
echo OK - Node.js is working

echo.
echo ====================================
echo All checks passed! Starting dev...
echo ====================================
echo.

cd /d "%~dp0"
npm run tauri dev

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ====================================
    echo ERROR: Build failed!
    echo Check the error messages above
    echo ====================================
)

echo.
pause
