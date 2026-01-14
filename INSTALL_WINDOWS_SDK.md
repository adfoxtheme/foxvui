# ⚠️ LỖI: THIẾU WINDOWS SDK

## Vấn Đề
Lỗi: `cannot open input file 'kernel32.lib'`

Điều này có nghĩa là Visual Studio đã được cài đặt nhưng **thiếu Windows SDK**.

---

## 🔧 GIẢI PHÁP: Cài Windows SDK

### Bước 1: Mở Visual Studio Installer
1. Nhấn **Windows Key**
2. Gõ: `Visual Studio Installer`
3. Click vào kết quả

### Bước 2: Modify Visual Studio 2022
1. Tìm **Visual Studio Community 2022** trong danh sách
2. Click nút **Modify** (không phải Uninstall)

### Bước 3: Chọn Components Cần Thiết
1. Trong tab **Workloads**, đảm bảo chọn:
   - ✅ **Desktop development with C++**

2. Chuyển sang tab **Individual components** (ở trên cùng)

3. Tìm và đảm bảo các component sau được chọn:
   - ✅ **MSVC v143 - VS 2022 C++ x64/x86 build tools (Latest)**
   - ✅ **Windows 11 SDK (10.0.22621.0)** hoặc **Windows 10 SDK (10.0.19041.0)**
   - ✅ **C++ CMake tools for Windows**

### Bước 4: Cài Đặt
1. Click **Modify** ở góc dưới bên phải
2. Chờ cài đặt (5-10 phút)
3. Khởi động lại máy tính sau khi hoàn tất

---

## 📋 Sau Khi Cài Windows SDK

### Mở Developer PowerShell for VS 2022
1. Nhấn **Windows Key**
2. Gõ: `Developer PowerShell for VS 2022`
3. Mở nó lên

### Chạy Lệnh Build
```powershell
cd c:\foxvuicom
npm run tauri dev
```

Hoặc build file .exe:
```powershell
cd c:\foxvuicom
npm run tauri build
```

---

## ❓ Tại Sao Cần Windows SDK?

Windows SDK chứa các thư viện hệ thống Windows như:
- `kernel32.lib` - Windows kernel functions
- `user32.lib` - Windows UI functions
- `ws2_32.lib` - Windows Sockets

Rust cần các thư viện này để build ứng dụng Windows native.

---

## 🎯 Kiểm Tra Nhanh

Sau khi cài Windows SDK, mở Developer PowerShell và chạy:

```powershell
# Kiểm tra Windows SDK đã được cài
dir "C:\Program Files (x86)\Windows Kits\10\Lib" | Select-Object Name
```

Bạn sẽ thấy danh sách các phiên bản SDK (ví dụ: 10.0.22621.0).
