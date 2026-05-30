# BRAINFRAME OS — LITE

```
██████╗ ██████╗  █████╗ ██╗███╗   ██╗███████╗██████╗  █████╗ ███╗   ███╗███████╗
██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝
██████╔╝██████╔╝███████║██║██╔██╗ ██║█████╗  ██████╔╝███████║██╔████╔██║█████╗
██╔══██╗██╔══██╗██╔══██║██║██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝
██████╔╝██║  ██║██║  ██║██║██║ ╚████║██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
            S O V E R E I G N   A I   O S   ·   L I T E
```

## Install (one line)

```bash
curl -fsSL https://raw.githubusercontent.com/The9thRealm/brainframe-lite/main/install.sh | bash
```

Scaffolds your own LITE edge Tool Node — framework tree, vault, and the bearer-gated
Tool-Arm Hook server. Non-interactive, idempotent. Then set `TOOL_API_SECRET` and bind
to your private mesh.

---

The **edge Tool Node** of BRAINFRAME OS. LITE runs on a small local machine and gives
the cloud MainBrain hands in the physical world: GUI automation, a real browser for
OAuth/MFA, an OS keychain, and a device bridge.

> Public reference edition. All host addresses, account identifiers, and credentials
> are `<PLACEHOLDERS>`. Supply your own in a local, git-ignored vault.

## What this is

BRAINFRAME OS is a **dual-OS fabric**. This repo is the **LITE** half:

| Edition | Role | Repo |
|---|---|---|
| **FULL** | Cloud MainBrain — all cognition + swarm | `brainframe-full` |
| **LITE** (this repo) | Edge Tool Node — GUI/hardware/OS automation | `brainframe-lite` |

LITE is a **peer OS**, fully self-contained — *not* a subordinate of FULL. The only
coupling is a one-way **Tool-Arm Hook**: FULL calls LITE over the private mesh when it
needs hardware it doesn't have. Otherwise LITE runs its own loop.

## Why a separate small node

The MainBrain is a headless cloud box — it has no screen, no browser session, no
keychain, no USB. A small always-on local machine fills exactly those gaps:

- **GUI automation** — drive native apps and the desktop.
- **Real browser** — interactive OAuth flows and MFA the cloud can't complete headless.
- **OS keychain** — secure local credential storage.
- **Device bridge** — USB / local-network access to phones and peripherals.
- **Physical presence** — a human-style button tap for FIDO/MFA prompts.

## LITE mode (hardware-bounded discipline)

LITE is built for **small, older, or low-spec machines** — 8 GB+ is comfortable, but it
runs on **as low as 4 GB RAM** (expect some lag under load). You don't need a big box; an
old 4 GB laptop makes a perfectly good Tool Node. It self-limits to stay responsive:

- One workload in memory at a time.
- Per-process memory cap.
- One local model loaded at a time.
- Cleanup trigger at a RAM threshold before spawning anything new.
- Prefer search/grep over loading whole large files.

Details: [`docs/TOOL_NODE.md`](docs/TOOL_NODE.md).

## The Tool-Arm Hook

A tiny HTTP API the MainBrain calls over the mesh. See
[`docs/TOOL_ARM_HOOK.md`](docs/TOOL_ARM_HOOK.md).

```
POST /run          ← shell command on the Tool Node
POST /files/read   ← read a local file
POST /files/write  ← write a local file
GET  /screenshot   ← capture the screen
```

## Layout

```
README.md
ARCHITECTURE.md         ← the Tool Node's place in the mesh
CLAUDE.md               ← standing instructions for the Tool-Node agent
docs/
  TOOL_NODE.md          ← capabilities + LITE-mode rules
  TOOL_ARM_HOOK.md      ← the HTTP delegation API
.gitignore
```
