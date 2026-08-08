#!/usr/bin/env bash
set -Eeuo pipefail

PANEL_PATH="${PTERO_PATH:-/var/www/pterodactyl}"
LOCAL_UNINSTALLER="$PANEL_PATH/.fxhl-theme/uninstall.sh"

fail() {
  echo "[FXHL] ERROR: $*" >&2
  exit 1
}

info() {
  echo "[FXHL] $*"
}

show_help() {
  cat <<HELP
FXHL Pterodactyl Blue Theme Uninstaller

Pemakaian:
  bash uninstall.sh
      Hapus tema/kode FXHL tetapi pertahankan tabel/data add-on.

  bash uninstall.sh --purge-data
      Hapus tema/kode FXHL sekaligus seluruh tabel/data add-on FXHL.

Lokasi panel custom:
  PTERO_PATH=/lokasi/panel bash uninstall.sh

Uninstaller ini TIDAK menghapus Pterodactyl, Wings, server, user utama,
node, allocation, egg, maupun database utama panel.
HELP
}

case "${1:-}" in
  -h|--help)
    show_help
    exit 0
    ;;
  ""|--purge-data)
    ;;
  *)
    fail "Argumen tidak dikenal: ${1}. Gunakan --help."
    ;;
esac

[[ $EUID -eq 0 ]] || fail "Jalankan uninstaller sebagai root."
[[ -f "$PANEL_PATH/artisan" ]] || fail "Pterodactyl tidak ditemukan di $PANEL_PATH. Gunakan PTERO_PATH=/lokasi/panel."
[[ -f "$LOCAL_UNINSTALLER" ]] || fail "FXHL Theme tidak terdeteksi di $PANEL_PATH. File $LOCAL_UNINSTALLER tidak ditemukan."

if [[ "${1:-}" == "--purge-data" ]]; then
  info "Menghapus FXHL Theme beserta tabel/data add-on FXHL."
  exec bash "$LOCAL_UNINSTALLER" --purge-data
else
  info "Menghapus FXHL Theme dan mengembalikan patch panel. Data pengaturan FXHL dipertahankan."
  exec bash "$LOCAL_UNINSTALLER"
fi
