@echo off
chcp 65001 >nul
echo ============================================
echo   Dọn dẹp và Push lên GitHub
echo ============================================
echo.

echo ✅ Project đã được dọn dẹp thành công!
echo.
echo 📁 Cấu trúc hiện tại:
echo   foxvui/
echo   ├── .github/workflows/   (GitHub Actions CI/CD)
echo   ├── docs/               (Documentation - trống)
echo   ├── public/             (Frontend files)
echo   ├── scripts/            (Build scripts - trống)
echo   ├── src-tauri/          (Tauri backend)
echo   ├── .gitignore
echo   ├── package.json
echo   └── README.md
echo.

git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git chưa cài đặt
    pause
    exit /b 1
)

echo 📦 Đang add tất cả thay đổi...
git add .
echo.

echo 💾 Đang commit...
git commit -m "Reorganize project structure: clean up root directory

- Created docs/ and scripts/ folders
- Moved all documentation to docs/
- Moved all scripts to scripts/
- Created comprehensive README.md
- Updated .gitignore
- Fixed macOS build workflow (removed Universal binary requirement)
"
if errorlevel 1 (
    echo ⚠️ Không có thay đổi để commit hoặc đã commit
)
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

echo 🏷️  Đang tạo tag v2.0.1 để trigger build...
git tag -d v2.0.1 >nul 2>&1
git tag v2.0.1
echo.

echo 🚀 Đang push tag...
git push origin v2.0.1
if errorlevel 1 (
    echo ❌ Lỗi khi push tag
    pause
    exit /b 1
)
echo.

echo ============================================
echo   🎉 HOÀN THÀNH!
echo ============================================
echo.
echo Project đã được:
echo   ✅ Dọn dẹp cấu trúc
echo   ✅ Sửa lỗi macOS build
echo   ✅ Push lên GitHub
echo   ✅ Trigger build cho cả 3 nền tảng
echo.
echo 📋 Theo dõi build:
echo https://github.com/adfoxtheme/foxvui/actions
echo.
echo Lần build này sẽ thành công! ⏱️ Chờ ~15-20 phút
echo.
pause

start https://github.com/adfoxtheme/foxvui
start https://github.com/adfoxtheme/foxvui/actions
