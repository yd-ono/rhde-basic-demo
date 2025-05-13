#!/bin/bash


###########################
## Download ISO
# set the offline token and checksum parameters
# get an access token
# export TOKEN=$(echo $TOKEN)
access_token=$(curl https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/token -d grant_type=refresh_token -d client_id=rhsm-api -d refresh_token=$TOKEN | jq -r '.access_token')

# RHEL 9.2 boot iso
checksum=087f5387f28e6edf1f770ec7eb41e56823b6c3c4d4c3ef09b3b61f59440c229c

# get the filename and download url
image=$(curl -H "Authorization: Bearer $access_token" "https://api.access.redhat.com/management/v1/images/$checksum/download")
filename=$(echo $image | jq -r .body.filename)
url=$(echo $image | jq -r .body.href)

# download the file
curl $url -o $filename