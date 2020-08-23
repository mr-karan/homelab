git.mrkaran.dev {
    reverse_proxy gitea:3000
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}

pi.mrkaran.dev {
    reverse_proxy pihole:80
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}

wiki.mrkaran.dev {
    reverse_proxy bookstack:80
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}

grafana.mrkaran.dev {
    reverse_proxy grafana:3000
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}
