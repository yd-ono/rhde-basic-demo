#!/bin/bash

git add .
git commit -a -m "git update"
git push

ANSIBLE_HOST=192.168.3.102
curl --insecure -X POST \
        --user admin:redhat \
        -H "Content-Type: application/json" \
        https://$ANSIBLE_HOST/api/v2/projects/8/update/