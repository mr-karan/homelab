terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.5.1"
    }

    docker = {
      source = "kreuzwerker/docker"
    }
    
    cloudflare = {
      source = "cloudflare/cloudflare"
    }

  }
  required_version = ">= 0.14"
}
