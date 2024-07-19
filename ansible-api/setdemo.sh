#!/bin/bash

ANSIBLE_HOST=192.168.3.102
# JSON='{"extra_vars": "{\"namespace\": \"dgw\", \"appname\": \"'$1'\", \"servicename\": \"'$1'\", \"state\": \"absent\"}"}'
curl --insecure -s -f -k -XPOST \
    --user admin:redhat \
	-H "Content-Type: application/json" \
	https://$ANSIBLE_HOST/api/v2/workflow_job_templates/21/launch/