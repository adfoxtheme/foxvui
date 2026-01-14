# Foxvui - Trình duyệt trò chơi mini

Foxvui là ứng dụng desktop cho phép học sinh truy cập và chơi các trò chơi mini giáo dục ngay trên máy tính.

![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey.svg)

## 📦 Tải về

Tải phiên bản mới nhất tại [GitHub Releases](https://github.com/adfoxtheme/foxvui/releases)

- **Windows**: `.exe` hoặc `.msi`
- **macOS**: `.dmg`  
- **Linux**: `.deb` hoặc `.AppImage`

## 🛠️ Development

### Yêu cầu

- Node.js 20+
- Rust 1.70+
- Xem chi tiết: [INSTALL_WINDOWS_SDK.md](docs/INSTALL_WINDOWS_SDK.md)

### Các lệnh chính

#### Development
```bash
# Cài dependencies
npm install

# Chạy ở chế độ dev
npm run dev
# hoặc
.\scripts\dev.bat
```

#### Build Production
```bash
# Build cho nền tảng hiện tại
npm run build

# hoặc dùng script
.\scripts\build.bat
```

Xem chi tiết: [BUILD_PRODUCTION.md](docs/BUILD_PRODUCTION.md)

## 📚 Tài liệu

- [Hướng dẫn build](docs/BUILD_PRODUCTION.md)
- [Hướng dẫn GitHub & CI/CD](docs/GITHUB_SETUP_GUIDE.md)
- [Hướng dẫn nhanh](docs/QUICK_START.md)
- [Debug vs Release](docs/DEBUG_VS_RELEASE.md)

## 🤖 GitHub Actions

Project sử dụng GitHub Actions để tự động build cho cả 3 nền tảng:

```bash
# Tạo phiên bản mới và trigger build
git tag v2.0.x
git push origin v2.0.x

# hoặc dùng script
.\scripts\github-create-release.bat
```

Build artifacts sẽ có sẵn tại tab [Actions](https://github.com/adfoxtheme/foxvui/actions) sau ~15-20 phút.

## 📁 Cấu trúc Project

```
foxvui/
├── .github/workflows/  # GitHub Actions CI/CD
├── docs/              # Documentation
├── public/            # Frontend files (HTML, CSS, JS)
├── scripts/           # Build & automation scripts
├── src-tauri/         # Tauri backend (Rust)
│   ├── src/          # Rust source code
│   ├── icons/        # Application icons
│   └── Cargo.toml    # Rust dependencies
├── .gitignore
├── package.json
└── README.md
```

## 🧑‍💻 Scripts Tiện ích

Tất cả scripts nằm trong thư mục `scripts/`:

- `dev.bat` / `dev.ps1` - Chạy development mode
- `build.bat` - Build production
- `github-setup.bat` - Setup GitHub repository lần đầu
- `github-update.bat` - Push code changes lên GitHub
- `github-create-release.bat` - Tạo release và trigger CI/CD build
- `fix-macos-and-rebuild.bat` - Fix và rebuild khi có lỗi

## 🔧 Công nghệ

- **Framework**: [Tauri 2.0](https://tauri.app/)
- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Rust
- **CI/CD**: GitHub Actions

## 📝 License

MIT

## 🤝 Contributing

Contributions are welcome! Xem [GITHUB_SETUP_GUIDE.md](docs/GITHUB_SETUP_GUIDE.md) để bắt đầu.

---

**Made with ❤️ for students**
