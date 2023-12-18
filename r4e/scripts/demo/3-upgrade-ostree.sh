#!/bin/bash

HTTP_ROOT="/usr/share/nginx/html"

if [ -z "$1" ]; then
	VER="1.0.0"
else
	VER=$1
fi

COMMIT_DIR="rhde-microshift-${VER}"
REFS="rhel/9/x86_64/edge"

echo "---"
echo "[Current Commit]"
ostree --repo=${HTTP_ROOT}/ostree/repo show ${REFS}
echo "---"
echo "[Updated Commit]"
ostree --repo=${COMMIT_DIR}/repo show ${REFS}

## upgrade ostree repo
ostree --repo=${HTTP_ROOT}/ostree/repo pull-local ${COMMIT_DIR}/repo ${REFS}

echo "---"
echo "[Current Commit]"
ostree --repo=${HTTP_ROOT}/ostree/repo show ${REFS}
