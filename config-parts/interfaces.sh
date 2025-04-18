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
set interfaces pppoe pppoe0 description 'NET_NSW02_MGMT'
set interfaces pppoe pppoe0 authentication password "$secret_ppoe_password"
set interfaces pppoe pppoe0 authentication username "$secret_ppoe_username"
set interfaces pppoe pppoe0 ip adjust-mss 'clamp-mss-to-pmtu'
set interfaces pppoe pppoe0 mtu '1492'
set interfaces pppoe pppoe0 source-interface 'eth0'

set interfaces pppoe pppoe0 authentication password 'dodointernet'
set interfaces pppoe pppoe0 authentication username 'philip.aubin@gmail.com'
set interfaces pppoe pppoe0 ip adjust-mss 'clamp-mss-to-pmtu'
set interfaces pppoe pppoe0 mtu '1492'
set interfaces pppoe pppoe0 source-interface 'eth0'


set interfaces ethernet pppoe0 dhcpv6-options pd 0 interface eth1 address '1'
set interfaces ethernet pppoe0 dhcpv6-options pd 0 interface eth1 sla-id '0'

set interfaces ethernet pppoe0 dhcpv6-options pd 0 length '48'
set interfaces ethernet pppoe0 dhcpv6-options rapid-commit
set interfaces ethernet pppoe0 ipv6 address autoconf
