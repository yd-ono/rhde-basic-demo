#!/bin/bash

sudo -b bash -c " \
cd /var/lib/libvirt/images && \
virt-install \
    --name rhde \
    --cpu host \
    --boot hd,cdrom \
    --vcpus sockets=1,cores=4,threads=1 \
    --memory 8192 \
    --disk path=./rhde.qcow2,size=30 \
    --network network=default,model=virtio \
    --events on_reboot=restart \
    --location /var/lib/libvirt/images/rhde-ztp.iso \
    --graphics vnc,port=5901,listen=0.0.0.0 \
    --extra-args "inst.ks=http://192.168.122.1:9000/ks.cfg" \
    --noautoconsole \
    --check disk_size=off \
    --quiet
"
