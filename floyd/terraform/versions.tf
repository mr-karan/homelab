terraform {
  required_providers {
    digitalocean = {
      source = "terraform-providers/digitalocean"
    }
    docker = {
      source = "terraform-providers/docker"
    }
  }
  required_version = ">= 0.13"
}
