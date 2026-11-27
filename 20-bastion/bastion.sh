#!/bin/bash

#growing the /home volume for terraform

sudo dnf install -y cloud-utils-growpart
#sudo growpart /dev/nvme0n1 4
sudo pvresize /dev/nvme0n1p4
sudo lvextend -L +30G -r /dev/mapper/RootVG-homeVol


sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform


