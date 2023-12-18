#!/bin/bash

git clone https://github.com/yd-ono/rhde-fdo-acm.git
mv rhde-fdo-acm/argocd-manifest/* /etc/microshift/manifests
systemctl restart microshift

rm -rf /root/rhde-fdo-acm
cat /var/lib/microshift/resources/kubeadmin/kubeconfig > /root/.kube/config

cat /etc/crontab | grep -v firstboot > /etc/crontab.tmp
rm -f /etc/crontab
mv /etc/crontab.tmp /etc/crontab
rm -f \$0