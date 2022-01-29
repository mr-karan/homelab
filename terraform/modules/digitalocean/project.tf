# `hydra` tags all the resources assosciated with it under a project.
resource "digitalocean_project" "hydra" {
  name        = "hydra"
  description = "Self hosted Nomad cluster to deploy personal workloads"
  purpose     = "Web Application"
  environment = "Production"
  # Tag the droplet IDs and Floating IPs.
  resources = [digitalocean_droplet.parvaaz.urn, digitalocean_floating_ip.parvaaz.urn]
}

