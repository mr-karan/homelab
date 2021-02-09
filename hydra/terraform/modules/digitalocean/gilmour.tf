# `gilmour` is the worker node which runs all the workloads.
resource "digitalocean_droplet" "gilmour" {
  image              = "ubuntu-20-04-x64"
  name               = "gilmour"
  region             = "blr1"
  monitoring         = true
  size               = "s-1vcpu-2gb"
  ipv6               = true
  private_networking = true
  tags = [
    "nomad",
    "worker-1"
  ]
  ssh_keys = [digitalocean_ssh_key.mrkaran.fingerprint]
}

# Attach the floating ip to droplet
resource "digitalocean_floating_ip" "gilmour" {
  droplet_id = digitalocean_droplet.gilmour.id
  region     = digitalocean_droplet.gilmour.region
}
