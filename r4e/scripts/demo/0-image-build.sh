#!/bin/bash

HTTP_ROOT="/usr/share/nginx/html"
if [ -z "$1" ]; then
	VER="1.0.0"
else
	VER=$1
fi

BLUEPRINT="rhde-microshift-${VER}"
REFS="rhel/9/x86_64/edge"
IMAGE_TYPE="edge-commit"

if [ ${VER} = "1.0.0" ]; then
	composer-cli compose start-ostree ${BLUEPRINT} ${IMAGE_TYPE}
else
	composer-cli compose start-ostree --url=http://10.0.2.12:9000/ostree/repo/ --ref=${REFS} --parent ${REFS} ${BLUEPRINT} ${IMAGE_TYPE}
fi
