# `parvaaz` is for running internal sites.
resource "digitalocean_droplet" "parvaaz" {
  image              = "ubuntu-20-04-x64"
  name               = "parvaaz"
  region             = "blr1"
  monitoring         = true
  size               = "s-2vcpu-4gb"
  ipv6               = true
  private_networking = true
  tags = [
    "internal"
  ]
  ssh_keys = [digitalocean_ssh_key.mrkaran.fingerprint]
}

# Attach the floating ip to droplet
resource "digitalocean_floating_ip" "parvaaz" {
  droplet_id = digitalocean_droplet.parvaaz.id
  region     = digitalocean_droplet.parvaaz.region
}
