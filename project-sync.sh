#!/bin/bash

AWX_TOKEN="Y6HCrWsFQW5D7tnReXlaLwXpgH5g6y"
curl --insecure -X POST \
	-H "Authorization: Bearer $AWX_TOKEN" \
	-H "Content-Type: application/json" \
	https://localhost/api/v2/projects/27/update/
