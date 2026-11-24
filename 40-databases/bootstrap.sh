#!/bin/bash

dnf install ansible -y
ansible-pull -u https://github.com/shivanandareddyathmakur/Ansible-roboshop-roles-tf.git component=mongodb main.yaml