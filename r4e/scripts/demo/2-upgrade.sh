#!/bin/bash

. .env

if [ -z "$1" ]; then
	VER="1.0.0"
else
	VER=$1
fi

COMMIT_DIR="rhde-microshift-${VER}"
REFS="rhel/9/x86_64/edge"

echo "---"
echo "[Current Commit]"
sudo ostree --repo=${HTTP_ROOT}/ostree/repo show ${REFS}
echo "---"
echo "[Updated Commit]"
sudo ostree --repo=${COMMIT_DIR}/repo show ${REFS}

## upgrade ostree repo
sudo ostree --repo=${HTTP_ROOT}/ostree/repo pull-local ${COMMIT_DIR}/repo

echo "---"
echo "[Current Commit]"
sudo ostree --repo=${HTTP_ROOT}/ostree/repo show ${REFS}


# set permission
sudo chcon -t httpd_sys_content_t usr/share/nginx/html -R
