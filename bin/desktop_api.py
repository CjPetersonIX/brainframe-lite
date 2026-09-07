#!/usr/bin/env python3
"""
Tool-Arm Hook — LITE wrapper helper.
Bearer-gated HTTP for GUI/files on THIS box. Not BrainFrame OS.
A larger node on your mesh may call it. Bind private only.
"""
import json, os, subprocess, sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

SECRET = os.environ.get("TOOL_API_SECRET", "")
BIND = os.environ.get("TOOL_BIND", "127.0.0.1")
PORT = int(os.environ.get("TOOL_PORT", "7070"))

if not SECRET:
    sys.exit("set TOOL_API_SECRET")
if len(SECRET) < 16:
    sys.exit("TOOL_API_SECRET too weak — 16+ chars")

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
            rc = subprocess.call(["screencapture", "-x", out]) if sys.platform == "darwin" else 1
            return self._send(200 if rc == 0 else 501, {"ok": rc == 0, "path": out if rc == 0 else None})
        self._send(404, {"error": "not found"})
    def do_POST(self):
        if not self._auth():
            return self._send(401, {"error": "unauthorized"})
        try:
            b = self._body()
        except Exception as e:
            return self._send(400, {"error": str(e)})
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
    print(f"LITE hook http://{BIND}:{PORT}")
    ThreadingHTTPServer((BIND, PORT), Hook).serve_forever()
