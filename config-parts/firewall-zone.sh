set firewall zone LOCAL default-action 'reject'
set firewall zone LOCAL default-log
set firewall zone LOCAL description 'Local zone'
#set firewall zone LOCAL from WAN firewall ipv6-name 'WAN-LOCAL-6'
#set firewall zone LOCAL from WIFI firewall ipv6-name 'WIFI-LOCAL-6'
set firewall zone LOCAL from WAN firewall name 'WAN-LOCAL'
set firewall zone LOCAL from WIFI firewall name 'WIFI-LOCAL'
set firewall zone LOCAL local-zone

set firewall zone WIFI default-action 'reject'
set firewall zone WIFI default-log
set firewall zone WIFI description 'WIFI zone'
set firewall zone WIFI from WAN firewall name 'WAN-WIFI'
#set firewall zone WIFI from WAN firewall ipv6-name 'WAN-WIFI-6'
set firewall zone WIFI from LOCAL firewall name 'LOCAL-WIFI'
#set firewall zone WIFI from LOCAL firewall ipv6-name 'LOCAL-WIFI-6'
set firewall zone WIFI member interface 'eth1'

set firewall zone WAN default-action 'reject'
set firewall zone WAN default-log
set firewall zone WAN description 'The Internet'
set firewall zone WAN from LOCAL firewall name 'LOCAL-WAN'
#set firewall zone WAN from LOCAL firewall ipv6-name 'LOCAL-WAN-6'
set firewall zone WAN from WIFI firewall name 'WIFI-WAN'
#set firewall zone WAN from WIFI firewall ipv6-name 'WIFI-WAN-6'
set firewall zone WAN member interface 'pppoe0'
