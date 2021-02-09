// provider "docker" {
//   host  = "ssh://floyd:22"
//   alias = "floyd"
// }

// provider "docker" {
//   host  = "ssh://parvaaz:22"
//   alias = "parvaaz"
// }

// provider "docker" {
//   host  = "ssh://gilmour:22"
//   alias = "gilmour"
// }

provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
}

# Configure the Cloudflare provider.
provider "cloudflare" {
  # You need to set this in your .bashrc
  # export CLOUDFLARE_API_TOKEN="Your API TOKEN"
}
