output "floating_floyd" {
  value       = digitalocean_floating_ip.floyd.ip_address
  description = "Floating IP of Floyd Node"
}

output "floating_gilmour" {
  value       = digitalocean_floating_ip.gilmour.ip_address
  description = "Floating IP of Gilmour Node"
}
