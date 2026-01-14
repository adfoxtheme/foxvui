@echo off
chcp 65001 >nul
echo ========================================
echo   FOXVUI - Create Release và Build DMG
echo ========================================
echo.

echo Phiên bản hiện tại trong tauri.conf.json: 2.0.0
echo.
echo 📝 Nhập phiên bản mới (VD: 2.0.1, 2.1.0):
set /p VERSION="Phiên bản v"

if "%VERSION%"=="" (
    echo ❌ Bạn phải nhập phiên bản!
    pause
    exit /b 1
)

echo.
echo 🏷️  Sẽ tạo tag: v%VERSION%
echo.
echo ⚠️  Việc này sẽ:
echo    1. Tạo tag mới
echo    2. Push tag lên GitHub
echo    3. Kích hoạt GitHub Actions build DMG/EXE/DEB
echo.
set /p CONFIRM="Bạn có chắc chắn? (y/n): "

if /i not "%CONFIRM%"=="y" (
    echo ❌ Đã hủy
    pause
    exit /b 0
)

echo.
echo 📦 Đang tạo tag v%VERSION%...
git tag v%VERSION%
if errorlevel 1 (
    echo ❌ Lỗi khi tạo tag
    echo Có thể tag này đã tồn tại. Xóa tag cũ:
    echo git tag -d v%VERSION%
    pause
    exit /b 1
)
echo ✅ Đã tạo tag
echo.

echo 🚀 Đang push tag lên GitHub...
git push origin v%VERSION%
if errorlevel 1 (
    echo ❌ Lỗi khi push tag
    pause
    exit /b 1
)
echo ✅ Đã push tag thành công!
echo.

echo ========================================
echo   🎉 ĐÃ KÍCH HOẠT BUILD!
echo ========================================
echo.
echo GitHub Actions đang build:
echo - 🍎 macOS DMG (Universal)
echo - 🪟 Windows EXE + MSI
echo - 🐧 Linux DEB + AppImage
echo.
echo 📋 Bước tiếp theo:
echo 1. Vào: https://github.com/YOUR_USERNAME/foxvuicom/actions
echo 2. Xem tiến trình build (chờ 15-20 phút)
echo 3. Khi xong, tải file từ "Artifacts"
echo.
echo 💡 Mẹo: Tắt cửa sổ này và quay lại sau 20 phút
echo.
pause
