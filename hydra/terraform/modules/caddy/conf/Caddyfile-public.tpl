shynet.mrkaran.dev {
    {{ range service "shynet-web" }}
    reverse_proxy {{ .Address }}:{{ .Port }}
    {{ end }}
    tls {
	    dns cloudflare "${cloudflare_api_token}"
    }
}
