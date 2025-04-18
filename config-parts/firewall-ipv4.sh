#!/bin/vbash

# Allow ping to all LOCAL interfaces
set firewall global-options all-ping enable

# WAN -> LOCAL
set firewall ipv4 name WAN-LOCAL default-action 'drop'
set firewall ipv4 name WAN-LOCAL default-log
set firewall ipv4 name WAN-LOCAL rule 100 action 'accept'
set firewall ipv4 name WAN-LOCAL rule 100 state 'established'
set firewall ipv4 name WAN-LOCAL rule 100 state 'related'
set firewall ipv4 name WAN-LOCAL rule 110 action 'accept'
set firewall ipv4 name WAN-LOCAL rule 110 description 'Wireguard VPN'
set firewall ipv4 name WAN-LOCAL rule 110 destination port '51820'
set firewall ipv4 name WAN-LOCAL rule 110 protocol 'udp'

set firewall ipv4 name WAN-LOCAL rule 130 action 'accept'
set firewall ipv4 name WAN-LOCAL rule 130 description 'SSH'
set firewall ipv4 name WAN-LOCAL rule 130 destination port '22'
set firewall ipv4 name WAN-LOCAL rule 130 protocol 'tcp'

set firewall ipv4 name WAN-LOCAL rule 140 action 'accept'
set firewall ipv4 name WAN-LOCAL rule 140 description 'PLex'
set firewall ipv4 name WAN-LOCAL rule 140 destination port '32400'
set firewall ipv4 name WAN-LOCAL rule 140 protocol 'tcp_udp'


# WAN -> WIFI
set firewall ipv4 name WAN-WIFI default-action 'reject'
set firewall ipv4 name WAN-WIFI default-log
set firewall ipv4 name WAN-WIFI rule 100 action 'accept'
set firewall ipv4 name WAN-WIFI rule 100 state 'established'
set firewall ipv4 name WAN-WIFI rule 100 state 'related'
set firewall ipv4 name WAN-WIFI rule 110 action 'reject'
set firewall ipv4 name WAN-WIFI rule 110 state 'invalid'

##
# LOCAL -> WAN
#
set firewall ipv4 name LOCAL-WAN default-action 'accept'
set firewall ipv4 name LOCAL-WAN default-log

# DHCP
set firewall ipv4 name LOCAL-WAN rule 100 action 'accept'
set firewall ipv4 name LOCAL-WAN rule 100 description 'Allow DHCP'
set firewall ipv4 name LOCAL-WAN rule 140 destination port '68,67'
set firewall ipv4 name LOCAL-WAN rule 100 protocol 'udp'
# ICMP
set firewall ipv4 name LOCAL-WAN rule 110 action 'accept'
set firewall ipv4 name LOCAL-WAN rule 110 description 'Allow ICMP'
set firewall ipv4 name LOCAL-WAN rule 110 protocol 'icmp'

# WireGuard peers Proton and Site2
set firewall ipv4 name LOCAL-WAN rule 120 action 'accept'
set firewall ipv4 name LOCAL-WAN rule 120 description 'WireGuard Peers'
set firewall ipv4 name LOCAL-WAN rule 120 destination group address-group 'WG_PEERS'
set firewall ipv4 name LOCAL-WAN rule 120 destination port '51820'
set firewall ipv4 name LOCAL-WAN rule 120 protocol 'udp'

# Next DNS
set firewall ipv4 name LOCAL-WAN rule 130 action 'accept'
set firewall ipv4 name LOCAL-WAN rule 130 description 'DNS Servers'
set firewall ipv4 name LOCAL-WAN rule 130 destination group address-group 'DNS_SERVERS'
set firewall ipv4 name LOCAL-WAN rule 130 destination port '53'
set firewall ipv4 name LOCAL-WAN rule 130 protocol 'udp'
# Google NTP Servers
set firewall ipv4 name LOCAL-WAN rule 140 action 'accept'
set firewall ipv4 name LOCAL-WAN rule 140 description 'NTP Servers'
set firewall ipv4 name LOCAL-WAN rule 140 destination group address-group 'NTP_SERVERS'
set firewall ipv4 name LOCAL-WAN rule 140 destination port '123'
set firewall ipv4 name LOCAL-WAN rule 140 protocol 'udp'

# HTTP For Git and Upgrades
set firewall ipv4 name LOCAL-WAN rule 150 destination port '80,443'
set firewall ipv4 name LOCAL-WAN rule 150 protocol 'tcp'
set firewall ipv4 name LOCAL-WAN rule 150 action 'accept'

# WIFI -> WAN
set firewall ipv4 name WIFI-WAN default-action 'reject'
set firewall ipv4 name WIFI-WAN default-log
set firewall ipv4 name WIFI-WAN rule 100 action 'accept'
set firewall ipv4 name WIFI-WAN rule 100 description 'Allow all traffic to WAN'

# WIFI -> LOCAL
set firewall ipv4 name WIFI-LOCAL default-action 'reject'
set firewall ipv4 name WIFI-LOCAL default-log
set firewall ipv4 name WIFI-LOCAL rule 100 action 'accept'
set firewall ipv4 name WIFI-LOCAL rule 100 state 'established'
set firewall ipv4 name WIFI-LOCAL rule 100 state 'related'
set firewall ipv4 name WIFI-LOCAL rule 110 action 'reject'
set firewall ipv4 name WIFI-LOCAL rule 110 state 'invalid'
set firewall ipv4 name WIFI-LOCAL rule 120 action 'accept'
set firewall ipv4 name WIFI-LOCAL rule 120 description 'Accept traffic to local services'
set firewall ipv4 name WIFI-LOCAL rule 120 destination group port-group 'LOCAL_SERVICES'
set firewall ipv4 name WIFI-LOCAL rule 120 protocol 'tcp_udp'
set firewall ipv4 name WIFI-LOCAL rule 130 action 'accept'
set firewall ipv4 name WIFI-LOCAL rule 130 description 'SSH'
set firewall ipv4 name WIFI-LOCAL rule 130 destination port '22'
set firewall ipv4 name WIFI-LOCAL rule 130 protocol 'tcp'

# LOCAL -> WIFI
set firewall ipv4 name LOCAL-WIFI default-action 'reject'
set firewall ipv4 name LOCAL-WIFI default-log
set firewall ipv4 name LOCAL-WIFI rule 100 action 'accept'
set firewall ipv4 name LOCAL-WIFI rule 100 state 'established'
set firewall ipv4 name LOCAL-WIFI rule 100 state 'related'
set firewall ipv4 name LOCAL-WIFI rule 110 action 'reject'
set firewall ipv4 name LOCAL-WIFI rule 110 state 'invalid'
