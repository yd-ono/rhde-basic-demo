#!/bin/bash

sudo virsh list --all
sudo virsh net-dhcp-leases default
