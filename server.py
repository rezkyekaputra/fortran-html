#!/usr/bin/env python3
"""
CGI Server sederhana untuk demo Fortran web
Jalankan: python3 server.py
Akses: http://localhost:8080
"""
import http.server
import subprocess
import os

class FortranCGIHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        cgi_path = os.path.join(os.path.dirname(__file__), "cgi-bin", "hello")
        
        if self.path in ("/", "/index.html") and os.path.exists(cgi_path):
            # Jalankan binary Fortran
            result = subprocess.run([cgi_path], capture_output=True, text=True)
            output = result.stdout
            
            # Pisah header CGI dari body HTML
            parts = output.split("\n\n", 1)
            body = parts[1] if len(parts) > 1 else output
            
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=UTF-8")
            self.send_header("X-Powered-By", "GNU Fortran 14.3.1")
            self.end_headers()
            self.wfile.write(body.encode("utf-8"))
        else:
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b"<h1>404 - Not Found</h1>")

    def log_message(self, format, *args):
        print(f"[REQUEST] {args[0]} {args[1]}")

if __name__ == "__main__":
    port = 8080
    server = http.server.HTTPServer(("0.0.0.0", port), FortranCGIHandler)
    print(f"🚀 Fortran Web Server running at http://localhost:{port}")
    print(f"   X-Powered-By: GNU Fortran 14.3.1")
    print(f"   Press Ctrl+C to stop")
    server.serve_forever()
