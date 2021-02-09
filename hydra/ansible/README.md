# Ansible Playbook for setting up Hydra Home Server

## Running

## Imp things to keep in mind

1) `ansible_ssh_user` for the first run should `root` since there is no user in the instance.
You must ensure that `bootstrap-nodes` role is first run before continuing. It disables the `root` SSH login to the instance and only
the `username` supplied in `inventory` has access to SSH.

**Bootstrap**: `ansible-playbook -i inventory playbook.yml --tag=bootstrap`

If you fail at this step, you need to debug before proceeding.


2) For Tailscale, it is recommended to generate `Pre Authorisation Keys` and encrypt them in vault:

- To encrypt the string `ansible-vault encrypt_string '<AUTH-KEY>' --name 'tailscale_auth_key`
- To run the playbook: `ansible-playbook -i inventory playbook.yml --tag=tailscale --ask-vault-pass`
