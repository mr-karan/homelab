# Create a new SSH key
resource "digitalocean_ssh_key" "mrkaran" {
  name       = "mrkaran.dev"
  public_key = file("~/.ssh/mrkaran_rsa.pub")
}

# Create a new droplet in the blr1 region (master node)
resource "digitalocean_droplet" "floyd" {
  image              = "ubuntu-20-04-x64"
  name               = "floyd"
  region             = "blr1"
  monitoring         = true
  size               = "s-1vcpu-2gb"
  ipv6               = true
  private_networking = true
  tags = [
    "hydra",
    "floyd",
  ]
  ssh_keys = [digitalocean_ssh_key.mrkaran.fingerprint]
}

# Attach the floating ip to droplet
resource "digitalocean_floating_ip" "floyd" {
  droplet_id = digitalocean_droplet.floyd.id
  region     = digitalocean_droplet.floyd.region
}

# Create a project for the entire homelab setup
resource "digitalocean_project" "hydra" {
  name        = "hydra"
  description = "Homelab by mrkaran"
  purpose     = "Web Application"
  environment = "Development"
  resources   = [digitalocean_droplet.floyd.urn, digitalocean_floating_ip.floyd.urn]
}
