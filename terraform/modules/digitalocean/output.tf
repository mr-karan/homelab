output "floating_parvaaz" {
  value       = digitalocean_floating_ip.parvaaz.ip_address
  description = "Floating IP of parvaaz Node"
}
