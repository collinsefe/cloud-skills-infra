#!/bin/sh

ansible --version
echo "Happy Days Are Here Again!!!"
cd /tmp/ansible-configuration
ansible-playbook -i inventory.ini playbook.yaml 