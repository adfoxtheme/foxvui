@echo off
chcp 65001 >nul
echo ============================================
echo   Cập nhật và Build lại cho Linux
echo ============================================
echo.

echo 📦 Đang lưu thay đổi (Linux dependencies)...
git add .
git commit -m "Fix: Add Linux dependencies to tauri.conf.json"

echo 🚀 Đang đẩy code lên GitHub...
git push

echo 🏷️  Đang kích hoạt lại Build (Tag v2.0.1)...
:: Xóa tag cũ để trigger lại
git tag -d v2.0.1 2>nul
git push origin :refs/tags/v2.0.1 2>nul

:: Tạo tag mới
git tag v2.0.1
git push origin v2.0.1

echo.
echo ✅ Đã xong! GitHub đang bắt đầu build lại.
echo 📋 Theo dõi tại đây: https://github.com/adfoxtheme/foxvui/actions
echo.
pause
start https://github.com/adfoxtheme/foxvui/actions
