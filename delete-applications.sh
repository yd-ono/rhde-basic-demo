#!/bin/bash

ANSIBLE_HOST=192.168.3.102
AWX_TOKEN="Y6HCrWsFQW5D7tnReXlaLwXpgH5g6y"
JSON='{"extra_vars": "{\"namespace\": \"dgw\", \"appname\": \"'$1'\", \"servicename\": \"'$1'\", \"state\": \"absent\"}"}'
curl --insecure -s -f -k -XPOST \
	-H "Authorization: Bearer $AWX_TOKEN" \
	-H "Content-Type: application/json" \
	-d "${JSON}" \
	https://$ANSIBLE_HOST/api/v2/job_templates/32/launch/