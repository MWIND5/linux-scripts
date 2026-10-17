#!/usr/bin/env bash
set -euo pipefail

echo "=== Top 10 failed SSH IPs ==="

if [[ -r /var/log/auth.log ]]; then
    grep "Failed password" /var/log/auth.log 2>/dev/null \
        | awk '{print $(NF-3)}' \
        | sort | uniq -c | sort -rn | head -10 || echo "no failures"
else
    journalctl -u ssh --no-pager -g "Failed password" 2>/dev/null \
        | grep -oE 'from [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' \
        | awk '{print $2}' \
        | sort | uniq -c | sort -rn | head -10 || echo "no failures (or journalctl unavailable)"
fi