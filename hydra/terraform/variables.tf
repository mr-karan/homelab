locals {
  # Map of IPs of all the nodes.
  ips = {
    floyd_floating = module.servers.floating_floyd
    gilmour_floating = module.servers.floating_gilmour
  }
}
