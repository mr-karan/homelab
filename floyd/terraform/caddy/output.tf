output "caddy_network_internal" {
  value = docker_network.caddy_internal.name
}

output "caddy_network_public" {
  value = docker_network.caddy_public.name
}
