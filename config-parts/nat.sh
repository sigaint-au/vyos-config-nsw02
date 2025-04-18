#!/bin/vbash

## Define NAT rules
#
set nat source rule 50 outbound-interface name 'pppoe0'
set nat source rule 50 source address '10.130.0.0/16'
set nat source rule 50 translation address 'masquerade'
