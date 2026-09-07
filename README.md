# BRAINFRAME LITE

```
BRAINFRAME LITE
agentic wrapper  ·  single-brain sub-OS  ·  not the full OS
```

**This is not BrainFrame OS.**

This repo is an **agentic wrapper sub-OS** for **one brain** in a BrainFrame hierarchy. It installs a local Senate + operations stack on a single machine (down to ~2–4 GB RAM), and it can **sync** with other brains on your network.

The complete **BrainFrame Agentic Operating System** — fleet map, Helix geometry, dual LIVE/LEGACY strands, MasterQ — stays private until **BrainFrame OS: Helix** is complete. A sanitized public edition of the full OS will ship then. Do not treat this repo, `brainframe-full`, or the skill stubs as that OS.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/CjPetersonIX/brainframe-lite/main/install.sh | bash
```

Override checkout: `BRAINFRAME_HOME=~/my-brain BRAINFRAME_REPO=https://github.com/CjPetersonIX/brainframe-lite.git`.

## What you get (one brain)

```text
R0  (you — kill switch)
  ├─ VP1  Claude Code
  ├─ VP2  Codex
  ├─ VP3  Antigravity (agy)
  ├─ VP4  Grok Build
  ├─ OM   Agent Zero     sequential ops manager, RAM clamp
  └─ OPs  PicoClaw       one-grunt-at-a-time runtime
```

That is the **LITE hierarchy** on a single node. Parallel NemoClaw / OpenClaw swarms, Frontal Lobe / OmniSecretary, and Helix law are **not** in this package.

| This repo | Not this repo |
|---|---|
| One machine, one brain | The fleet OS |
| Linear / sequential labor | Parallel swarm |
| Local GUI, browser, keychain, USB | Cloud CommHub / MasterQ authority |
| Optional mesh sync with other LITE or FULL nodes | Helix cutover, LIVE+LEGACY encyclopedia |

## How a single brain works

- **VPs** are your CLI seats (Claude Code, Codex, AGY, Grok Build). Assign the ones you actually subscribe to. Unused seats stay empty.
- **Agent Zero** is the operations manager: one vertical in memory, RAM clamp, no surprise swarms.
- **PicoClaw** executes one step at a time. That is how 2–4 GB boxes survive.
- **Handoff + Q Pulse** (companion skills) keep the brain restartable. Use the CKPT stamp in those repos — not a private `CKPT-1,2,3` per agent.

## Sync with other brains

LITE can join a mesh as an edge node:

- Shared task file / git remote for queue + pulses (state goes to `main`).
- Optional Tool-Arm hook so a larger node can ask this box for GUI / files / screenshot.
- Same CKPT **epoch** across the network; each brain keeps its own **millidigit**.

If you never join a network, run it standalone. The wrapper does not require a second box.

## Hardware discipline (always on)

- One workload in RAM at a time.
- Per-process memory cap. Cleanup before a new spawn.
- Grep / stream large files; do not slurp them.
- Heavy parallel work belongs on a bigger brain, not here.

## Docs

| File | Holds |
|---|---|
| [`ARCHITECTURE.md`](ARCHITECTURE.md) | Wrapper vs full OS, hierarchy, mesh |
| [`CLAUDE.md`](CLAUDE.md) | Standing instructions for agents on this box |
| [`docs/TOOL_NODE.md`](docs/TOOL_NODE.md) | RAM / GUI rules |
| [`docs/TOOL_ARM_HOOK.md`](docs/TOOL_ARM_HOOK.md) | Optional inbound HTTP hook |

Companion public skills (not the OS):

- [brainframe-handoff](https://github.com/CjPetersonIX/brainframe-handoff) — CKPT continuity
- [brainframe-qpulse](https://github.com/CjPetersonIX/brainframe-qpulse) — status pulse

## Public edition rules

Placeholders only. Put secrets in a local git-ignored vault. No hostnames, tokens, or personal accounts belong in this tree.

Maintained by [The9thRealm](https://github.com/The9thRealm) / [CjPetersonIX](https://github.com/CjPetersonIX). Adopt, fork, break, rebuild.
