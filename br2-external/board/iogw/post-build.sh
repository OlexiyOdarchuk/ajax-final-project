#!/bin/sh
# Runs after the stock board/raspberrypi5/post-build.sh.
set -eu

TARGET_DIR="$1"

# Development image: allow root login over SSH with the password set in
# BR2_TARGET_GENERIC_ROOT_PASSWD.
SSHD_CONFIG="${TARGET_DIR}/etc/ssh/sshd_config"
if [ -f "${SSHD_CONFIG}" ]; then
	sed -i -e '/^#\?PermitRootLogin/d' "${SSHD_CONFIG}"
	echo 'PermitRootLogin yes' >> "${SSHD_CONFIG}"
fi

# Persistent journal (journalctl -b -1 works after reboot)
mkdir -p "${TARGET_DIR}/var/log/journal"
