# Tool Node — capabilities & LITE-mode discipline

## What the node is for

A small, always-on local machine that gives the headless cloud MainBrain a body:

| Capability | Why the cloud can't do it itself |
|---|---|
| GUI / desktop automation | The MainBrain is headless — no display server. |
| Browser control (CDP) | Interactive OAuth / MFA can't be completed headless. |
| OS keychain | Secure local secret store tied to the physical machine. |
| Device bridge (USB / LAN) | Physical ports to phones and peripherals. |
| FIDO / MFA taps | A real button press a remote box can't perform. |

## Hardware requirements

LITE is deliberately built for **modest, older, or low-spec machines** — that's the whole
point of the edition.

| Tier | RAM | Experience |
|---|---|---|
| Comfortable | 8 GB+ | Smooth. Headroom for a browser session + a small local model. |
| Workable | 4–8 GB | Fine for the Tool-Arm Hook + GUI automation. |
| **Floor** | **as low as 4 GB** | **Runs — but expect some lag.** Keep one workload in memory, lean on the MainBrain swarm for cognition. |

You do **not** need a 16 GB machine. If all you're running is the Tool-Arm Hook and light
GUI automation, an old 4 GB laptop is a perfectly valid Tool Node — it'll just feel slower
under load. The LITE-mode rules below exist precisely so a small machine stays responsive.

## LITE-mode rules

Because the node is small, it self-limits to stay responsive:

1. **One workload in memory at a time.** Finish or park one vertical before the next.
2. **Per-process memory cap.** Bound each child process.
3. **One local model at a time.** Don't co-resident two model runtimes.
4. **RAM-threshold cleanup.** At a set RAM %, clean up before spawning anything new.
5. **Search over slurp.** Prefer grep/glob to reading whole large files.
6. **Offload cognition.** Heavy reasoning/codegen belongs on the MainBrain swarm — call
   up to it rather than running it locally.

## Operating posture

- Treat the node as an **edge peer**: it has its own session, handoffs, and pulse.
- It receives hardware tasks via the **Tool-Arm Hook** and may also run its own queued
  edge tasks.
- It never becomes a single point of failure for the whole stack — if it's down, the
  MainBrain keeps running and simply loses hardware reach until it returns.
