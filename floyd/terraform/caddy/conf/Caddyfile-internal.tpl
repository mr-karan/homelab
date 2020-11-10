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


firefly.mrkaran.dev {
    reverse_proxy firefly:8080
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
    header {
        # https://docs.firefly-iii.org/installation/docker#docker-and-reverse-proxies
        X-Forwarded-Proto https
    }
    metrics /metrics
}
