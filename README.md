# VyOS Configuration

Manage your VyOS device configuration.

# Setup

## Getting the code

Clone the code onto your vyos machine into the '/'

## Secrets

Secrets are stored in the `secrets/*` directory are are gpg encrypted. The file looks like the following example:

```bash
# interface wireguard
export secret_wireguard_wg600_private_key="NGZiMmJlMDAtZDQ2OS0xMWVmLWExYTItODRhOTNlNzM0ODI3Cg=="
export secret_wireguard_wg600_public_key="NTRmYjE1OGMtZDQ2OS0xMWVmLWExYTItODRhOTNlNzM0ODI3Cg=="
export secret_dns_dynamic_cloudflare_password="5e11dbdd-d469-11ef-a1a2-84a93e734827"
```

These export the secrets are environment variables are are substuted into any lines in the `config-parts/*.sh` files.
To use a secret in an interface for wireguard you might have the following configuration:

```bash
set interfaces wireguard wg600 peer Site__ABC public-key "$secret_wireguard_wg600_public_key"
set interfaces wireguard wg600 private-key "$secret_wireguard_wg600_private_key"
```

