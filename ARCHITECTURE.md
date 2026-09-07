# BRAINFRAME LITE — architecture

Public wrapper edition. Not BrainFrame OS. Not Helix.

## Layering

```text
BrainFrame OS : Helix     (private → sanitized public later)
        │
        ├─ LIVE + LEGACY strands, fleet map, MasterQ, cone of brains
        └─ this repo is not that

BRAINFRAME LITE           (this repo)
        │
        single Brain 🧠
        VP1–VP4 + Agent Zero + PicoClaw
        optional sync ↔ other brains on your network
```

## Hierarchy on one brain

```text
R0
 ├─ VP1 Claude Code     primary local CLI
 ├─ VP2 Codex           code / repo CLI
 ├─ VP3 AGY             Antigravity CLI
 ├─ VP4 Grok Build      Grok CLI
 ├─ OM  Agent Zero      sequential ops manager + RAM clamp
 └─ OPs PicoClaw        single-threaded grunt runtime
```

Telegram bots per seat are **optional**. They are not required for the wrapper to run.

## What LITE refuses to be

- The Frontal Lobe / OmniSecretary / MasterQ authority
- A parallel NemoClaw / OpenClaw swarm host
- A second copy of the LIVE encyclopedia
- `brainframe-full` (that public repo is also a skeleton, not the fleet OS)

## Mesh (optional)

```text
[ Brain A — LITE ] ↔ git/mesh ↔ [ Brain B — LITE or larger node ]
        │
        Tool-Arm hook (bearer, private bind only)
        POST /run  /files/read  /files/write  GET /screenshot
```

One-way by default: a larger node may call this box for hardware. This box reports state through handoff + pulse, not by reaching into another brain's vault.

## CKPT (when synced)

Use the public handoff + qpulse skills:

```
<NODE-ID> CKPT <MASTER>.<LOCAL>
```

One shared epoch on the network. One millidigit **per brain**, not per VP. The millidigit is a counter, not a decimal. State commits go to `main`.
