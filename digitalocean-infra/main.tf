provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  #
}

# Create a new SSH key
resource "digitalocean_ssh_key" "mrkaran" {
  name       = "mrkaran.dev"
  public_key = file("~/.ssh/mrkaran_rsa.pub")
}

# Create a new droplet in the blr1 region (master node)
resource "digitalocean_droplet" "alphard" {
  image  = "ubuntu-18-04-x64"
  name   = "alphard"
  region = "blr1"
  monitoring = true
  size   = "s-1vcpu-2gb"
  ipv6               = true
  private_networking = true
  tags = [
    "hydra",
    "k8s-master",
    "vpn",
  ]
  ssh_keys = [digitalocean_ssh_key.mrkaran.fingerprint]
}

# Attach the floating ip to droplet
resource "digitalocean_floating_ip" "alphard" {
  droplet_id = digitalocean_droplet.alphard.id
  region     = digitalocean_droplet.alphard.region
}
