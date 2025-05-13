#!/bin/bash

. .env

if [ -z "$1" ]; then
        VER="1.0.0"
else
        VER=$1
fi

COMMIT_DIR="rhde-microshift-${VER}"
REFS="rhel/9/x86_64/edge"

sudo ostree --repo=${HTTP_ROOT}/ostree/repo ls ${REFS}
echo "---"
sudo ostree --repo=${HTTP_ROOT}/ostree/repo show ${REFS}