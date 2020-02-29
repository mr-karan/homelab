# Hydra
> Setup scripts for my home server setup named "Hydra"

## Overview

I run a Kubernetes cluster using [k3s](https://k3s.io/) on Raspberry Pi4 (2x nodes). I've prepared an Ansible Playbook to prepare the base OS ([Raspbian Buster Lite](https://www.raspberrypi.org/downloads/raspbian/)), configure some sane defaults and create a k3s cluster.

## Getting Started

If you're interested in bootstrapping a RPi cluster with k3s, you can refer to the following instructions to use the Ansible playbook.

### Prerequisites

- You need to flash Raspbian OS image on your RPi.
- You need to enable `SSH` access, which can be done by `sudo touch /boot/ssh`.

### Running the playbook

- Copy the `inventory.sample` to `inventory` and replace the hosts with your RPi nodes.
- Replace the `pi/roles/raspbian/vars/secret.sample` with your own secrets in `pi/roles/raspbian/vars/secret.yml`. I generally prefer to use Ansible Vault to encrypt the secrets.
- Run the playbook using `ansible-playbook pi/setup.yml`. This will configure your RPi for:
    - Changing the default password for `pi`.
    - Disabling Password based SSH access.
    - Configure hostname on all RPi nodes.
    - Enable `cgroups` features.
    - Update the GPU memory to lowest possible (16M) since we are going to use this as a server.
    - Bootstrap a k3s cluster on the control-plane node and join a agent node with the control-plane node.

### Credits
> I referred to the following resources while creating the Playbook

- [https://blog.alexellis.io/test-drive-k3s-on-raspberry-pi/](https://blog.alexellis.io/test-drive-k3s-on-raspberry-pi/)
- [https://github.com/rancher/k3s/tree/master/contrib/ansible/](https://github.com/rancher/k3s/tree/master/contrib/ansible/)


## Services Hosted
> List of services I am running on Hydra.

WIP

