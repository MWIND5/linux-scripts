# linux-scripts

Bash-скрипты для администрирования Linux.

## Скрипты

- **sysinfo.sh** — сводка: uptime, load, memory, disk, top CPU/RAM, listening ports, failed SSH
- **backup.sh** — бэкап папки с ротацией (хранит 7 архивов)
- **check-services.sh** — проверка статуса сервисов (ssh, fail2ban, tailscaled, docker)
- **logparse.sh** — топ-10 IP по неудачным SSH-логинам (auth.log или journalctl)

## Использование

./sysinfo.sh
./backup.sh /path/to/src /path/to/dst
./check-services.sh
./logparse.sh

## Требования

- Linux (Debian/Ubuntu)
- Bash 4+
- root/sudo для логов и systemctl
