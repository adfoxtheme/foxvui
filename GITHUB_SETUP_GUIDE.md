# HƯỚNG DẪN ĐẨY CODE LÊN GITHUB TỪ ĐẦU

## Bước 1: Cài đặt Git

### 1.1. Tải Git cho Windows

1. 🌐 Mở trình duyệt và truy cập: **https://git-scm.com/download/win**
2. File sẽ tự động tải xuống (khoảng 50MB)
3. Chạy file `.exe` vừa tải

### 1.2. Cài đặt Git (Chọn theo hướng dẫn)

Khi cài đặt, **chỉ cần nhấn "Next" liên tục**, nhưng chú ý các bước sau:

✅ **Ở màn hình "Adjusting your PATH environment":**
- Chọn: **"Git from the command line and also from 3rd-party software"** (tùy chọn giữa)

✅ **Ở màn hình "Choosing the default editor":**
- Chọn: **"Use Visual Studio Code as Git's default editor"** (hoặc trình editor bạn thích)

✅ **Các màn hình khác:** Giữ nguyên mặc định, nhấn Next → Install

### 1.3. Kiểm tra Git đã cài thành công

Mở PowerShell/Command Prompt **MỚI** (phải đóng cửa sổ cũ nếu có) và gõ:

```bash
git --version
```

Nếu hiện `git version 2.xx.x` → **Thành công!** ✅

---

## Bước 2: Tạo tài khoản GitHub (Nếu chưa có)

### 2.1. Đăng ký GitHub

1. 🌐 Truy cập: **https://github.com/signup**
2. Điền thông tin:
   - **Email**: Email của bạn
   - **Password**: Mật khẩu mạnh
   - **Username**: Tên người dùng duy nhất (VD: `hoangfox2024`)
3. Xác nhận email (kiểm tra hộp thư đến)
4. Chọn gói **FREE** (miễn phí)

### 2.2. Đăng nhập GitHub

- Vào **https://github.com** và đăng nhập

---

## Bước 3: Tạo Repository mới trên GitHub

### 3.1. Tạo Repository

1. Đăng nhập GitHub → Nhấn nút **"+"** góc trên bên phải → Chọn **"New repository"**

2. Điền thông tin:
   ```
   Repository name: foxvuicom
   Description: (tùy chọn) "Foxvui - Trình duyệt game mini"
   Visibility: ✅ Public (để dùng GitHub Actions miễn phí)
   ```

3. ⚠️ **KHÔNG** tick vào:
   - ❌ Add a README file
   - ❌ Add .gitignore
   - ❌ Choose a license

4. Nhấn **"Create repository"**

### 3.2. Lưu lại URL của repo

Sau khi tạo, GitHub sẽ hiện URL dạng:
```
https://github.com/USERNAME/foxvuicom.git
```

**Lưu lại URL này!** (Thay `USERNAME` bằng tên GitHub của bạn)

---

## Bước 4: Cấu hình Git lần đầu

Mở PowerShell tại thư mục dự án (chuột phải vào thư mục `foxvuicom` → **Open in Terminal**)

### 4.1. Cấu hình tên và email

```bash
git config --global user.name "Tên Của Bạn"
git config --global user.email "email@cua-ban.com"
```

**Lưu ý:** Email này phải **trùng với email GitHub** đã đăng ký!

---

## Bước 5: Đẩy code lên GitHub

### Cách 1: Dùng Script tự động (Khuyến nghị) 🚀

Tôi đã tạo sẵn file `github-setup.bat` cho bạn.

1. **Mở file `github-setup.bat` bằng Notepad**
2. **Sửa dòng đầu tiên**, thay `YOUR_USERNAME` bằng tên GitHub của bạn:
   ```
   set GITHUB_USERNAME=hoangfox2024
   ```
3. **Lưu file** (Ctrl+S)
4. **Chạy file** (double-click `github-setup.bat`)

Script sẽ tự động:
- ✅ Khởi tạo Git repository
- ✅ Thêm tất cả file
- ✅ Commit code
- ✅ Kết nối với GitHub
- ✅ Push code lên

### Cách 2: Làm thủ công (Từng bước)

Mở PowerShell tại thư mục `c:\foxvuicom` và chạy từng lệnh:

```bash
# Bước 1: Khởi tạo Git repository
git init

# Bước 2: Thêm tất cả file (trừ file trong .gitignore)
git add .

# Bước 3: Commit code
git commit -m "Initial commit: Foxvui Tauri app"

# Bước 4: Đổi tên nhánh thành 'main'
git branch -M main

# Bước 5: Kết nối với GitHub (THAY USERNAME!)
git remote add origin https://github.com/USERNAME/foxvuicom.git

# Bước 6: Push code lên GitHub
git push -u origin main
```

⚠️ **Nhớ thay `USERNAME` bằng tên GitHub của bạn!**

### 4.3. Xác thực GitHub

Khi chạy `git push`, Windows sẽ hiện cửa sổ đăng nhập GitHub:
- Nhập username/password GitHub
- Hoặc click **"Sign in with browser"** (dễ hơn)

---

## Bước 6: Kích hoạt GitHub Actions

### 6.1. Bật Actions

1. Vào repository trên GitHub: `https://github.com/USERNAME/foxvuicom`
2. Click tab **"Actions"** (phía trên)
3. Nếu có thông báo, click **"I understand my workflows, go ahead and enable them"**

### 6.2. Chạy build lần đầu (Manual Trigger)

**Cách 1: Dùng Tag (Khuyến nghị)**

Mở PowerShell tại `c:\foxvuicom`:

```bash
git tag v2.0.0
git push origin v2.0.0
```

**Cách 2: Trigger thủ công trên web**

1. Vào tab **Actions** trên GitHub
2. Click workflow **"Build and Release"** (bên trái)
3. Click nút **"Run workflow"** (bên phải)
4. Chọn branch **main** → Click **"Run workflow"** màu xanh

---

## Bước 7: Theo dõi quá trình Build

### 7.1. Xem tiến trình

1. Vào tab **Actions**
2. Click vào workflow run mới nhất (đang chạy, có dấu 🟡 màu vàng)
3. Bạn sẽ thấy 3 job đang chạy:
   - 🍎 **macOS** (build DMG)
   - 🪟 **Windows** (build EXE/MSI)
   - 🐧 **Linux** (build DEB/AppImage)

### 7.2. Thời gian chờ

- Windows: ~5-7 phút
- Linux: ~8-10 phút
- **macOS: ~15-20 phút** (lâu nhất)

Khi tất cả job có dấu ✅ xanh → **Hoàn thành!**

---

## Bước 8: Tải file DMG về máy

### 8.1. Download Artifacts

1. Vào tab **Actions** → Click vào workflow run đã hoàn thành (✅)
2. Cuộn xuống phần **"Artifacts"**
3. Bạn sẽ thấy:
   - 📦 **Foxvui-macOS** ← Click để tải DMG
   - 📦 **Foxvui-Windows** ← File EXE/MSI
   - 📦 **Foxvui-Linux** ← File DEB/AppImage

4. Click **"Foxvui-macOS"** → File ZIP sẽ tải xuống
5. Giải nén ZIP → Lấy file `.dmg`

### 8.2. File DMG nằm ở đâu?

Trong file ZIP bạn tải về, sẽ có cấu trúc:
```
Foxvui-macOS.zip
└── src-tauri/
    └── target/
        └── universal-apple-darwin/
            └── release/
                └── bundle/
                    └── dmg/
                        └── Foxvui_2.0.0_universal.dmg  ← Đây!
```

File `Foxvui_2.0.0_universal.dmg` này:
- ✅ Hỗ trợ cả Mac Intel VÀ Apple Silicon (M1/M2/M3)
- ✅ Sẵn sàng để chia sẻ/phân phối

---

## Bước 9: Update code và build lại

### Khi bạn sửa code và muốn build phiên bản mới:

```bash
# 1. Add các file đã thay đổi
git add .

# 2. Commit với message mô tả
git commit -m "Update: [mô tả thay đổi]"

# 3. Push lên GitHub
git push

# 4. Tạo tag phiên bản mới
git tag v2.0.1
git push origin v2.0.1
```

→ GitHub Actions sẽ tự động build lại!

---

## ❓ Troubleshooting

### ❌ Lỗi: "git is not recognized"

**Giải pháp:**
1. Đóng hết PowerShell/CMD đang mở
2. Mở PowerShell **MỚI**
3. Chạy lại lệnh

Nếu vẫn lỗi → Khởi động lại máy tính

### ❌ Lỗi: "remote: Repository not found"

**Nguyên nhân:** URL GitHub sai

**Giải pháp:**
```bash
# Xóa remote cũ
git remote remove origin

# Thêm lại với URL đúng
git remote add origin https://github.com/USERNAME/foxvuicom.git
```

### ❌ Lỗi: "failed to push some refs"

**Nguyên nhân:** Bạn đã tạo README trên GitHub

**Giải pháp:**
```bash
git pull origin main --allow-unrelated-histories
git push -u origin main
```

### ❌ GitHub Actions thất bại

**Kiểm tra:**
1. Vào tab Actions → Click vào job bị lỗi → Xem log
2. Thường là do file `tauri.conf.json` hoặc thiếu dependencies

### ❌ Không tải được Artifacts xuống

**Nguyên nhân:** Artifacts chỉ lưu 90 ngày

**Giải pháp:**
- Build lại bằng cách push tag mới
- Hoặc release chính thức (sẽ lưu vĩnh viễn)

---

## 📌 Tóm tắt các lệnh quan trọng

```bash
# Kiểm tra trạng thái
git status

# Xem lịch sử commit
git log --oneline

# Xem remote URL
git remote -v

# Pull code mới nhất từ GitHub
git pull

# Push code lên GitHub
git push

# Tạo tag phiên bản mới
git tag v2.0.X
git push origin v2.0.X
```

---

## 🎯 Checklist hoàn thành

Sau khi làm xong tất cả, bạn sẽ có:

- ✅ Git đã cài đặt và cấu hình
- ✅ Tài khoản GitHub
- ✅ Repository `foxvuicom` trên GitHub
- ✅ Code đã được push lên GitHub
- ✅ GitHub Actions đã chạy thành công
- ✅ File **DMG cho macOS** đã tải về

---

## 💡 Lời khuyên

1. **Public repo = GitHub Actions miễn phí**
   - Public: 2,000 phút/tháng
   - Private: 500 phút/tháng

2. **Mỗi lần build macOS tốn ~20 phút**
   - Chỉ build khi cần (sau khi test kỹ)
   - Commit nhiều thay đổi 1 lúc

3. **Sử dụng tag để đánh dấu các phiên bản**
   - v2.0.0 → Phiên bản chính thức
   - v2.0.1 → Bản vá lỗi
   - v2.1.0 → Tính năng mới

4. **Nếu muốn chia sẻ file DMG:**
   - Tải artifact, upload lên Google Drive/Dropbox
   - Hoặc dùng GitHub Releases (lưu vĩnh viễn)

---

## 📖 Tài liệu tham khảo

- Git Basics: https://git-scm.com/book/vi/v2
- GitHub Docs: https://docs.github.com/en
- Tauri Docs: https://tauri.app/v1/guides/building/

---

**Chúc bạn thành công! 🚀**

Nếu gặp vấn đề, hãy gửi screenshot lỗi để tôi hỗ trợ cụ thể hơn.
