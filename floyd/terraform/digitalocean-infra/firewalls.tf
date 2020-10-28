data "http" "cloudflare_ip4_addrs" {
  url = "https://www.cloudflare.com/ips-v4"
}

data "http" "cloudflare_ip6_addrs" {
  url = "https://www.cloudflare.com/ips-v6"
}

resource "digitalocean_firewall" "web" {
  name = "allow-http-https-cloudflare"

  droplet_ids = [digitalocean_droplet.floyd.id]
  inbound_rule {
    protocol   = "tcp"
    port_range = "80"
    source_addresses = concat(
      split("\n", trimspace(data.http.cloudflare_ip4_addrs.body)),
      split("\n", trimspace(data.http.cloudflare_ip6_addrs.body))
    )
  }

  inbound_rule {
    protocol   = "tcp"
    port_range = "443"
    source_addresses = concat(
      split("\n", trimspace(data.http.cloudflare_ip4_addrs.body)),
      split("\n", trimspace(data.http.cloudflare_ip6_addrs.body))
    )
  }

}

resource "digitalocean_firewall" "icmp" {
  name = "allow-icmp-all"

  droplet_ids = [digitalocean_droplet.floyd.id]
  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

}

resource "digitalocean_firewall" "vpn" {
  name = "allow-all-tailscale-inbound"

  droplet_ids = [digitalocean_droplet.floyd.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "1-65535"
    source_addresses = ["100.64.0.0/10"]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "1-65535"
    source_addresses = ["100.64.0.0/10"]
  }

}

resource "digitalocean_firewall" "ssh" {
  name = "ssh-inbound"

  droplet_ids = [digitalocean_droplet.floyd.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}


resource "digitalocean_firewall" "outbound-all" {
  name = "allow-all-outbound"

  droplet_ids = [digitalocean_droplet.floyd.id]

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
