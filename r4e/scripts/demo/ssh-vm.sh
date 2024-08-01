#!/bin/bash

IPADDR=$(sudo virsh domifaddr rhde 2>&1 | grep vnet | sed -e "s/.*\(192.*\)\/24$/\1/")
ssh redhat@$IPADDR
