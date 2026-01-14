@echo off
chcp 65001 >nul
echo ========================================
echo   FOXVUI - Quick Update Script
echo ========================================
echo.

REM Script này dùng để cập nhật code lên GitHub sau khi đã setup lần đầu

echo 📝 Nhập mô tả thay đổi (hoặc Enter để dùng mặc định):
set /p COMMIT_MSG="Mô tả: "

if "%COMMIT_MSG%"=="" (
    set COMMIT_MSG=Update code
)

echo.
echo 🔍 Kiểm tra file thay đổi...
git status
echo.

echo 📦 Đang thêm file thay đổi...
git add .
echo ✅ Đã thêm tất cả file thay đổi
echo.

echo 💾 Đang commit...
git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo ⚠️  Không có thay đổi nào để commit
    echo.
    pause
    exit /b 0
)
echo ✅ Đã commit
echo.

echo 🚀 Đang push lên GitHub...
git push
if errorlevel 1 (
    echo ❌ Lỗi khi push
    pause
    exit /b 1
)
echo ✅ Đã push thành công!
echo.

echo ========================================
echo   🎉 CẬP NHẬT THÀNH CÔNG!
echo ========================================
echo.
echo Nếu bạn muốn tạo phiên bản mới và build DMG:
echo 1. Chạy file: github-create-release.bat
echo.
pause
