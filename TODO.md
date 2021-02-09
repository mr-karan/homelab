## Baby Steps

- [x] Setup Tailscale in Floyd/Gilmour.
- [x] Configure Nomad and Consul to bind on Tailscale Address.
- [ ] Deploy Caddy as a Nomad Job which
  - [ ] binds to 80/443 on host
  - [ ] mounts the cert directory
  - [ ] template file (caddy.tpl)
  - [ ] Configure `nomad.mrkaran.dev` and `consul.mrkaran.dev`.

## Hands on by deploying more workloads

- [ ] Deploy `shynet.mrkaran.dev`
- [ ] Deploy `grafana.mrkaran.dev`
