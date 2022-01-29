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

- [Ansible](https://www.ansible.com/) scripts to boostrap the node.
- [Terraform](https://www.terraform.io/) modules for managing the following services:
  - Cloudflare DNS
  - DigitalOcean Infra
- [Tailscale VPN](https://tailscale.com/) for connectivity to internal services.
- [Caddy](https://caddyserver.com/) as a reverse proxy for all web services.

## Services Running

- [Adguard Home](https://github.com/AdguardTeam/AdGuardHome)
- [Plausible](https://plausible.io/)
- [Linkding](https://github.com/sissbruecker/linkding)

## Blog Posts

Here's a collection of posts I've written which shows how Hydra has evolved over the years:

- **2021-02-14**: [Home Server with Nomad](https://mrkaran.dev/posts/home-server-nomad/)
- **2020-04-23**: [Home Server Updates](https://mrkaran.dev/posts/home-server-updates/)
- **2019-09-22**: [Home Server Setup](https://mrkaran.dev/posts/home-server-setup/)

## Updates

If you came here from [Running Nomad for home server](https://mrkaran.dev/posts/home-server-nomad/) blog post, then you can still checkout the `hashistack` branch but I am not using Nomad for my personal setup. As mentioned in the blog post, I wanted to tinker with a new orchestration system. Since now I am using it at my current $Work for production workloads, that purpose was achieved!

For my personal self hosting needs, I switched to a very simple Ansible based `docker-compose` system. I'll have a small writeup on it soon, but the general idea is that it makes it super easy and convenient to deploy popular FOSS tools using existing `docker-compose` files, hence I switched to it.
