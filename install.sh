#!/usr/bin/env bash
#
# BRAINFRAME LITE · single-brain wrapper installer
#
#   curl -fsSL https://raw.githubusercontent.com/CjPetersonIX/brainframe-lite/main/install.sh | bash
#
# Scaffolds one local brain: tree, vault placeholder, optional Tool-Arm hook.
# This is not BrainFrame OS. Non-interactive and idempotent.
#
set -euo pipefail

EDITION="LITE WRAPPER"
REPO_URL="${BRAINFRAME_REPO:-https://github.com/CjPetersonIX/brainframe-lite.git}"
TARGET="${BRAINFRAME_HOME:-$HOME/brainframe-lite}"
BIN_DIR="${BRAINFRAME_BIN:-$HOME/.local/bin}"

c_ok()   { printf '\033[92m  ✓\033[0m %s\n' "$1"; }
c_warn() { printf '\033[93m  !\033[0m %s\n' "$1"; }
c_step() { printf '\033[96m▸ %s\033[0m\n' "$1"; }

banner() {
  printf '\033[95m'
  cat <<'EOF'
BRAINFRAME LITE
EOF
  printf '\033[0m\033[96m   agentic wrapper  ·  single-brain sub-OS  ·  %s\033[0m\n\n' "$EDITION"
}

banner

c_step "Checking prerequisites"
miss=0
for tool in git curl python3; do
  if command -v "$tool" >/dev/null 2>&1; then c_ok "$tool"; else c_warn "$tool missing"; miss=1; fi
done
[ "$miss" -eq 1 ] && { printf '\033[91mInstall the missing required tools, then re-run.\033[0m\n'; exit 1; }

c_step "Installing wrapper → $TARGET"
if [ -d "$TARGET/.git" ]; then
  git -C "$TARGET" pull --ff-only && c_ok "updated existing checkout"
elif [ -f "$(dirname "$0")/ARCHITECTURE.md" ]; then
  mkdir -p "$TARGET"; cp -R "$(dirname "$0")/." "$TARGET/"; c_ok "copied from local checkout"
else
  git clone --depth 1 "$REPO_URL" "$TARGET" && c_ok "cloned $REPO_URL"
fi

c_step "Scaffolding runtime"
mkdir -p "$TARGET/handoff" "$TARGET/logs" "$TARGET/comms/qpulse"
[ -f "$TARGET/TASK_QUEUE.md" ] || printf '# TASK QUEUE\n\n_(empty — this brain)_\n' > "$TARGET/TASK_QUEUE.md"
c_ok "handoff/ logs/ comms/qpulse/ TASK_QUEUE.md"

c_step "Vault"
if [ ! -f "$TARGET/vault.env" ]; then
  cat > "$TARGET/vault.env" <<'V'
# Local brain vault (mode 600). Fill YOUR values. Never commit.
NODE_ID=
TOOLNODE_MESH_IP=
TOOL_PORT=7070
TOOL_API_SECRET=
V
  chmod 600 "$TARGET/vault.env"
  c_ok "created vault.env (mode 600)"
else
  c_warn "vault.env already present — left untouched"
fi

c_step "Optional Tool-Arm hook → $BIN_DIR"
mkdir -p "$BIN_DIR"
[ -f "$TARGET/bin/desktop_api.py" ] && install -m 0755 "$TARGET/bin/desktop_api.py" "$BIN_DIR/brainframe-hook" && c_ok "brainframe-hook"
case ":$PATH:" in *":$BIN_DIR:"*) : ;; *) c_warn "add to PATH:  export PATH=\"$BIN_DIR:\$PATH\"";; esac

echo
printf '\033[92mBRAINFRAME LITE wrapper installed.\033[0m\n'
cat <<EOF

This is one brain, not the full OS.

Next:
  1. Edit  $TARGET/vault.env   (NODE_ID, optional TOOL_API_SECRET)
  2. Read  $TARGET/README.md   and  $TARGET/ARCHITECTURE.md
  3. Optional hook (loopback only unless you know your mesh):
        TOOL_API_SECRET=... brainframe-hook
     NEVER bind /run to a public address.

CKPT + pulse: install brainframe-handoff and brainframe-qpulse skills.
EOF
