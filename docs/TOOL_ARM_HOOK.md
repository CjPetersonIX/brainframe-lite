# Tool-Arm Hook — LITE wrapper

Optional inbound HTTP on **this** box. A larger node on your mesh may call it for GUI/files. Not MainBrain. Not the OS.

```
Base:  http://<MESH_IP>:<TOOL_PORT>
Auth:  Authorization: Bearer <TOOL_API_SECRET>
```

| Call | Job |
|---|---|
| `POST /run` | shell |
| `POST /files/read` | read a file |
| `POST /files/write` | write a file |
| `GET /screenshot` | screen |

Bind loopback or a private mesh only. Never a public address. Log every call.
