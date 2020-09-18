provider "docker" {
  alias = "floyd"
  host  = "ssh://floyd:22"
}

provider "docker" {
  alias = "parvaaz"
  host  = "ssh://parvaaz:22"
}

provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  #
}