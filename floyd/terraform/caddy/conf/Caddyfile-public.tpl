git.mrkaran.dev {
    reverse_proxy gitea:3000
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}
