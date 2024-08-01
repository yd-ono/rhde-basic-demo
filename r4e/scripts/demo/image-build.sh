#!/bin/bash

. .env

if [ -z "$1" ]; then
	VER="1.0.0"
else
	VER=$1
fi

BLUEPRINT="rhde-microshift-${VER}"
REFS="rhel/9/x86_64/edge"
IMAGE_TYPE="edge-commit"

if [ ${VER} = "1.0.0" ]; then
	sudo composer-cli compose start-ostree ${BLUEPRINT} ${IMAGE_TYPE}
else
	sudo composer-cli compose start-ostree --url=http://localhost:9000/ostree/repo/ --ref=${REFS} --parent ${REFS} ${BLUEPRINT} ${IMAGE_TYPE}
fi
