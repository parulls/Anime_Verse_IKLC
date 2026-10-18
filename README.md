# 🎬 Anime Verse — Aplikasi Katalog Anime

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

**Anime Verse** adalah aplikasi mobile katalog anime interaktif yang dikembangkan sebagai proyek pembelajaran praktikum **Pemrograman Mobile**. Aplikasi ini dirancang secara bertahap mulai dari pengenalan widget dasar, layouting responsif, navigasi deklaratif, manajemen state, integrasi REST API, hingga autentikasi dan penyimpanan basis data lokal maupun *cloud*.

---

## 📌 Daftar Isi
- [Tentang Aplikasi](#-tentang-aplikasi)
- [Fitur Utama](#-fitur-utama)
- [Teknologi & Dependencies](#-teknologi--dependencies)
- [Struktur Proyek](#-struktur-proyek)
- [Persiapan & Instalasi](#-persiapan--instalasi)
- [Panduan Penggunaan Git untuk Praktikan](#-panduan-penggunaan-git-untuk-praktikan)
- [Tahapan Pengembangan (Roadmap Modul)](#-tahapan-pengembangan-roadmap-modul)

---

## 🚀 Tentang Aplikasi

Aplikasi **Anime Verse** menyajikan antarmuka modern berbasi *dark mode* dengan sentuhan gradien. Praktikan akan belajar bagaimana membangun aplikasi skala riil menggunakan Flutter, memahami arsitektur *Clean Architecture* sederhana (pola Repository & Provider), serta mengonsumsi data *live* dari [JikanAPI](https://jikan.moe/) (Unvalidated MyAnimeList REST API v4).

---

## ✨ Fitur Utama

- **🔑 Autentikasi Pengguna**:
  - Halaman Sign-In & Sign-Up dengan sistem validasi form.
  - Integrasi Firebase Authentication (Email/Password & Google Sign-In).
- **🏠 Katalog & Beranda Interaktif**:
  - Tampilan *Grid View* anime yang responsif pada berbagai ukuran layar.
  - Filter cepat berdasarkan kategori/genre anime.
  - Bilah pencarian (*Search Bar*) dengan fungsionalitas *debounce*.
  - Mekanisme *Infinite Scroll* / *Pagination* untuk memuat daftar anime secara efisien.
- **📖 Halaman Detail Anime**:
  - Informasi komprehensif: judul, skor/rating, jumlah episode, genre, dan sinopsis lengkap.
  - Penggunaan *cached network image* untuk optimasi performa pemuatan gambar.
  - Tombol penambah/penghapus daftar favorit.
- **❤️ Manajemen Favorit**:
  - Penyimpanan data lokal (*SQLite / Shared Preferences*) dan sinkronisasi *cloud* (*Firebase Firestore*).
- **👤 Manajemen Profil**:
  - Tampilan profil pengguna dan fitur pengaturan akun (reset password & logout).

---

## 🛠️ Teknologi & Dependencies

Aplikasi ini menggunakan dependensi utama berikut di dalam `pubspec.yaml`:

| Package | Fungsi & Kegunaan |
| :--- | :--- |
| **`flutter`** | SDK utama untuk pengembangan aplikasi cross-platform. |
| **`go_router`** | Navigasi deklaratif dan *deep linking* antar halaman. |
| **`provider`** | Manajemen *state* aplikasi secara terpusat (*ChangeNotifier*). |
| **`http`** | Klien HTTP untuk mengonsumsi REST API dari JikanAPI. |
| **`cached_network_image`** | Memuat dan menyimpan *cache* gambar poster dari URL internet. |
| **`firebase_core` & `firebase_auth`** | Layanan *backend* autentikasi *cloud*. |
| **`google_sign_in`** | Otentikasi masuk cepat menggunakan akun Google. |
| **`sqflite`** *(opsional)* | Basis data SQL lokal di perangkat mobile. |

### Configuration (`pubspec.yaml`)
Aset digital yang digunakan meliputi:
- **Aset Gambar**: `assets/images/`
- **Font Kustom**: `Urbanist` (dengan bobot `Thin` 100, `Light` 300, `Regular` 400, `Medium` 500, `SemiBold` 600, `Bold` 700, dan `ExtraBold` 800).

---

## 📂 Struktur Proyek

Struktur direktori didesain mengikuti prinsip **DRY (Don't Repeat Yourself)** dan modularitas tinggi:

```text
anime_verse/
├── assets/
│   ├── fonts/              # File font kustom (Urbanist TTF)
│   └── images/             # Asset gambar poster & logo
├── lib/
│   ├── config/             # Konfigurasi rute & navigasi (routes.dart)
│   ├── data/               # Dummy data & konstanta statis (dummy_data.dart)
│   ├── models/             # Model data (anime.dart)
│   ├── providers/          # Logic State Management (app_state_provider.dart)
│   ├── repositories/       # Data Layer & REST API HTTP Client (anime_repository.dart)
│   ├── screens/            # Halaman utama aplikasi (SignIn, SignUp, Home, Detail, Fav, Profile)
│   ├── widgets/            # Reusable UI Components (AppScaffold, AnimeCard, AnimeView, dll.)
│   └── main.dart           # Entry point aplikasi
├── pubspec.yaml            # Deklarasi dependencies & assets
└── README.md
```

---

## 💻 Persiapan & Instalasi

Bagi praktikan yang baru melakukan *clone* repository ini, ikuti langkah-langkah setup berikut:

1. **Prasyarat**:
   - [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.x ke atas)
   - IDE pilihan: VS Code atau Android Studio (beserta ekstensi Flutter & Dart)
   - Emulator Android / iOS atau Perangkat Fisik (*USB Debugging* aktif)

2. **Kloning Repository**:
   ```bash
   git clone https://github.com/USERNAME/IKLC-anime-verse.git
   cd IKLC-anime-verse
   ```

3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

4. **Jalankan Aplikasi**:
   ```bash
   flutter run
   ```

---

## 🌿 Panduan Penggunaan Git untuk Praktikan

Setiap praktikan diwajibkan mengikuti standar *version control* selama pengerjaan modul:

1. **Inisialisasi & Commit Awal**:
   ```bash
   git init
   git add .
   git commit -m "Initial project setup"
   ```
2. **Commit Bertahap**:
   Lakukan *commit* secara berkala setiap kali menyelesaikan satu fitur atau modul, contoh:
   - `feat(ui): add AnimeCard and responsive GridView`
   - `feat(router): integrate go_router navigation`
   - `feat(api): implement JikanAPI fetch in AnimeRepository`

---

## 🗺️ Tahapan Pengembangan (Roadmap Modul)

- [x] **Modul 1**: Pengenalan Environment, Installation & Dart Syntax Dasar
- [x] **Modul 2**: Fondasi UI (Widget Tree, Layouting, Responsive Design, Asset & Font Registration)
- [x] **Modul 3**: Navigasi Deklaratif menggunakan `go_router`
- [x] **Modul 4**: State Management menggunakan `provider` & Local State
- [ ] **Modul 5**: Integration REST API (JikanAPI v4) & Repository Pattern
- [ ] **Modul 6**: Firebase Authentication (Email/Password & Google Sign-In)
- [ ] **Modul 7**: Storage & Database (SQLite / Firestore)

---

*Dibuat untuk kebutuhan Laboratorium Pemrograman Mobile.*
