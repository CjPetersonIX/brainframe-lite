# BRAINFRAME OS LITE — Tool Node Architecture

> Public reference edition. Addresses/handles are `<PLACEHOLDERS>`.

The Tool Node is one node in the dual-OS mesh. It does **not** run the Council or the
swarm — those live on the FULL MainBrain. LITE owns everything that needs a real
machine with a screen, a browser session, a keychain, and physical ports.

```
         ═══════════ BRAINFRAME OS — DUAL-OS FABRIC (private mesh) ═══════════
         │
         ├─ ◆ NODE: arm-01  "MainBrain" (FULL)  — cloud · Council + swarm
         │       (see the brainframe-full repo)
         │
         └─ ◆ NODE: Tool Node (LITE)  — small local machine · mesh <TOOLNODE_MESH_IP>
             │
             ├─ [CAPABILITIES]
             │   ├─ GUI / desktop automation
             │   ├─ Browser control — CDP, interactive OAuth, MFA
             │   ├─ OS keychain — secure local credential store
             │   ├─ Device bridge — USB / local-network to phones & peripherals
             │   └─ FIDO / MFA physical taps
             │
             ├─ [LITE MODE RULES]
             │   ├─ one workload in memory at a time
             │   ├─ per-process memory cap
             │   ├─ one local model loaded at a time
             │   └─ RAM-threshold cleanup before any new spawn
             │
             └─ TOOL-ARM HOOK — desktop_api :<TOOL_PORT>
                   ▲ one-way: MainBrain (FULL) → Tool Node (LITE)
                   /run · /files/read · /files/write · /screenshot
```

## Relationship to FULL

- **Peer, not subordinate.** LITE runs its own agent loop and its own handoffs.
- **One-way hook.** FULL initiates calls to LITE when it needs hardware. LITE does not
  reach *into* FULL the same way; it reports up through the normal command/approval
  chain.
- **Independent failure domains.** If the small machine is down, FULL keeps running
  (it just loses hardware reach until the node returns).

## Where LITE fits the command chain

LITE is invoked **only for hardware/GUI** steps of a task the Council already owns.
A typical flow: FULL plans a task → needs a browser OAuth → POSTs `/run` (or a browser
action) to the Tool Node → LITE performs it and returns the result → FULL continues.
