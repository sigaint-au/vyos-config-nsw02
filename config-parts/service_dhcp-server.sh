#!/bin/vbash

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 option default-router '10.130.0.1'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 option domain-name 'sigaint.au'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 subnet-id '1'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 option name-server '45.90.28.189'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 option name-server '45.90.30.189'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 range 0 start '10.130.0.100'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 range 0 stop '10.130.0.200'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping blueiris ip-address '10.130.1.3'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping blueiris mac 'AC:E2:D3:0B:7A:60'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping plex ip-address '10.130.1.4'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping plex mac '10:62:e5:00:9f:55'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping qnap-1a ip-address '10.130.1.1'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping qnap-1a mac '00:08:9B:F1:D1:82'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping tesla-charger  ip-address '10.130.1.2'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping tesla-charger mac '98:ED:5C:CA:CC:60'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping tplink-sw1 ip-address '10.130.1.250'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping tplink-sw1 mac 'f0:09:0d:78:1e:c1'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping example-pc ip-address '10.130.99.99'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping example-pc mac 'f0:09:0d:78:99:99'
