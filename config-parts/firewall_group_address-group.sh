#!/bin/vbash

####
## DNS Servers
##
set firewall group address-group DNS_SERVERS address '76.76.2.159'
set firewall group address-group DNS_SERVERS address '76.76.10.159'
set firewall group ipv6-address-group DNS_SERVERS_6 address '2606:1a40:0:e:d4c0:9e70:4818:0'
set firewall group ipv6-address-group DNS_SERVERS_6 address '2606:1a40:1:e:d4c0:9e70:4818:0'

####
## WireGuard Peers
##
#
set firewall group address-group WG_PEERS address '103.214.222.109' # nsw01
set firewall group address-group WG_PEERS address '58.178.25.160'   # nsw02

# Proton IPv6
# Second Site Ipv6
#
set firewall group ipv6-address-group WG_PEERS_6 address '2401:d002:7800::720'
set firewall group ipv6-address-group WG_PEERS_6 address '2a02:6ea0:1703:3087::10'

##
# time1.google.com
# time2.google.com
# time3.google.com
#
set firewall group address-group NTP_SERVERS address '216.239.35.0'
set firewall group address-group NTP_SERVERS address '216.239.35.4'
set firewall group address-group NTP_SERVERS address '216.239.35.8'
set firewall group ipv6-address-group NTP_SERVERS_6 address '2001:4860:4806::'
set firewall group ipv6-address-group NTP_SERVERS_6 address '2001:4860:4806:4::'
set firewall group ipv6-address-group NTP_SERVERS_6 address '2001:4860:4806:8::'
