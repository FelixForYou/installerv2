# FXHL Pterodactyl Theme v2

Tema putih–biru untuk Pterodactyl dengan tampilan yang mengikuti preview FXHL: login split-layout, sidebar gelap, topbar putih, dashboard cards, server list modern, resource summary, dan mobile bottom navigation.

## Fitur

- Dashboard client v2 yang menggantikan tampilan dashboard bawaan secara visual.
- Sidebar: Dashboard, Servers, Account, Security, API Tokens.
- Topbar dan user badge.
- 4 kartu ringkasan: Servers, Active, Suspended, Plan Price.
- Daftar server dengan status live dari Client API.
- Ringkasan CPU, RAM, dan disk.
- Halaman server/account tetap menggunakan fitur asli Pterodactyl dan diberi shell/gaya FXHL agar console, files, database, schedule, backup, startup, dan settings tetap berfungsi.
- Login split-layout putih–biru.
- Tombol dan interaksi memakai animasi ringan; tidak memakai neon/neumorphism.
- Responsive + bottom navigation khusus mobile.
- Trial account, default 3 hari dan cooldown per IP.
- Buy account + QRIS nominal unik.
- Mutasi otomatis OrderKuota melalui `@starvale-sdk/orkut-mutasi@0.0.6`.
- Background dan popup dapat diatur dari Admin ID 1.
- Installer dan uninstaller GitHub Raw.

## Install

Upload semua file repository, lalu jalankan:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/install.sh)
```

Lokasi panel selain `/var/www/pterodactyl`:

```bash
PTERO_PATH=/lokasi/panel bash <(curl -fsSL https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/install.sh)
```

Installer akan memasang Node.js 22 bila Node.js/npm yang sesuai belum tersedia, lalu memasang `@starvale-sdk/orkut-mutasi@0.0.6` ke folder private `.fxhl-theme/node`.

## Setting

Login memakai akun Admin ID 1, lalu buka:

```text
Admin Panel -> FXHL Theme
```

Payment hanya memakai field berikut:

```env
METODE_PEMBAYARAN=orkut
ORKUT_USERNAME=ISI_USERNAME
ORKUT_TOKEN=ISI_USERID:TOKEN
ORKUT_ID=Ok1234567
QRIS_STRING=000201010211...
QRIS_LOGO=https://example.com/qris.png
ORKUT_PAYMENT_WINDOW_MINUTES=30
```

Tidak perlu endpoint, method, bearer header, action, atau JSON data path.

`ORKUT_TOKEN` disimpan terenkripsi menggunakan `APP_KEY` Laravel dan tidak ditampilkan kembali di halaman admin.

## Uninstall

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/uninstall.sh)
```

Hapus theme + tabel/data add-on:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/uninstall.sh) --purge-data
```

Uninstaller tidak menghapus Pterodactyl, Wings, server, node, egg, allocation, atau database utama panel.

## Catatan

Dashboard v2 membaca data dari Client API Pterodactyl milik user yang sedang login. Tidak ada API key panel yang ditanam di browser.

Jangan taruh token Orkut asli di repository GitHub. Isi credential hanya dari menu FXHL Theme di Admin Panel.
