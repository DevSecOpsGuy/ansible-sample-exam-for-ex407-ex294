#!/bin/bash

ssh-keygen -t rsa -b 2048 -N "" -q -f ./id_rsa <<<y 2>&1 >/dev/null

ansible -i inventory all -m file -a "path=/home/automation/.ssh owner=automation group=automation force=True mode='0700'" -e "ansible_user=automation ansible_password=devops"

ansible -i inventory all -m lineinfile -a "create=True path=/home/automation/.ssh/authorized_keys mode='0600' line='{{ line }}'" -e "line='$(cat id_rsa.pub)'" -e "ansible_user=automation ansible_password=devops"
