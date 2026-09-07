<p align="center">
  <img src="assets/banner.svg" alt="BRAINFRAME LITE — under 8GB single-brain wrapper" width="100%">
</p>

<p align="center">
  <img alt="wrapper" src="https://img.shields.io/badge/edition-LITE_wrapper-6ee7b7?style=for-the-badge&labelColor=070707">
  <img alt="ram" src="https://img.shields.io/badge/RAM-under_8GB-2dd4bf?style=for-the-badge&labelColor=070707">
  <img alt="not os" src="https://img.shields.io/badge/not-the_fleet_OS-070707?style=for-the-badge">
</p>

<p align="center"><b>Agentic wrapper sub-OS for <em>one</em> brain. Not BrainFrame OS. Not Helix.</b></p>

The complete operating system stays private until <b>BrainFrame OS: Helix</b> is finished. This repo is only the <b>under-8 GB single-brain install</b>.

| Wrapper | RAM | Operations |
|---|---|---|
| <b>LITE</b> (this repo) | under 8 GB | Agent Zero + PicoClaw · sequential |
| [FULL](https://github.com/CjPetersonIX/brainframe-full) | 8 GB+ | NemoClaw + OpenClaw · parallel |

## Hierarchy

```mermaid
flowchart TB
  R0["R0 · owner / kill switch"]
  subgraph senate["Senate — pick the seats you subscribe to"]
    VP1["VP1 Claude Code"]
    VP2["VP2 Codex"]
    VP3["VP3 AGY"]
    VP4["VP4 Grok Build"]
  end
  OM["OM Agent Zero\nsequential · RAM clamp"]
  OPS["OPs PicoClaw\none grunt at a time"]
  R0 --> senate
  senate --> OM --> OPS
```

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/CjPetersonIX/brainframe-lite/main/install.sh | bash
```

## CKPT

`<NODE-ID> CKPT <MASTER>.<LOCAL>` — counter, not a float. Skills: [handoff](https://github.com/CjPetersonIX/brainframe-handoff) · [qpulse](https://github.com/CjPetersonIX/brainframe-qpulse).

## Docs

[ARCHITECTURE.md](ARCHITECTURE.md) · [CLAUDE.md](CLAUDE.md) · [docs/TOOL_NODE.md](docs/TOOL_NODE.md) · [docs/TOOL_ARM_HOOK.md](docs/TOOL_ARM_HOOK.md)

Secrets stay local and git-ignored.
