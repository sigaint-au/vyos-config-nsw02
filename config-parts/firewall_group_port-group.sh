#!/bin/vbash

# HTTP Ports
set firewall group port-group HTTP_PORTS port '80'
set firewall group port-group HTTP_PORTS port '443'

set firewall group port-group LOCAL_SERVICES port '3128'
set firewall group port-group LOCAL_SERVICES port '123'
set firewall group port-group LOCAL_SERVICES port '53'