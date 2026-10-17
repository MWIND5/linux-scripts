#!/usr/bin/env bash
set -euo pipefail

SERVICES=(ssh fail2ban tailscaled docker)
FAILED=0

for svc in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$svc"; then
        echo "[OK]   $svc"
    else
        echo "[FAIL] $svc"
        FAILED=1
    fi
done

exit $FAILED