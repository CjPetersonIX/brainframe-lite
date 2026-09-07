# Hierarchy map — LITE wrapper (under 8 GB)

Top-down corporate tree. Same constitution as FULL. This edition staffs **R3 Agent Zero** and **R4 PicoClaw**.

## The company on one brain

```mermaid
flowchart TB
  R0["R0 · OWNER\nkill switch · money · publish · destroy"]

  subgraph R1["R1 · COMMHUB"]
    OS["OmniSecretary\nR0 personal secretary"]
    SUB["optional per-brain sub-secretary"]
    OS --- SUB
  end

  subgraph R2["R2 · SENATE  —  VPs are one rank"]
    direction TB
    SR["Cloud SR-VPs  ·  same rank as node VPs"]
    subgraph NODE["This machine"]
      VP1["VP1 Claude Code"]
      VP2["VP2 Codex"]
      VP3["VP3 AGY"]
      VP4["VP4 Grok Build"]
      VP5["VP5 optional"]
    end
    SR --- NODE
  end

  subgraph R3["R3 · OPERATIONS MANAGEMENT"]
    OM["Agent Zero\nsequential OM · RAM clamp"]
  end

  subgraph R4["R4 · OPERATIONS"]
    OP["PicoClaw\none grunt at a time"]
  end

  subgraph R5["R5 · BACKENDS  —  not seats"]
    API["Vendor APIs"]
    NIM["NIM / cheap models"]
    LOC["Local weights"]
  end

  R0 --> R1 --> R2 --> R3 --> R4 --> R5
```

## Command vs approval

```mermaid
flowchart LR
  R0 -->|command down| R1 -->|delegate| R2 -->|hand objective| R3 -->|one step| R4 -->|call| R5
  R5 -->|result| R4 -->|audit| R3 -->|brief| R2 -->|exception / ship ask| R1 -->|gate| R0
```

## What LITE will not draw

- Parallel OpenClaw on this box — that is FULL
- Frontal Lobe / MasterQ as something you install here
- R4 with publish rights
