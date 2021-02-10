provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
}

# Configure the Cloudflare provider.
provider "cloudflare" {
  # You need to set this in your .bashrc
  # export CLOUDFLARE_API_TOKEN="Your API TOKEN"
}

# Configure the Nomad provider.
provider "nomad" {
  address = "http://100.119.138.27:4646"
}
