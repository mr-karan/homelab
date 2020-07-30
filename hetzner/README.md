# Hetzner Infra

Uses [Terraform Provider for the Hetzner Cloud](https://github.com/hetznercloud/terraform-provider-hcloud) to provision resources for managing personal server where all the self-hosted applications are deployed.

## Getting Started

**Note**: Before you begin, export API token for performing any kind of ops with Hetzner API. Visit the [Cloud Console](https://console.hetzner.cloud), select your project, click "Security" on the left menu, switch to "Api Tokens" tab, click "GENERATE API TOKEN" button and follow the token creation master.

```sh
export TF_VAR_hcloud_token=<>
```

```shell
tf init
```

## Applying changes

```shell
tf plan
tf apply
```
