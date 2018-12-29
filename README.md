# Aeris

Docker Swarm based infrastructure for compute resources targeted to micro-services architecture.

## How to use?

First, place an `vault.pwd` file in `ansible/` folder holding the Vault password that ansible will need to decrypt
the certificates under `ansible/files/` folder.

For development flavor launch the VM creation using Vagrant in the vagrant folder.

```bash
cd vagrant
vagrant up
```

It will also create the `.vagrant/` folder with the dynamically generated ansible inventory.

Then, you will need provision those VMs using ansible playbooks.

```bash
./provision.sh
```

After provisioning, you will need your provided certificates to gain access to the swarm from outside world.
Remember that your certificates are `ansible/files/docker-swarm*.pem`

```bash
cd ../ansible
ansible-vault decrypt --vault-password-file=vault.pwd files/docker-swarm-key.pem
docker -H tcp://$VM_IP \
    --tls \
    --tlscert files/docker-swarm.pem \
    --tlskey files/docker-swarm-key.pem
    info
```
