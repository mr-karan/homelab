# Record some meta about droplet created
output "alphard_ipv4" {
  value = digitalocean_droplet.alphard.ipv4_address
}

output "alphard_droplet_name" {
  value = digitalocean_droplet.alphard.name
}

output "alphard_droplet_id" {
  value = digitalocean_droplet.alphard.id
}
