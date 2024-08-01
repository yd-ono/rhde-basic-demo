#!/bin/bash

. .env

sudo ostree --repo=${HTTP_ROOT}/ostree/repo ls ${REFS}
echo "---"
sudo ostree --repo=${HTTP_ROOT}/ostree/repo show ${REFS}
