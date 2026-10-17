#!/usr/bin/env bash
set -euo pipefail

echo "===== $(date) ====="
echo "Host: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Kernel: $(uname -r)"
echo

echo "--- Load ---"
cat /proc/loadavg

echo

echo "--- Memory ---"
free -h

echo

echo "--- Disk ---"
df -h /

echo

echo "--- Top 5 CPU ---"
ps aux --sort=-%cpu | head -6

echo

echo "--- Top 5 RAM ---"
ps aux --sort=-%mem | head -6

echo

echo "--- Listening ports ---"
ss -tulpn | head -15

echo

echo "--- Failed SSH (last 5) ---"
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -5 || echo "none"