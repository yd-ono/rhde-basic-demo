#!/bin/bash

DEMO_PATH="$HOME/rhde-basic-demo/r4e/scripts/demo"
podman run -d -p 9000:80 -v ${DEMO_PATH}/usr/share/nginx/html:/usr/share/nginx/html --name ostree-nginx nginx

cp -p container-nginx-ostree.service ~/.config/systemd/user
systemctl --user daemon-reload
systemctl --user start container-nginx-ostree.service
systemctl --user status container-nginx-ostree.service
