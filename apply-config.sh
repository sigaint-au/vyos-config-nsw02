#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

dry_run=true
PASSWORD_FILE="/config/.vyos-secrets-password"

source scripts/helpers.script

if [[ "$(id -g -n)" != 'vyattacfg' ]] ; then
    exec sg vyattacfg -c "/bin/vbash $(readlink -f "$0") $*"
fi

while getopts "cde" options; do
  case "${options}" in
  c)
    echo 'Will commit changes'
    dry_run=false
    ;;
  d)
    echo 'Decrypting all *.gpg files'

    # Check if we have a remembered password
    if [[ ! -f "$PASSWORD_FILE" ]]; then
      echo "Error: $PASSWORD_FILE not found" >&2
      exit 1
    fi

    # Use the remembered password for batch decryption
    find secrets/ -type f -name "*.gpg" -print0 | \
      xargs -0 -n1 gpg --batch --yes --passphrase-file "$PASSWORD_FILE" --decrypt-files

    if [[ $? -ne 0 ]]; then
      echo "Decryption failed — wrong password or corrupted files?" >&2
      exit 1
    fi

    echo 'Removing decrypted .gpg files'
    find secrets/ -name "*.gpg" -type f -delete

    echo 'Decryption complete'
    exit 0
    ;;
  e)
    echo 'Encrypting all plaintext files to *.gpg'

    if [[ ! -f "$PASSWORD_FILE" ]]; then
      echo "Error: $PASSWORD_FILE not found" >&2
      exit 1
    fi

    # Encrypt all non-.gpg files using the same password
    find secrets/ -type f ! -name "*.gpg" -print0 | while IFS= read -r -d '' file; do
      echo "Encrypting $file"
      gpg --batch --yes --symmetric --passphrase-file "$PASSWORD_FILE" \
          --output "${file}.gpg" "$file"

      if [[ $? -eq 0 ]]; then
        rm -f "$file"
        echo "  → ${file}.gpg created, plaintext removed"
      else
        echo "  → Failed to encrypt $file" >&2
      fi
    done

    echo 'Encryption complete'
    echo "Password saved temporarily for future decryption (until reboot or manual cleanup)"
    exit 0
    ;;
  *)
    echo 'error in command line parsing' >&2
    echo "Usage: $0 [-c] [-d | -e]" >&2
    exit 1
    ;;
  esac
done

# Include VyOS specific functions and aliases
source /opt/vyatta/etc/functions/script-template

# Reset the configuration
load /opt/vyatta/etc/config.boot.default

# Load secrets (now from decrypted files in /config/secrets/)
for f in /config/secrets/*.env; do
  if [[ -f "${f}" ]]; then
    echo "Loading secrets ${f}"
    source "${f}"
  fi
done

echo ""
echo "Loaded secrets:"
echo "--------------------------"
env | grep -E '^(secret_)'

echo ""
echo "Loaded host specific env:"
echo "--------------------------"
if [[ -f "/config/hosts/$(hostname -s).env" ]]; then
  source "/config/hosts/$(hostname -s).env"
  env | grep -E '^(host_)'
else
  echo "No host specific env file found"
fi

echo ""
echo "Processing config-parts"
echo "--------------------------"
for f in /config/config-parts/*.sh; do
  if [[ -f "${f}" ]]; then
    echo "Processing ${f}"
    envsubst < "${f}" | source /dev/stdin
  fi
done

echo ""
echo "Changes to running config:"
compare

if "${dry_run}"; then
  echo "Not saving changes, use -c to commit"
else
  echo "Committing and saving config"
  commit
  save
fi
