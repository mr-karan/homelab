<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h2 align="center">hydra</h2>
  <p align="center">
<i>Setup scripts for my homelab</i>
  </p>
  <img src="docs/calvin.jpg" alt="Calvin and Hobbes">
</p>

---

## Overview

- Single node [Nomad](https://www.nomadproject.io/) server for running workloads.
- [Consul](https://www.consul.io/) agent co-located for service discovery. 
- [Ansible](https://www.ansible.com/) scripts to boostrap the node.
- [Terraform](https://www.terraform.io/) modules for managing the following services:
  - Nomad jobs
  - Cloudflare DNS
  - DigitalOcean Infra
- [Tailscale VPN](https://tailscale.com/) for connectivity to internal services.
- [Caddy](https://caddyserver.com/) as a reverse proxy for all web services.

## Services Running

- [Pihole](https://pi-hole.net/)
- [Gitea](https://gitea.io/)
- [Shynet](https://github.com/milesmcc/shynet)
- [Syncthing](https://syncthing.net/)

## Blog Posts

Here's a collection of posts I've written which shows how Hydra has evolved over the years:

- **2021-02-14**: [Home Server with Nomad](https://mrkaran.dev/posts/home-server-nomad/)
- **2020-04-23**: [Home Server Updates](https://mrkaran.dev/posts/home-server-updates/)
- **2019-09-22**: [Home Server Setup](https://mrkaran.dev/posts/home-server-setup/)

## Setup Instructions

Visit [SETUP.md](./docs/SETUP.md) for following instructions on setting up Nomad and Consul.
