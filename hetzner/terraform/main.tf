provider "hcloud" {
  token = var.hcloud_token
}

# Create a new SSH key
resource "hcloud_ssh_key" "karan" {
  name       = "Karan's SSH Key"
  public_key = file("~/.ssh/mrkaran_rsa.pub")
}

# Create a `main-primary` instance
resource "hcloud_server" "floyd" {
  name        = "floyd"
  server_type = "cx21"
  image       = "ubuntu-20.04"
  location    = "fsn1"
  backups     = true
  labels = {
    "group"      = "hydra"
    "service"    = "floyd"
    "created_by" = "karan"
  }
  ssh_keys = ["${hcloud_ssh_key.karan.id}"]
}

