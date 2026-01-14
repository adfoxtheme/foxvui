# Hướng dẫn Build macOS DMG cho Foxvui

## ⚠️ Lưu ý quan trọng

**Bạn KHÔNG THỂ build file DMG trên Windows!** Tauri yêu cầu build trên chính hệ điều hành đích.

## Giải pháp 1: Sử dụng GitHub Actions (Khuyến nghị)

### Cách dùng:

1. **Push code lên GitHub** (nếu chưa có)
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/username/foxvuicom.git
   git push -u origin main
   ```

2. **Tạo tag và push để trigger build**
   ```bash
   git tag v2.0.0
   git push origin v2.0.0
   ```

3. **Hoặc trigger thủ công:**
   - Vào GitHub repository → Actions tab
   - Chọn "Build and Release" workflow
   - Click "Run workflow"

4. **Tải file DMG:**
   - Sau khi build xong (~15-20 phút)
   - Vào tab Actions → chọn workflow run
   - Tải file từ phần Artifacts: "Foxvui-macOS"

### File sẽ được build:
- ✅ **macOS**: `.dmg` (Universal - hỗ trợ cả Intel và Apple Silicon)
- ✅ **Windows**: `.exe` và `.msi`
- ✅ **Linux**: `.deb` và `.AppImage`

## Giải pháp 2: Build trên máy Mac thật

### Yêu cầu:
1. macOS 11 hoặc cao hơn
2. Xcode Command Line Tools
3. Rust
4. Node.js

### Cài đặt:

```bash
# 1. Cài Xcode Command Line Tools
xcode-select --install

# 2. Cài Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

# 3. Cài Node.js (nếu chưa có)
# Download từ https://nodejs.org/

# 4. Clone/Copy project vào Mac

# 5. Cài dependencies
npm install

# 6. Build
npm run tauri build
```

### Kết quả:
File DMG sẽ nằm ở:
```
src-tauri/target/release/bundle/dmg/Foxvui_2.0.0_aarch64.dmg  # Apple Silicon
src-tauri/target/release/bundle/dmg/Foxvui_2.0.0_x64.dmg     # Intel Mac
```

## Giải pháp 3: macOS trên VMware/VirtualBox (Không khuyến nghị)

⚠️ Phức tạp, cần license macOS, performance kém, có thể vi phạm EULA của Apple.

## Cấu hình bổ sung cho macOS

### Code signing (Tùy chọn - cho publish lên App Store)

Nếu muốn sign app (không bắt buộc cho sử dụng cá nhân), cập nhật `tauri.conf.json`:

```json
{
  "bundle": {
    "macOS": {
      "signingIdentity": "Developer ID Application: Your Name",
      "providerShortName": "TEAM_ID",
      "entitlements": null,
      "exceptionDomain": null
    }
  }
}
```

### Notarization (Cho phân phối công khai)

Thêm vào GitHub Secrets:
- `APPLE_CERTIFICATE`: Base64 của .p12 certificate
- `APPLE_CERTIFICATE_PASSWORD`: Mật khẩu certificate
- `APPLE_ID`: Apple ID email
- `APPLE_PASSWORD`: App-specific password
- `APPLE_TEAM_ID`: Team ID từ Apple Developer

## Troubleshooting

### Lỗi "libwebkit2gtk not found" trên Linux:
```bash
sudo apt-get install libwebkit2gtk-4.1-dev
```

### Lỗi "No bundle targets specified":
Kiểm tra `tauri.conf.json` có `"targets": "all"` trong phần `bundle`.

### File DMG quá lớn:
- Tauri tự động optimize khi build với `--release`
- macOS Universal binary (Intel + ARM) sẽ lớn hơn ~2x

## Khuyến nghị

**Sử dụng GitHub Actions** - Đây là cách tốt nhất vì:
- ✅ Miễn phí cho public repositories
- ✅ Build cả 3 nền tảng cùng lúc
- ✅ Không cần máy Mac
- ✅ Tự động với mỗi release
- ✅ Lưu trữ artifacts sẵn sàng download
