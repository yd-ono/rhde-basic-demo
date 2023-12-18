#!/bin/bash

HTTP_ROOT="/usr/share/nginx/html"
COMMIT_DIR="rhde-microshift-1.0.0"
REFS="rhel/9/x86_64/edge"

rm -rf ${HTTP_ROOT}/ostree/repo
cp -pr ${COMMIT_DIR}/repo ${HTTP_ROOT}/ostree/

ostree --repo=${HTTP_ROOT}/ostree/repo ls ${REFS}
echo "---"
ostree --repo=${HTTP_ROOT}/ostree/repo show ${REFS}

