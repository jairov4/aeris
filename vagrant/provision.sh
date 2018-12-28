#!/bin/bash
set -xe
cd ../ansible
VG=../vagrant/.vagrant
AN=../ansible
AN_INVENTORY="$VG/provisioners/ansible/inventory/vagrant_ansible_inventory"
ansible-playbook --become -f 1 -i "$AN_INVENTORY" "$AN/docker-swarm.yml"
