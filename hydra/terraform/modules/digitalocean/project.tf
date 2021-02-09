# `hydra` tags all the resources assosciated with it under a project.
resource "digitalocean_project" "hydra" {
  name        = "hydra"
  description = "Self hosted Nomad cluster to deploy personal workloads"
  purpose     = "Web Application"
  environment = "Production"
  # Tag the droplet IDs and Floating IPs of `floyd` and `gilmour`.
  resources   = [digitalocean_droplet.floyd.urn,
                 digitalocean_floating_ip.floyd.urn,
                 digitalocean_droplet.gilmour.urn,
                 digitalocean_floating_ip.gilmour.urn]
}
