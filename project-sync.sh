#!/bin/bash

git add .
git commit -a -m $1
git push

AWX_TOKEN="Y6HCrWsFQW5D7tnReXlaLwXpgH5g6y"
curl --insecure -X POST \
	-H "Authorization: Bearer $AWX_TOKEN" \
	-H "Content-Type: application/json" \
	https://localhost/api/v2/projects/8/update/
