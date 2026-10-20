#!/data/data/com.termux/files/usr/bin/bash
# =========================================================
# NOKA REJOIN — 1-FILE, 1-COMMAND, MULTI-CLOUDPHONE INSTALLER
#
# CARA PAKAI (di SETIAP cloudphone, 1 command doang):
#
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/aryaramdd/resett/refs/heads/main/noka/install.sh)"
#
# Opsi (append di akhir):
#   ... install.sh) --setup      # cuma setup wizard
#   ... install.sh) --start      # install + GAS (tanpa setup, kalau udah pernah)
#   ... install.sh) --restore    # balik state device & bounds
#
# DIA AKAN:
#   1. pkg install deps (1x, auto-skip kalau udah ada)
#   2. termux-setup-storage
#   3. download noka-rejoin.lua + noka-heartbeat.lua dari repo lo
#   4. self-test + check-config
#   5. START rejoin + monitoring (atau sesuai flag)
#
# Gak ada folder yang lo bikin. Gak ada file yang lo salin manual.
# =========================================================

set -u

REPO="https://raw.githubusercontent.com/aryaramdd/resett/refs/heads/main"
DL_DIR="/sdcard/Download"
REJOIN="$DL_DIR/noka-rejoin.lua"
BEAT="$DL_DIR/noka-heartbeat.lua"
FLAG="${1:-}"

echo "[1/5] installing deps..."
pkg install -y lua54 curl coreutils procps grep sqlite >/dev/null 2>&1
command -v lua >/dev/null 2>&1 || { echo "lua gak ada. Gak bisa lanjut."; exit 1; }

echo "[2/5] storage access..."
if [ ! -w "$DL_DIR" ]; then
    mkdir -p "$DL_DIR" 2>/dev/null
    termux-setup-storage >/dev/null 2>&1 || termux-setup-storage
fi
[ -w "$DL_DIR" ] || { echo "storage gak bisa di-akses. Cek izin Termux."; exit 1; }

echo "[3/5] download dari repo..."
curl -fsSL "$REPO/noka-rejoin.lua"   -o "$REJOIN"  || { echo "download rejoin GAGAL."; exit 1; }
curl -fsSL "$REPO/noka-heartbeat.lua" -o "$BEAT"    || { echo "download heartbeat GAGAL."; exit 1; }
# rejoin auto-download heartbeat dari URL, tapi kita juga simpen local copy
# sebagai fallback kalau repo di-takedown
grep -q "aryaramdd/resett" "$REJOIN" && echo "      rejoin -> repo lo OK" || echo "WARN: rejoin gak nunjuk ke repo lo"

echo "[4/5] self-test + config..."
lua "$REJOIN" --self-test || { echo "self-test GAGAL. Cek root/Magisk."; exit 1; }

echo "[5/5] GO ($FLAG)..."
case "$FLAG" in
    --restore)
        lua "$REJOIN" --restore-device
        lua "$REJOIN" --restore-bounds
        ;;
    --setup)
        exec lua "$REJOIN" --setup
        ;;
    --start)
        exec lua "$REJOIN" --start
        ;;
    "")
        # no flag: setup wizard if config belum valid, else start
        if lua "$REJOIN" --check-config 2>/dev/null; then
            exec lua "$REJOIN" --start
        else
            exec lua "$REJOIN" --setup
        fi
        ;;
    *)
        echo "unknown flag: $FLAG"
        echo "pakai: --setup | --start | --restore"
        exit 1
        ;;
esac
