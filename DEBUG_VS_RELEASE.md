# Sự Khác Biệt: Debug vs Release Build

## 📊 So Sánh

| Đặc điểm | Debug (`target/debug`) | Release (`target/release`) |
|----------|------------------------|----------------------------|
| **Lệnh build** | `npm run tauri dev` | `npm run tauri build` |
| **Mục đích** | Test, phát triển | Phân phối cho người dùng |
| **Tối ưu hóa** | ❌ Không | ✅ Có (tối ưu cao) |
| **Kích thước** | Lớn hơn (~15-20MB) | Nhỏ hơn (~10-12MB) |
| **Tốc độ chạy** | Chậm hơn | Nhanh hơn 2-3 lần |
| **Debug info** | ✅ Có (để debug) | ❌ Bỏ đi |
| **File MSI** | ❌ Không tạo | ✅ Tạo installer |

---

## 🎯 Khi Nào Dùng Cái Gì?

### Debug Build (target/debug)
- ✅ **Dùng khi:** Test tính năng, phát triển
- ✅ **Ưu điểm:** Build nhanh (1-2 phút sau lần đầu)
- ❌ **Nhược điểm:** Chạy chậm, file lớn

### Release Build (target/release)
- ✅ **Dùng khi:** Muốn phân phối cho học sinh
- ✅ **Ưu điểm:** Chạy nhanh, file nhỏ, có installer
- ❌ **Nhược điểm:** Build lâu hơn (5-10 phút)

---

## 🚀 Build Bản Release (Production)

Để tạo file .exe cho học sinh sử dụng:

### Bước 1: Mở Developer PowerShell for VS 2022

### Bước 2: Chạy lệnh build
```powershell
cd c:\foxvuicom
npm run tauri build
```

### Bước 3: Đợi build hoàn tất
- Lần đầu: 10-20 phút
- Các lần sau: 5-10 phút

### Bước 4: Lấy file .exe
Sau khi build xong, bạn sẽ có:

**1. File EXE standalone:**
```
c:\foxvuicom\src-tauri\target\release\foxvui.exe
```
- Chạy trực tiếp, không cần cài đặt
- Dùng file này nếu muốn copy trực tiếp cho học sinh

**2. File MSI Installer:**
```
c:\foxvuicom\src-tauri\target\release\bundle\msi\Foxvui_1.0.0_x64_en-US.msi
```
- File cài đặt chuẩn Windows
- Dùng file này nếu muốn học sinh cài đặt như phần mềm bình thường

---

## 📁 Phân Phối Cho Học Sinh

### Cách 1: Dùng file .exe (Đơn giản)
1. Copy file `foxvui.exe` từ `target/release/`
2. Gửi cho học sinh
3. Học sinh double-click để chạy
4. **Lưu ý:** Cần có WebView2 (Windows 10/11 thường đã có sẵn)

### Cách 2: Dùng MSI Installer (Chuyên nghiệp)
1. Copy file `.msi` từ `target/release/bundle/msi/`
2. Gửi cho học sinh
3. Học sinh double-click để cài đặt
4. Sau khi cài, app sẽ xuất hiện trong Start Menu và có thể gỡ bỏ qua Settings

---

## ✅ Kiểm Tra Kết Quả

Sau khi build release, test lại ứng dụng:

1. Chạy file `foxvui.exe` trong `target/release/`
2. Kiểm tra:
   - ✅ Ứng dụng mở nhanh
   - ✅ Title bar có 3 nút (minimize, maximize, close)
   - ✅ Nhập tên game và test iframe
   - ✅ Nút close hoạt động
   - ✅ ESC để quay về màn hình nhập

Nếu mọi thứ OK, bạn có thể phân phối cho học sinh!
