#!/usr/bin/env python3
"""
Tool-Arm Hook — BRAINFRAME OS LITE edge server (reference implementation).

A tiny bearer-gated HTTP API the FULL MainBrain calls over the private mesh when it
needs hardware:  POST /run · POST /files/read · POST /files/write · GET /screenshot

Config (env):
  TOOL_API_SECRET   shared bearer token (REQUIRED — refuses to start without it)
  TOOL_BIND         bind address  (default 0.0.0.0 — set to your mesh IP in prod)
  TOOL_PORT         port          (default 7070)

SECURITY: bind to your PRIVATE mesh interface only, never a public address. Only the
MainBrain should hold the secret. Every call is logged.
"""
import json, os, subprocess, sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

SECRET = os.environ.get("TOOL_API_SECRET", "")
BIND = os.environ.get("TOOL_BIND", "0.0.0.0")
PORT = int(os.environ.get("TOOL_PORT", "7070"))

if not SECRET:
    sys.exit("✗ refusing to start: set TOOL_API_SECRET")


class Hook(BaseHTTPRequestHandler):
    def _auth(self):
        return self.headers.get("Authorization", "") == f"Bearer {SECRET}"

    def _send(self, code, payload):
        body = json.dumps(payload).encode()
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def _body(self):
        n = int(self.headers.get("Content-Length", 0) or 0)
        return json.loads(self.rfile.read(n) or b"{}")

    def log_message(self, fmt, *args):
        sys.stderr.write("[hook] " + (fmt % args) + "\n")

    def do_GET(self):
        if not self._auth():
            return self._send(401, {"error": "unauthorized"})
        if self.path == "/screenshot":
            out = "/tmp/brainframe_shot.png"
            # platform-specific; macOS shown. Swap for your OS.
            rc = subprocess.call(["screencapture", "-x", out]) if sys.platform == "darwin" else 1
            return self._send(200 if rc == 0 else 501,
                              {"ok": rc == 0, "path": out if rc == 0 else None})
        self._send(404, {"error": "not found"})

    def do_POST(self):
        if not self._auth():
            return self._send(401, {"error": "unauthorized"})
        try:
            b = self._body()
        except Exception as e:
            return self._send(400, {"error": f"bad json: {e}"})
        if self.path == "/run":
            r = subprocess.run(b.get("cmd", ""), shell=True, capture_output=True, text=True, timeout=120)
            return self._send(200, {"code": r.returncode, "stdout": r.stdout, "stderr": r.stderr})
        if self.path == "/files/read":
            try:
                return self._send(200, {"content": open(b["path"]).read()})
            except Exception as e:
                return self._send(400, {"error": str(e)})
        if self.path == "/files/write":
            try:
                open(b["path"], "w").write(b.get("content", ""))
                return self._send(200, {"ok": True, "path": b["path"]})
            except Exception as e:
                return self._send(400, {"error": str(e)})
        self._send(404, {"error": "not found"})


if __name__ == "__main__":
    print(f"Tool-Arm Hook on http://{BIND}:{PORT}  (bearer-gated)")
    ThreadingHTTPServer((BIND, PORT), Hook).serve_forever()
