git.mrkaran.dev {
    reverse_proxy gitea:3000
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}

shynet.mrkaran.dev {
    reverse_proxy shynet:8080
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}
