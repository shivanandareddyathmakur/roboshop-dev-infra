#!/bin/bash

component=$1

dnf install ansible -y
#ansible-pull -U https://github.com/shivanandareddyathmakur/Ansible-roboshop-roles-tf.git -e "component=$component" main.yaml


REPO_URL=https://github.com/shivanandareddyathmakur/Ansible-roboshop-roles-tf.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=Ansible-roboshop-roles-tf

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop
touch ansible.log

cd $REPO_DIR

#check if ansible repo is already exist or not

if [ -d "$ANSIBLE_DIR" ]; then
    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
fi

ansible-playbook -e "component=$component" main.yaml


