# 🚀 Chạy Foxvui - Hướng Dẫn Nhanh

## ✅ ĐÃ CÀI ĐẶT ĐẦY ĐỦ

Bây giờ bạn đã có đủ:
- ✅ Visual Studio 2022
- ✅ Windows SDK
- ✅ Rust
- ✅ Node.js

---

## 🎯 CÁCH CHẠY (3 BƯỚC)

### Bước 1: Mở Developer PowerShell for VS 2022
- Nhấn **Windows Key**
- Gõ: `Developer PowerShell for VS 2022`
- Click vào kết quả (icon màu xanh/tím)

> ⚠️ **QUAN TRỌNG**: Phải dùng "Developer PowerShell for VS 2022", KHÔNG phải PowerShell thường!

### Bước 2: Di chuyển đến thư mục dự án
```powershell
cd c:\foxvuicom
```

### Bước 3: Chạy lệnh

**ĐỂ TEST (Development mode):**
```powershell
npm run tauri dev
```
- Ứng dụng sẽ mở lên
- Lần đầu sẽ mất 5-10 phút (download + compile dependencies)
- Các lần sau chỉ mất vài giây

**ĐỂ TẠO FILE .EXE (Production):**
```powershell
npm run tauri build
```
- Tạo file .exe để phân phối
- Mất 10-20 phút lần đầu
- File .exe nằm trong: `src-tauri\target\release\foxvui.exe`
- MSI installer nằm trong: `src-tauri\target\release\bundle\msi\`

---

## 📦 KẾT QUẢ SAU KHI BUILD

Sau khi chạy `npm run tauri build`, bạn sẽ có:

1. **File EXE standalone**: 
   - Đường dẫn: `c:\foxvuicom\src-tauri\target\release\foxvui.exe`
   - Chạy trực tiếp, không cần cài đặt
   - Cần WebView2 (đã có sẵn trên Windows 10/11)

2. **File MSI Installer**:
   - Đường dẫn: `c:\foxvuicom\src-tauri\target\release\bundle\msi\Foxvui_1.0.0_x64_en-US.msi`
   - File cài đặt cho người dùng cuối
   - Tự động cài các dependencies

---

## 💡 GHI CHÚ

- **Lần build đầu tiên**: Sẽ mất 10-20 phút vì phải tải và compile hàng trăm dependencies
- **Các lần sau**: Chỉ mất 1-2 phút vì đã có cache
- **Nếu gặp lỗi**: Đọc thông báo lỗi và báo cho tôi biết

---

## 🎮 TEST TÍNH NĂNG

Khi ứng dụng mở lên:
1. ✅ Nhập tên game vào ô input
2. ✅ Click "Mở trò chơi"
3. ✅ Game hiển thị trong iframe
4. ✅ Title bar có 3 nút: Minimize, Maximize, Close
5. ✅ Click nút X để đóng ứng dụng
6. ✅ Nhấn ESC cũng đóng game (quay về màn hình nhập)
