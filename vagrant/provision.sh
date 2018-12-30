#!/usr/bin/env bash
set -xe
cd ../ansible
VG=../vagrant/.vagrant
AN=../ansible
AN_INVENTORY="$VG/provisioners/ansible/inventory/vagrant_ansible_inventory"
ansible-galaxy install -r requirements.yml
ansible-playbook --become -f 1 -i "$AN_INVENTORY" "$AN/docker-swarm.yml"
