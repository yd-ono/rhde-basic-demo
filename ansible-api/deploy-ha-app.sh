#!/bin/bash

ANSIBLE_HOST=192.168.3.102
JSON='{"extra_vars": "{\"namespace\": \"dgw\", \"appname\": \"'$1'\", \"servicename\": \"'$1'\", \"state\": \"present\"}"}'
curl --insecure -X POST \
    --user admin:redhat \
	-H "Content-Type: application/json" \
	-d "${JSON}" \
	https://$ANSIBLE_HOST/api/v2/job_templates/9/launch/
