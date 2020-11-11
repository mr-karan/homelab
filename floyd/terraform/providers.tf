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
}

# Configure the Cloudflare provider.
provider "cloudflare" {
  version = "~> 2.0"
  # You need to set this in your .bashrc
  # export CLOUDFLARE_API_TOKEN="Your API TOKEN"
}
