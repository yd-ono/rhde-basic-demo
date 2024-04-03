#!/bin/bash

AWX_TOKEN="Y6HCrWsFQW5D7tnReXlaLwXpgH5g6y"
JSON='{"extra_vars": "{\"namespace\": \"dgw\", \"appname\": \"'$1'\", \"servicename\": \"'$1'\", \"state\": \"present\"}"}'
curl --insecure -X POST \
	-H "Authorization: Bearer $AWX_TOKEN" \
	-H "Content-Type: application/json" \
	-d "${JSON}" \
	https://localhost/api/v2/job_templates/30/launch/
