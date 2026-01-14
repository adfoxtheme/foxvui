@echo off
REM Build script for Foxvui Tauri app (Production)
REM This script loads Visual Studio environment and builds the .exe file

echo Loading Visual Studio 2022 environment...
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

echo Adding Rust to PATH...
set PATH=%USERPROFILE%\.cargo\bin;%PATH%

echo.
echo ====================================
echo   Foxvui Tauri Production Build
echo ====================================
echo.
echo This will create the .exe file for distribution
echo Building... (this may take several minutes)
echo.

cd /d "%~dp0"
npm run tauri build

echo.
echo ====================================
echo Build complete!
echo.
echo Your .exe file can be found in:
echo src-tauri\target\release\foxvui.exe
echo.
echo MSI installer can be found in:
echo src-tauri\target\release\bundle\msi\
echo ====================================
echo.

pause
