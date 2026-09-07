# BRAINFRAME LITE

```
BRAINFRAME LITE
agentic wrapper  ·  single-brain sub-OS  ·  under 8 GB
```

**This is not BrainFrame OS.**

This repo is an **agentic wrapper sub-OS** for **one brain** with **under 8 GB RAM**. It installs a local Senate + **sequential** operations stack, and it can **sync** with other brains on your network.

The complete **BrainFrame Agentic Operating System** stays private until **BrainFrame OS: Helix** is complete. A sanitized public edition of the full OS will ship then. Do not treat this repo or `brainframe-full` as that OS.

| Wrapper | RAM | Operations |
|---|---|---|
| **brainframe-lite** (this repo) | **under 8 GB** | OM Agent Zero + OPs PicoClaw (sequential) |
| [brainframe-full](https://github.com/CjPetersonIX/brainframe-full) | **8 GB+** | OM NemoClaw + OPs OpenClaw (parallel) |

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/CjPetersonIX/brainframe-lite/main/install.sh | bash
```

Override: `BRAINFRAME_HOME=~/my-brain BRAINFRAME_REPO=https://github.com/CjPetersonIX/brainframe-lite.git`.

## What you get (one brain, under 8 GB)

```text
R0  (you — kill switch)
  ├─ VP1  Claude Code
  ├─ VP2  Codex
  ├─ VP3  Antigravity (agy)
  ├─ VP4  Grok Build
  ├─ OM   Agent Zero     sequential ops manager, RAM clamp
  └─ OPs  PicoClaw       one-grunt-at-a-time runtime
```

Same VPs as FULL. The split is **how labor runs**. Parallel NemoClaw / OpenClaw, Frontal Lobe, and Helix law are **not** in this package.

## How a single brain works

- Wire the VP seats you subscribe to. Unused seats stay empty.
- Agent Zero: one vertical in memory, RAM clamp.
- PicoClaw: one step at a time. That is how sub-8 GB boxes survive.
- CKPT via companion skills: `<NODE-ID> CKPT <MASTER>.<LOCAL>`.

## Sync

Shared git for queue + pulses (`main`). Optional Tool-Arm hook for GUI. Same epoch, per-brain millidigit. Standalone is fine.

## Hardware

- Floor ~2 GB. Ceiling for this edition: **just under 8 GB**.
- At 8 GB or more, install FULL instead.
- One workload in RAM. Cleanup before spawn. Grep, do not slurp.

## Docs

[`ARCHITECTURE.md`](ARCHITECTURE.md) · [`CLAUDE.md`](CLAUDE.md) · [`docs/TOOL_NODE.md`](docs/TOOL_NODE.md) · [`docs/TOOL_ARM_HOOK.md`](docs/TOOL_ARM_HOOK.md)

Skills: [handoff](https://github.com/CjPetersonIX/brainframe-handoff) · [qpulse](https://github.com/CjPetersonIX/brainframe-qpulse)

Placeholders only. Vault stays local and git-ignored.

Maintained by [The9thRealm](https://github.com/The9thRealm) / [CjPetersonIX](https://github.com/CjPetersonIX).
