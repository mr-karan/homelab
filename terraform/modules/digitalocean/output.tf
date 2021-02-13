output "floating_floyd" {
  value       = digitalocean_floating_ip.floyd.ip_address
  description = "Floating IP of Floyd Node"
}
