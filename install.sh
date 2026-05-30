#!/usr/bin/env bash
#
# BRAINFRAME OS — LITE · one-line installer
#
#   curl -fsSL https://raw.githubusercontent.com/The9thRealm/brainframe-lite/main/install.sh | bash
#
# Scaffolds your own LITE edge Tool Node: framework tree, vault, and the Tool-Arm
# Hook server (desktop_api). Non-interactive and idempotent — safe to re-run.
#
set -euo pipefail

EDITION="LITE"
REPO_URL="${BRAINFRAME_REPO:-https://github.com/The9thRealm/brainframe-lite.git}"
TARGET="${BRAINFRAME_HOME:-$HOME/brainframe-lite}"
BIN_DIR="${BRAINFRAME_BIN:-$HOME/.local/bin}"

c_ok()   { printf '\033[92m  ✓\033[0m %s\n' "$1"; }
c_warn() { printf '\033[93m  !\033[0m %s\n' "$1"; }
c_step() { printf '\033[96m▸ %s\033[0m\n' "$1"; }

banner() {
  printf '\033[95m'
  cat <<'EOF'
██████╗ ██████╗  █████╗ ██╗███╗   ██╗███████╗██████╗  █████╗ ███╗   ███╗███████╗
██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝
██████╔╝██████╔╝███████║██║██╔██╗ ██║█████╗  ██████╔╝███████║██╔████╔██║█████╗
██╔══██╗██╔══██╗██╔══██║██║██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝
██████╔╝██║  ██║██║  ██║██║██║ ╚████║██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
EOF
  printf '\033[0m\033[96m            S O V E R E I G N   A I   O S   ·   %s\033[0m\n\n' "$EDITION"
}

banner

# ── 1. prerequisites ─────────────────────────────────────
c_step "Checking prerequisites"
miss=0
for tool in git curl python3; do
  if command -v "$tool" >/dev/null 2>&1; then c_ok "$tool"; else c_warn "$tool missing"; miss=1; fi
done
[ "$miss" -eq 1 ] && { printf '\033[91mInstall the missing required tools, then re-run.\033[0m\n'; exit 1; }

# ── 2. fetch / update the framework ──────────────────────
c_step "Installing framework → $TARGET"
if [ -d "$TARGET/.git" ]; then
  git -C "$TARGET" pull --ff-only && c_ok "updated existing checkout"
elif [ -f "$(dirname "$0")/ARCHITECTURE.md" ]; then
  mkdir -p "$TARGET"; cp -R "$(dirname "$0")/." "$TARGET/"; c_ok "copied from local checkout"
else
  git clone --depth 1 "$REPO_URL" "$TARGET" && c_ok "cloned $REPO_URL"
fi

# ── 3. scaffold runtime dirs ─────────────────────────────
c_step "Scaffolding runtime"
mkdir -p "$TARGET/handoff" "$TARGET/logs"
[ -f "$TARGET/TASK_QUEUE.md" ] || printf '# TASK QUEUE\n\n_(empty — edge tasks)_\n' > "$TARGET/TASK_QUEUE.md"
c_ok "handoff/ logs/ TASK_QUEUE.md"

# ── 4. vault ─────────────────────────────────────────────
c_step "Vault"
if [ ! -f "$TARGET/vault.env" ]; then
  cat > "$TARGET/vault.env" <<'V'
# Tool Node vault (mode 600). Fill YOUR values.
TOOLNODE_MESH_IP=
TOOL_PORT=7070
TOOL_API_SECRET=
V
  chmod 600 "$TARGET/vault.env"
  c_ok "created vault.env (mode 600) — set TOOL_API_SECRET + mesh IP"
else
  c_warn "vault.env already present — left untouched"
fi

# ── 5. install the Tool-Arm Hook server ──────────────────
c_step "Installing Tool-Arm Hook → $BIN_DIR"
mkdir -p "$BIN_DIR"
[ -f "$TARGET/bin/desktop_api.py" ] && install -m 0755 "$TARGET/bin/desktop_api.py" "$BIN_DIR/brainframe-hook" && c_ok "brainframe-hook"
case ":$PATH:" in *":$BIN_DIR:"*) : ;; *) c_warn "add to PATH:  export PATH=\"$BIN_DIR:\$PATH\"";; esac

echo
printf '\033[92mBRAINFRAME OS LITE installed.\033[0m\n'
cat <<EOF

Next steps:
  1. Edit  $TARGET/vault.env   (set a strong TOOL_API_SECRET + your mesh IP)
        export TOOL_API_SECRET=\$(openssl rand -hex 24)   # ≥16 chars required
  2. Start the hook (defaults to loopback 127.0.0.1:7070 — safe):
        TOOL_API_SECRET=... brainframe-hook
     (run it under launchd/systemd so it survives reboot)
  3. To let the MainBrain reach it, bind to your PRIVATE mesh IP only:
        TOOL_BIND=<your-mesh-ip> TOOL_API_SECRET=... brainframe-hook
     NEVER bind to a public address — this serves remote shell execution.
  4. From the FULL MainBrain, call /run /files/read /files/write /screenshot.

Read  $TARGET/ARCHITECTURE.md  and  $TARGET/docs/TOOL_ARM_HOOK.md
EOF
