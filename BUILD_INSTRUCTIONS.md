# HƯỚNG DẪN CHẠY FOXVUI DESKTOP APP

## ⭐ CÁCH KHUYẾN NGHỊ (Đơn Giản Nhất)

### Bước 1: Mở Developer PowerShell for VS 2022
1. Nhấn **Windows Key**
2. Gõ: `Developer PowerShell for VS 2022`
3. Click vào kết quả tìm được

> **LƯU Ý**: PHẢI dùng "Developer PowerShell for VS 2022", KHÔNG phải PowerShell thường!

### Bước 2: Chạy lệnh
```powershell
cd c:\foxvuicom
.\dev.ps1
```

**HOẶC** (nếu gặp lỗi execution policy):
```powershell
cd c:\foxvuicom
powershell -ExecutionPolicy Bypass -File .\dev.ps1
```

---

## Tại Sao File .bat Không Hoạt Động?

File `.bat` không thể load Visual Studio environment đúng cách khi chạy từ double-click. Environment variables của Visual Studio cần được load **trong cùng một session** với lệnh build.

### Giải Pháp
Sử dụng **Developer PowerShell for VS 2022** hoặc **Developer Command Prompt for VS 2022** thay vì chạy batch file trực tiếp.

---

## Build File .EXE (Production)

Sau khi test thành công với dev mode, chạy lệnh sau để build file .exe:

```powershell
# Trong Developer PowerShell for VS 2022
cd c:\foxvuicom
npm run tauri build
```

File .exe sẽ nằm trong:
- **Standalone EXE**: `src-tauri\target\release\foxvui.exe`
- **MSI Installer**: `src-tauri\target\release\bundle\msi\`

---

## Lỗi Thường Gặp

### "link.exe not found"
- **Nguyên nhân**: Không dùng Developer PowerShell
- **Giải pháp**: Phải dùng "Developer PowerShell for VS 2022"

### "Cannot be loaded because running scripts is disabled"
- **Nguyên nhân**: PowerShell execution policy
- **Giải pháp**: Chạy với bypass:
  ```powershell
  powershell -ExecutionPolicy Bypass -File .\dev.ps1
  ```

### "cargo not found"
- **Nguyên nhân**: Rust chưa cài hoặc chưa khởi động lại terminal sau khi cài
- **Giải pháp**: 
  1. Cài Rust từ https://rustup.rs/
  2. Khởi động lại terminal

---

## Tóm Tắt

**ĐÚNG** ✅
```
Windows Key → "Developer PowerShell for VS 2022" → cd c:\foxvuicom → .\dev.ps1
```

**SAI** ❌
```
Double-click dev.bat
```

**SAI** ❌
```
PowerShell thường (không phải Developer PowerShell)
```
