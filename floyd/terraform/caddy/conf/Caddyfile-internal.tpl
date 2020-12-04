pi.mrkaran.dev {
    reverse_proxy pihole:80
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
    metrics /metrics
}

wiki.mrkaran.dev {
    reverse_proxy bookstack:80
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
    metrics /metrics
}

grafana.mrkaran.dev {
    reverse_proxy grafana:3000
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
    metrics /metrics
}

sync.mrkaran.dev {
    reverse_proxy syncthing:8384
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
    metrics /metrics
}

nextcloud.mrkaran.dev {
    reverse_proxy nextcloud:80
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
    metrics /metrics
}
