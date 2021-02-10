# Nomad Cluster Setup

# Setup Tailscale

Tailscale acts as a mesh layer between the server and worker nodes. Since the user's laptop/mobile also has a Tailscale agent running it makes it easy to deploy and browse Nomad/Consul Admin UIs as well.

```
sudo tailscale up
```

# Install Nomad

Follow the instructions from the [docs](https://www.nomadproject.io/docs/install).

```sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install nomad
nomad -autocomplete-install
complete -C /usr/local/bin/nomad nomad
sudo mkdir --parents /opt/nomad
```

## Setup Nomad

Follow the instructions from the [docs](https://learn.hashicorp.com/tutorials/nomad/production-deployment-guide-vm-with-consul).

### Systemd unit

```
# /etc/systemd/system/nomad.service
[Unit]
Description=Nomad
Documentation=https://www.nomadproject.io/docs
Wants=network-online.target
After=network-online.target

[Service]
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/bin/nomad agent -config /etc/nomad.d
KillMode=process
KillSignal=SIGINT
LimitNOFILE=infinity
LimitNPROC=infinity
Restart=on-failure
RestartSec=2
StartLimitBurst=3
StartLimitIntervalSec=10
TasksMax=infinity

[Install]
WantedBy=multi-user.target
```

### Configurations

All the config files are stored in `/etc/nomad.d`. 

```hcl
data_dir  = "/opt/nomad/data"
bind_addr = "{{ GetInterfaceIP \"tailscale0\" }}"
datacenter = "hydra"

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled       = true
}

consul {
  address = "100.119.138.27:8500"
}
```

### Verification

Since we changed the `bind_addr` from `0.0.0.0` to Tailscale IP we need to 
configure `NOMAD_ADDRESS` env variable for CLI to configure the remote endpoint:

[Docs](https://www.nomadproject.io/docs/commands#remote-usage)

```sh
export NOMAD_ADDR=http://100.119.138.27:4646
```

Before proceeding ahead, make sure `nomad` is running:

```sh
$ nomad server members
Name          Address    Port  Status  Leader  Protocol  Build  Datacenter  Region
floyd.global  10.47.0.6  4648  alive   true    2         1.0.3  hydra       global
```

### Default Ports

```
ports {
  http = 4646
  rpc  = 4647
  serf = 4648
}
```

### Accessing UI

Visit http://100.119.138.27:4646/ui/ to access Nomad UI.

# Install Consul

```sh
sudo apt-get update && sudo apt-get install consul
consul -autocomplete-install
complete -C /usr/bin/consul consul
sudo mkdir --parents /opt/consul
```

## Setup Consul

### Generate Keys

```
consul keygen
```

The output of the above command is used in the config file.

### Configuration

All the config is stored in `/etc/consul.d`

```hcl
datacenter = "hydra"
data_dir = "/opt/consul/data"
encrypt = "<TOKEN>"
server = true
bootstrap_expect = 1
client_addr = "100.119.138.27"
bind_addr = "127.0.0.1"
ui = true
```

### Accessing UI

Visit http://100.119.138.27:8500/ui/ to access Consul UI.

## Running a Job

```
rsync -avz --progress ./*.nomad floyd:/home/karan/jobs
```
## Vault

Currently using `TF_VARS` to load env variables from the host and run `tf apply`. Terraform then templates out the Nomad `jobspec` and submits the job to the server. This is okay in this context because:

- Nomad API server is listening only to Tailscale IP. Which means only trusted, authenticated agents have access to the API. This is very important because Nomad shows the plain text version of the `jobspec` in UI and CLI. So all the secret keys can be exposed if a malicious actor has access to the API server (even if read only).
 
- The env keys are mostly just one time API tokens or DB Passwords. They don't need to be "watched" and reloaded often, running an entire Vault server just for passing these keys seems a bit _extra complexity_.

**However**, to just _experiment_ with things and make the setup a bit more secure, we can consider running a single node Vault server:

- [ ] Setup Vault to store secrets
  - [ ] Vault init/unseal steps.
  - [ ] Add Policies and Role in Vault for a namespace
  - [ ] Configure Nomad to use Vault
  - [ ] Add an API token in Vault
  - [ ] Pass CF token to Caddyfile and retrieve from Vault with Consul Template
