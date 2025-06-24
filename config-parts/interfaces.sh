#/bin/vbash

# Set MAC Addresses
set interfaces ethernet eth0 hw-id "$host_interfaces_ethernet_eth0_mac"
set interfaces ethernet eth1 hw-id "$host_interfaces_ethernet_eth1_mac"

# Offload
set interfaces ethernet eth0 offload gro
set interfaces ethernet eth0 offload gso
set interfaces ethernet eth0 offload sg
set interfaces ethernet eth0 offload tso

set interfaces ethernet eth1 offload gro
set interfaces ethernet eth1 offload gso
set interfaces ethernet eth1 offload sg
set interfaces ethernet eth1 offload tso

# Interfaces for WAN
set interfaces pppoe pppoe0 description 'NET_NSW02_WAN'
set interfaces pppoe pppoe0 authentication password "$secret_ppoe_password"
set interfaces pppoe pppoe0 authentication username "$secret_ppoe_username"
set interfaces pppoe pppoe0 ip adjust-mss 'clamp-mss-to-pmtu'
set interfaces pppoe pppoe0 mtu '1492'
set interfaces pppoe pppoe0 source-interface 'eth0'
set interfaces pppoe pppoe0 dhcpv6-options pd 0 interface eth1 sla-id '0'
set interfaces pppoe pppoe0 dhcpv6-options pd 0 length '48'
set interfaces pppoe pppoe0 dhcpv6-options rapid-commit
set interfaces pppoe pppoe0 ipv6 address autoconf

# LAN
set interfaces ethernet eth1 address '10.130.0.1/16'
set interfaces ethernet eth1 description 'NEW_NSW02_WIFI'

# NEWCASTLE #
set interfaces wireguard wg600 address '100.64.8.2/32'
set interfaces wireguard wg600 description 'Lanham VPN Tunnel'
set interfaces wireguard wg600 peer NSW01_WG_1 address '103.214.222.109'
set interfaces wireguard wg600 peer NSW01_WG_1 allowed-ips '10.120.0.0/16'
set interfaces wireguard wg600 peer NSW01_WG_1 persistent-keepalive '25'
set interfaces wireguard wg600 peer NSW01_WG_1 port '51820'
set interfaces wireguard wg600 peer NSW01_WG_1 public-key "$secret_wireguard_wg600_public_key"
set interfaces wireguard wg600 private-key "$secret_wireguard_wg600_private_key"
