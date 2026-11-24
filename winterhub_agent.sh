# ============================================================
# PATCHED — key sudah ditanam, self-rename dimatikan.
# Deploy: download sbg ~/winterhub_agent.sh, lalu buat wrapper:
#   printf '#!/data/data/com.termux/files/usr/bin/bash\ncd $HOME\n/data/data/com.termux/files/usr/bin/bash $HOME/winterhub_agent.sh\n' > ~/.termux/boot/start_winterhub.sh
#   chmod +x ~/.termux/boot/start_winterhub.sh
# ============================================================
#!/data/data/com.termux/files/usr/bin/bash
#
# WinterHub Agent — Drop-in Boot Script
#
# Usage (either works):
#   A) Place in ~/.termux/boot/ and reboot — auto-runs via Termux:Boot
#   B) Run manually:  sh winterhub_agent.sh
#      (first run also self-installs to ~/.termux/boot/ for future reboots)
#
# Cara pakai (Bahasa Indonesia):
#   A) Taruh di ~/.termux/boot/ lalu reboot — otomatis jalan via Termux:Boot
#   B) Jalankan manual:  sh winterhub_agent.sh
#      (run pertama juga otomatis memasang ke ~/.termux/boot/ untuk reboot berikutnya)
#
# ── EDIT THIS / ISI INI ──
SCRIPT_KEY="AC8917B02FFF51AEB814A0FF4EE2A932"

AGENT_URL="https://api.wintercode.dev/loader/agent-obfuscated.lua"
INSTALL_DIR="/sdcard/Download"
AGENT_FILE="$INSTALL_DIR/agent.lua"
WINTERHUB_DIR="$HOME/.winterhub"
LOG="$WINTERHUB_DIR/agent.log"
BOOT_LOG="$WINTERHUB_DIR/agent_boot.log"
TERMUX_PREFIX="/data/data/com.termux/files/usr"
BOOT_DIR="$HOME/.termux/boot"
EXPECTED_NAME="winterhub_agent.sh"

mkdir -p "$WINTERHUB_DIR" 2>/dev/null
mkdir -p "$BOOT_DIR" 2>/dev/null

# ── Self-rename DISABLED (patched) ──
# Blok asli menyalin script ini ke ~/.termux/boot/ sebagai root-owned 700,
# yang bikin Termux:Boot gagal dengan error=13 Permission denied.
# Script ini sengaja tetap di $HOME dan dipanggil lewat wrapper user-owned
# ~/.termux/boot/start_winterhub.sh. Jangan aktifkan blok ini lagi.

export DEBIAN_FRONTEND=noninteractive

{
echo ""
echo "══════════════════════════════"
echo "  BOOT — $(date)"
echo "══════════════════════════════"
} >> "$BOOT_LOG"
log() { echo "$(date '+%H:%M:%S') $1" >> "$BOOT_LOG" 2>/dev/null; }
log "[*] First-install boot script started"

find_lua() {
    # lua5.4 only — prebuilt module tarballs are ABI-specific to Lua version.
    for cmd in lua5.4 lua54; do
        local p
        p=$(command -v "$cmd" 2>/dev/null) && [ -x "$p" ] && { echo "$p"; return 0; }
    done
    return 1
}

# ── Wait for boot + storage + network ──
while [ "$(getprop sys.boot_completed 2>/dev/null)" != "1" ]; do sleep 3; done
log "[+] Boot complete"

TRIES=0
while [ ! -d "$INSTALL_DIR" ] && [ $TRIES -lt 30 ]; do sleep 2; TRIES=$((TRIES+1)); done
[ ! -d "$INSTALL_DIR" ] && { log "[!!!] $INSTALL_DIR not accessible"; exit 1; }

while ! su -c "id" >/dev/null 2>&1; do sleep 2; done
log "[+] Root ready"

TRIES=0
while ! ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1 && [ $TRIES -lt 30 ]; do
    sleep 2
    TRIES=$((TRIES+1))
done
log "[+] Network ready"

termux-wake-lock 2>/dev/null || true

# ── Ensure repos are configured (fixes fresh/broken Termux installs) ──
if ! pkg list-installed 2>/dev/null | grep -q "lua"; then
    log "[*] Configuring package repos..."
    dpkg --configure -a --force-confdef --force-confold >> "$LOG" 2>&1 || true
    apt-get update -y >> "$LOG" 2>&1 || pkg update -y >> "$LOG" 2>&1 || true
    log "[+] Repos updated"
fi

# ── Ensure lua5.4 exists (required — prebuilt modules are ABI-locked to 5.4) ──
# If only lua5.3 is installed, we still install lua5.4 alongside it and use that.
if ! find_lua > /dev/null 2>&1; then
    log "[*] Installing lua5.4..."
    pkg install -y lua54 >> "$LOG" 2>&1 || { log "[!!!] Could not install lua5.4"; exit 1; }
    log "[+] lua5.4 installed"
fi

# ── Install pre-built Lua modules (fast: ~2 seconds) ──
LUA_BIN=$(find_lua) || { log "[!!!] Lua not found"; exit 1; }
if ! "$LUA_BIN" -e "require('socket'); require('ssl'); require('cjson')" 2>/dev/null; then
    log "[*] Installing pre-built Lua modules..."
    ARCH=$(uname -m)
    case "$ARCH" in
        aarch64|arm64) ARCH="aarch64" ;;
        x86_64|amd64) ARCH="x86_64" ;;
    esac
    MODULES_URL="https://api.wintercode.dev/loader/lua-modules-${ARCH}.tar.gz"
    MODULES_TMP="$TERMUX_PREFIX/tmp/lua-modules.tar.gz"
    mkdir -p "$TERMUX_PREFIX/tmp" 2>/dev/null
    curl -sL --max-time 30 --connect-timeout 10 -o "$MODULES_TMP" "$MODULES_URL"
    if [ -s "$MODULES_TMP" ]; then
        tar xzf "$MODULES_TMP" -C "$TERMUX_PREFIX" 2>/dev/null || \
        tar xf "$MODULES_TMP" -C "$TERMUX_PREFIX" 2>/dev/null || true
        chmod -R 755 "$TERMUX_PREFIX/lib/lua" "$TERMUX_PREFIX/share/lua" 2>/dev/null
        rm -f "$MODULES_TMP"
        log "[+] Pre-built modules installed"
    else
        rm -f "$MODULES_TMP"
        log "[~] Pre-built download failed, agent will handle it"
    fi
fi

# ── Ensure sqlite is available (needed for cookie operations) ──
command -v sqlite3 >/dev/null 2>&1 || pkg install -y sqlite >> "$LOG" 2>&1 || true

log "[+] Lua: $LUA_BIN"

# ── Download / Update agent ──
curl -sL --max-time 30 --connect-timeout 10 -o "$AGENT_FILE.tmp" "$AGENT_URL" 2>/dev/null
if [ -s "$AGENT_FILE.tmp" ] && [ "$(wc -c < "$AGENT_FILE.tmp" | tr -d ' ')" -ge 300000 ]; then
    mv "$AGENT_FILE.tmp" "$AGENT_FILE"
    log "[+] Agent downloaded ($(wc -c < "$AGENT_FILE" | tr -d ' ') bytes)"
else
    rm -f "$AGENT_FILE.tmp"
    [ ! -f "$AGENT_FILE" ] && { log "[!!!] Download failed, no agent.lua"; exit 1; }
    log "[~] Download failed, using existing agent.lua"
fi

# ── Save script key ──
[ -n "$SCRIPT_KEY" ] && echo -n "$SCRIPT_KEY" > "$WINTERHUB_DIR/script_key"
export SCRIPT_KEY

# ── Launch agent (auto-restart if modules get installed on first run) ──
rm -f "$WINTERHUB_DIR/main.pid" 2>/dev/null
cd "$INSTALL_DIR"
"$LUA_BIN" "$AGENT_FILE" > /dev/null 2>&1 &
AGENT_BGPID=$!

# Wait for agent to write PID file (max 30s)
PWAIT=0
while [ ! -s "$WINTERHUB_DIR/main.pid" ] && [ $PWAIT -lt 15 ]; do
    sleep 2; PWAIT=$((PWAIT+1))
done
PID=$(cat "$WINTERHUB_DIR/main.pid" 2>/dev/null)
if [ -n "$PID" ] && su -c "kill -0 $PID" 2>/dev/null; then
    log "[+] Agent running (PID $PID)"
else
    # Agent may have exited after installing modules ("Please re-run")
    # Wait for background process to finish, then retry once
    wait $AGENT_BGPID 2>/dev/null
    log "[*] First run may have installed modules, retrying..."
    eval "$(luarocks path 2>/dev/null)" || true
    rm -f "$WINTERHUB_DIR/main.pid" 2>/dev/null
    "$LUA_BIN" "$AGENT_FILE" > /dev/null 2>&1 &
    PWAIT=0
    while [ ! -s "$WINTERHUB_DIR/main.pid" ] && [ $PWAIT -lt 15 ]; do
        sleep 2; PWAIT=$((PWAIT+1))
    done
    PID=$(cat "$WINTERHUB_DIR/main.pid" 2>/dev/null)
    if [ -n "$PID" ] && su -c "kill -0 $PID" 2>/dev/null; then
        log "[+] Agent running on retry (PID $PID)"
    else
        log "[!] Agent failed to start after retry"
    fi
fi
log "[+] Boot done"
echo "══════════════════════════════" >> "$BOOT_LOG"
