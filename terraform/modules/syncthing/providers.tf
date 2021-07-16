terraform {
  required_providers {
    nomad = {
      source = "hashicorp/nomad"
      version = "1.4.14"
    }
  }
  required_version = ">= 0.14"
}
