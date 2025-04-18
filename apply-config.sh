#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null
dry_run=true

if [[ "$(id -g -n)" != 'vyattacfg' ]] ; then
    exec sg vyattacfg -c "/bin/vbash $(readlink -f "$0") $*"
fi

while getopts "cde" options; do
  case "${options}" in
  # -c Commit changes - default is dry-run
  c)
    echo 'Will commit changes'
    dry_run=false
    ;;
  d)
    echo 'Decrypting secrets'
    gpg --decrypt-files secrets/*.gpg
    find secrets/ -name "*.gpg" -type f -print | xargs rm
    exit 0
    ;;
  e)
    echo 'Encrypting secrets'
    gpg -c secrets/credentials.env
    find secrets/ ! -name "*.gpg" -type f -print | xargs rm
    exit 0
    ;;
  *)
    echo 'error in command line parsing' >&2
    exit 1
    ;;
  esac
done

# Include VyOS specific functions and aliases
source /opt/vyatta/etc/functions/script-template

# Reset the configuration
load /opt/vyatta/etc/config.boot.default

# Load secrets
for f in /config/secrets/*.env; do
  if [[ -f "${f}" ]]; then
    echo "Loading secrets ${f}"
    source "${f}"
  fi
done

echo ""
echo "Loaded secrets:"
echo "--------------------------"
env |  grep -E '^(secret_)'

echo ""
echo "Loaded host specific env:"
echo "--------------------------"
if [ "-f /config/hosts/$(hostname -s).env" ]; then
  source "/config/hosts/$(hostname -s).env"
  env |  grep -E '^(host_)'
else
  echo "No host specific env file found"
fi

echo ""
echo "Processing config-parts"
echo "--------------------------"
# Load all config files
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
  # Commit and save
  echo "Committing and saving config"
  commit
  save
fi


