# Tool-Arm Hook — the one-way delegation API

A tiny HTTP service on the Tool Node that the MainBrain (FULL) calls over the private
mesh when it needs hardware. **One-way**: FULL → LITE. LITE reports results back up the
normal command/approval chain, not by reaching into FULL.

## Endpoint

```
Base:  http://<TOOLNODE_MESH_IP>:<TOOL_PORT>
Auth:  Authorization: Bearer <TOOL_API_SECRET>
```

| Method & path | Purpose |
|---|---|
| `POST /run` | Run a shell command on the Tool Node. Body: `{"cmd": "..."}` |
| `POST /files/read` | Read a local file. Body: `{"path": "..."}` |
| `POST /files/write` | Write a local file. Body: `{"path": "...", "content": "..."}` |
| `GET  /screenshot` | Capture the current screen. |

## Example

```bash
curl http://<TOOLNODE_MESH_IP>:<TOOL_PORT>/run \
  -H "Authorization: Bearer $TOOL_API_SECRET" \
  -H "Content-Type: application/json" \
  -d '{"cmd":"echo ok"}'
```

## Security posture

- **Bearer-gated.** The shared secret lives only in each side's git-ignored vault.
- **Mesh-only.** Bind to the private mesh interface, never a public address.
- **Least privilege.** The hook is for hardware/GUI delegation — not a general remote
  shell for arbitrary callers. Only the MainBrain holds the secret.
- **Auditable.** Log every call; the MainBrain's checkpoints reference what it asked the
  Tool Node to do.

## Lifecycle

Run the hook under a process manager (launchd / systemd / equivalent) so it restarts on
boot and on crash. Health-check it from the MainBrain before delegating a task that
depends on hardware.
