
# Set API key and API
set service https api keys id console key "$secret_console_api_key"
set service https api rest

# Certs
set service https certificates ca-certificate IPA
set service https certificates certificate IPA_API

set service https listen-address "0.0.0.0"
set service https listen-address "::"


set service https tls-version 1.3
set service https port 9443
set service https enable-http-redirect