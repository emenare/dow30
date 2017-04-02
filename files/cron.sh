#!/bin/bash

dir="/home/ec2-user/repos/dow30"

ansible-playbook ${dir}/get_data.yml -i ${dir}/hosts -u ec2-user
ansible-playbook ${dir}/update_web.yml -i ${dir}/hosts -u ec2-user
