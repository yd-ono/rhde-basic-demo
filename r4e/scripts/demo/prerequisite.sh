#!/bin/bash

. .env

if [ -z "$1" ]; then
	VER="1.0.0"
else
	VER=$1
fi

REPO_DIR="rhde-microshift-${VER}"
sudo rm -rf ${REPO_DIR}

UUID=`sudo composer-cli compose list | grep FINISH | grep ${REPO_DIR} | awk '{print $1}'`
sudo rm -f ${UUID}-commit.tar

sudo composer-cli compose image ${UUID}
sudo mkdir -p ${REPO_DIR}
sudo tar -xf ${UUID}-commit.tar -C ${DEMO_ROOT}/${REPO_DIR}

echo "--------------------------------"
echo "[OSTree Commit]"
sudo ostree --repo=${REPO_DIR}/repo show ${REFS}

rm -f ${UUID}-commit.tar
