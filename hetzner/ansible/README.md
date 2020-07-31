# Ansible Playbook for setting up Hydra Home Server

## Running

## Imp things to keep in mind

1) `ansible_ssh_user` for the first run is `root` since there is no user in the instance.
You must ensure that `bootstrap-nodes` role is first run before continuing. It disables the `root` SSH login to the instance and only
the `username` supplied in `inventory` has access to SSH. If you fail at this step, you need to debug before proceeding.
