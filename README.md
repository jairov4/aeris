# Aeris

Docker Swarm based infrastructure for compute resources targeted to micro-services architecture.

## How to use?

First, place `vault.pwd` file in `ansible/` folder holding the Vault password that ansible will need to decrypt
the certificates under `ansible/files/` folder. Then setup your own certificates there also.

For development flavor launch the VM creation using Vagrant in the vagrant folder.
Setup the right network interface in Vagrant file where `PUBLIC_NETWORK_IF` is defined and run vagrant.

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

## Troubleshooting

- If you need more information about the certificate setup process, please have a look of https://docs.docker.com/engine/security/https/
- I recommend you have a look of the Vault documentation to understand the encryption of the key files.
  Already encrypted files here are reference only but notice that I'm not providing my vault password to avoid a
  situation where lazy people re-use it ending with a vulnerable system with a disclosed password. https://docs.ansible.com/ansible/latest/user_guide/vault.html
