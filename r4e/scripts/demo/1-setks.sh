#!/bin/bash

HTTP_ROOT="/usr/share/nginx/html"

if [ "$1" = "" ]; then
	cp -p ${HTTP_ROOT}/ks.cfg.default ${HTTP_ROOT}/ks.cfg
else
	cp -p ${HTTP_ROOT}/ks.cfg.$1 ${HTTP_ROOT}/ks.cfg
fi

cat ${HTTP_ROOT}/ks.cfg
