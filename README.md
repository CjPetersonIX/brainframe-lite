<p align="center">
  <img src="assets/banner.svg" alt="BRAINFRAME LITE — under 8GB single-brain wrapper" width="100%">
</p>

<p align="center">
  <img alt="wrapper" src="https://img.shields.io/badge/edition-LITE_wrapper-6ee7b7?style=for-the-badge&labelColor=070707">
  <img alt="ram" src="https://img.shields.io/badge/RAM-under_8GB-2dd4bf?style=for-the-badge&labelColor=070707">
  <img alt="ranks" src="https://img.shields.io/badge/ranks-R0%E2%80%93R5-f4efe6?style=for-the-badge&labelColor=070707">
</p>

<p align="center"><b>Agentic wrapper sub-OS for <em>one</em> brain. Not BrainFrame OS. Not Helix.</b></p>

| Wrapper | RAM | R3 OM | R4 OPs |
|---|---|---|---|
| <b>LITE</b> | under 8 GB | Agent Zero | PicoClaw |
| [FULL](https://github.com/CjPetersonIX/brainframe-full) | 8 GB+ | NemoClaw | OpenClaw |

## R0–R5

```mermaid
flowchart TB
  R0["R0 Owner"] --> R1["R1 CommHub / OmniSecretary"]
  R1 --> R2["R2 VPs · Claude Code · Codex · AGY · Grok Build"]
  R2 --> R3["R3 Agent Zero"]
  R3 --> R4["R4 PicoClaw"]
  R4 --> R5["R5 APIs / NIM / local models"]
```

Full table: [docs/RANKS.md](docs/RANKS.md).

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/CjPetersonIX/brainframe-lite/main/install.sh | bash
```

## CKPT

`<NODE-ID> CKPT <MASTER>.<LOCAL>` — [handoff](https://github.com/CjPetersonIX/brainframe-handoff) · [qpulse](https://github.com/CjPetersonIX/brainframe-qpulse)

## Docs

[ARCHITECTURE.md](ARCHITECTURE.md) · [CLAUDE.md](CLAUDE.md) · [docs/RANKS.md](docs/RANKS.md) · [docs/TOOL_NODE.md](docs/TOOL_NODE.md)
