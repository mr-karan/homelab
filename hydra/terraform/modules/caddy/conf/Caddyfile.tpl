nomad.mrkaran.dev {
    reverse_proxy 100.119.138.27:4646
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}

consul.mrkaran.dev {
    reverse_proxy 100.119.138.27:8500
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}
