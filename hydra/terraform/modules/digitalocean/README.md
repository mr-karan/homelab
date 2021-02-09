# Droplet Infra

Uses DigitalOcean Terraform provider to provision resources for managing personal server where the VPN runs. Additionally, a Kubernetes control plane is also deployed and this node acts as the master node.

## Getting Started

**Note**: Before you begin, export API token for performing any kind of ops with DO API:

```sh
export DIGITALOCEAN_TOKEN=<>
```

```shell
tf init
```

## Applying changes

```shell
tf plan
tf apply
```
