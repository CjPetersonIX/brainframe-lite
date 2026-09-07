# LITE tool node — RAM and GUI

Single-brain wrapper rules. Public edition.

## RAM

Target: 2–4 GB class machines up through a normal laptop.

- One vertical resident at a time.
- Cap child processes. Kill and restart rather than stack.
- Trigger cleanup near ~80% RAM.
- Prefer `rg` / `grep` / streaming over full-file reads.

## GUI / hardware (why a local box still matters)

- Desktop automation and window control.
- Real browser: OAuth, MFA, FIDO taps the cloud cannot finish.
- OS keychain.
- USB and local-network peripherals.

## Sync

Optional. If this brain joins a network, publish pulse + handoff to the shared `main` and keep the Tool-Arm hook on a **private** bind + bearer secret. Never bind `/run` to a public address.
