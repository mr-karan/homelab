provider "docker" {
  host  = "ssh://floyd:22"
  alias = "floyd"
}

provider "docker" {
  host  = "ssh://parvaaz:22"
  alias = "parvaaz"
}

provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  #
}
