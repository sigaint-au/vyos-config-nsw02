#!/bin/vbash

## Define NAT rules
#

set nat destination rule 10 description "Port Forward Plex"
set nat destination rule 10 destination port "32400"
set nat destination rule 10 inbound-interface name "pppoe0"
set nat destination rule 10 protocol "tcp_udp"
set nat destination rule 10 translation address "10.130.1.4"
set nat destination rule 10 translation port "32400"

set nat source rule 50 outbound-interface name 'pppoe0'
set nat source rule 50 source address '10.130.0.0/16'
set nat source rule 50 translation address 'masquerade'
