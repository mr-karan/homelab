# `floyd` is the Nomad Serve which also runs Consul, Vault.
resource "digitalocean_droplet" "floyd" {
  image              = "ubuntu-20-04-x64"
  name               = "floyd"
  region             = "blr1"
  monitoring         = true
  size               = "s-2vcpu-4gb"
  ipv6               = true
  private_networking = true
  tags = [
    "nomad",
    "control-plane"
  ]
  ssh_keys = [digitalocean_ssh_key.mrkaran.fingerprint]
}

# Attach the floating ip to droplet
resource "digitalocean_floating_ip" "floyd" {
  droplet_id = digitalocean_droplet.floyd.id
  region     = digitalocean_droplet.floyd.region
}
