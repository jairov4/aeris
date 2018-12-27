#!/bin/bash
set -xe
VG=.vagrant
AN=../ansible
AN_INVENTORY="$VG/provisioners/ansible/inventory/vagrant_ansible_inventory"
ansible-playbook --forks 1 -i "$AN_INVENTORY" "$AN/playbooks/docker-swarm.yml"
