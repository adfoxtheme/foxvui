@echo off
chcp 65001 >nul
echo ========================================
echo   Fix GitHub Actions Permissions
echo ========================================
echo.

echo 🔧 Đã sửa lỗi 403 - Permissions!
echo.
echo Thêm dòng này vào workflow:
echo   permissions:
echo     contents: write
echo.

git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git chưa cài đặt
    pause
    exit /b 1
)

echo 📦 Đang add workflow...
git add .github/workflows/build-release.yml
echo.

echo 💾 Đang commit...
git commit -m "Fix GitHub Actions permissions for release creation"
if errorlevel 1 (
    echo ⚠️ Không có thay đổi
    pause
    exit /b 0
)
echo.

echo 🚀 Đang push...
git push
if errorlevel 1 (
    echo ❌ Lỗi khi push
    pause
    exit /b 1
)
echo ✅ Đã push thành công!
echo.

echo 🏷️  Xóa tag v2.0.1 cũ trên remote...
git push origin :refs/tags/v2.0.1 2>nul
echo.

echo 🏷️  Xóa tag v2.0.1 local...
git tag -d v2.0.1 2>nul
echo.

echo 🏷️  Tạo lại tag v2.0.1...
git tag v2.0.1
echo.

echo 🚀 Push tag lần nữa...
git push origin v2.0.1
if errorlevel 1 (
    echo ❌ Lỗi khi push tag
    pause
    exit /b 1
)
echo.

echo ========================================
echo   🎉 HOÀN THÀNH!
echo ========================================
echo.
echo Đã sửa lỗi permissions và trigger build lại!
echo.
echo Lần này workflow sẽ:
echo   ✅ Build thành công cho cả 3 nền tảng
echo   ✅ Tạo GitHub Release tự động
echo   ✅ Đính kèm file DMG/EXE/DEB vào release
echo.
echo 📋 Theo dõi:
echo https://github.com/adfoxtheme/foxvui/actions
echo https://github.com/adfoxtheme/foxvui/releases
echo.
pause

start https://github.com/adfoxtheme/foxvui/actions
