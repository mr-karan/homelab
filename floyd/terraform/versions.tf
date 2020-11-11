terraform {
  required_providers {
    digitalocean = {
      source = "terraform-providers/digitalocean"
    }
    docker = {
      source = "terraform-providers/docker"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
  required_version = ">= 0.13"
}
