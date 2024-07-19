#!/bin/bash

git add .
git commit -a -m "git update"
git push

ANSIBLE_HOST=192.168.3.102
AWX_TOKEN="LGjLioQ6fTAf8mB3SEFCMUR3llUPao"
curl --insecure -X POST \
        -H "Authorization: Bearer $AWX_TOKEN" \
        -H "Content-Type: application/json" \
        https://$ANSIBLE_HOST/api/v2/projects/8/update/