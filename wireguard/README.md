# Wireguard setup using Ansible

Ansible playbook to install `Wireguard` on `Ubuntu` server. This playbook handles the creation of Wireguard public and private key _securely_. It can be used to setup a mesh VPN between multiple hosts or it can also be used to simply add more peers to existing Wireguard configuration.

## Getting Started

```shell
ansible-playbook playbook.yml -i inventory
```

## Inventory Format

```yaml
vpn:
  hosts:
    alphard:
      ansible_user: root
      ansible_host: alphard
      wireguard_address: 10.9.0.1/32
      wireguard_allowed_ips: "10.9.0.1/32, 192.168.2.0/24"
      wireguard_endpoint: multi.exemple.com
      peers:
        laptop-personal:
          public_key: lol
          wireguard_address: 10.9.0.2/32
          wireguard_allowed_ips: "10.9.0.2/32, 192.168.3.0/24"
          wireguard_persistent_keepalive: 15
          wireguard_endpoint: nated.exemple.com
```

- `hosts.<name>.peers` configures additional peers for the `<name>` wireguard server.

## References

- [My Personal Networking Setup](https://mrkaran.dev/posts/personal-networking-setup/)
- [ansible-role-wireguard](https://github.com/githubixx/ansible-role-wireguard) - I tweaked this Ansible script to add `peers` variable in the host group. This can be helpful to add devices like mobile phones etc where you can't use Ansible to `SSH` and create a _mesh_ VPN but still want to use the VPN for browsing etc.
