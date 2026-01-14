@echo off
chcp 65001 >nul
echo ========================================
echo   FOXVUI - GitHub Setup Script
echo ========================================
echo.

REM ===== PHẦN NÀY BẠN CẦN SỬA =====
REM Thay YOUR_USERNAME bằng tên GitHub của bạn
set GITHUB_USERNAME=YOUR_USERNAME
REM =================================

if "%GITHUB_USERNAME%"=="YOUR_USERNAME" (
    echo ❌ LỖI: Bạn chưa sửa GITHUB_USERNAME!
    echo.
    echo Hướng dẫn:
    echo 1. Mở file này bằng Notepad
    echo 2. Tìm dòng: set GITHUB_USERNAME=YOUR_USERNAME
    echo 3. Thay YOUR_USERNAME bằng tên GitHub của bạn
    echo 4. Lưu file và chạy lại
    echo.
    pause
    exit /b 1
)

echo 🔍 Kiểm tra Git...
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git chưa được cài đặt!
    echo.
    echo Vui lòng tải và cài Git từ: https://git-scm.com/download/win
    echo Sau đó chạy lại script này.
    echo.
    pause
    exit /b 1
)
echo ✅ Git đã được cài đặt
echo.

echo 📦 Bước 1: Khởi tạo Git repository...
git init
if errorlevel 1 (
    echo ❌ Lỗi khi khởi tạo repository
    pause
    exit /b 1
)
echo ✅ Đã khởi tạo repository
echo.

echo 📝 Bước 2: Thêm tất cả file...
git add .
if errorlevel 1 (
    echo ❌ Lỗi khi thêm file
    pause
    exit /b 1
)
echo ✅ Đã thêm tất cả file
echo.

echo 💾 Bước 3: Commit code...
git commit -m "Initial commit: Foxvui Tauri app"
if errorlevel 1 (
    echo ⚠️  Có thể đã commit rồi, tiếp tục...
)
echo ✅ Đã commit code
echo.

echo 🌿 Bước 4: Đổi tên nhánh thành 'main'...
git branch -M main
echo ✅ Đã đổi tên nhánh
echo.

echo 🔗 Bước 5: Kết nối với GitHub...
set REPO_URL=https://github.com/%GITHUB_USERNAME%/foxvuicom.git
echo Repository URL: %REPO_URL%

REM Xóa remote cũ nếu có
git remote remove origin >nul 2>&1

REM Thêm remote mới
git remote add origin %REPO_URL%
if errorlevel 1 (
    echo ❌ Lỗi khi kết nối với GitHub
    echo Kiểm tra lại username và repository name
    pause
    exit /b 1
)
echo ✅ Đã kết nối với GitHub
echo.

echo 🚀 Bước 6: Push code lên GitHub...
echo Đang push... (Có thể mất vài giây)
echo.
git push -u origin main
if errorlevel 1 (
    echo ❌ Lỗi khi push code
    echo.
    echo Kiểm tra:
    echo - Repository đã được tạo trên GitHub chưa?
    echo - Username có đúng không?
    echo - Bạn đã đăng nhập GitHub chưa?
    echo.
    pause
    exit /b 1
)
echo.
echo ✅ Đã push code lên GitHub thành công!
echo.

echo ========================================
echo   🎉 HOÀN THÀNH!
echo ========================================
echo.
echo Code của bạn đã được đẩy lên:
echo https://github.com/%GITHUB_USERNAME%/foxvuicom
echo.
echo 📋 Bước tiếp theo:
echo 1. Vào GitHub repository: https://github.com/%GITHUB_USERNAME%/foxvuicom
echo 2. Click tab "Actions"
echo 3. Click "I understand my workflows, go ahead and enable them"
echo 4. Click "Build and Release" -^> "Run workflow" -^> "Run workflow"
echo 5. Chờ ~15-20 phút để build
echo 6. Tải file DMG từ phần "Artifacts"
echo.
echo 📖 Xem hướng dẫn chi tiết trong file: GITHUB_SETUP_GUIDE.md
echo.
pause
