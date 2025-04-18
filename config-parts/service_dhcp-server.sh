#!/bin/vbash

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 default-router '10.130.0.1'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 domain-name 'sigaint.au'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 name-server '45.90.28.189'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 name-server '45.90.30.189'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 range 0 start '10.130.0.100'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 range 0 stop '10.130.0.200'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping BLUEIRIS ip-address '10.130.1.3'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping BLUEIRIS mac-address 'AC:E2:D3:0B:7A:60'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping JELLYFIN ip-address '10.130.1.4'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping JELLYFIN mac-address '10:62:e5:00:9f:55'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping QNAP_1A ip-address '10.130.1.1'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping QNAP_1A mac-address '00:08:9B:F1:D1:82'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping TESLA_CHARGER ip-address '10.130.1.2'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping TESLA_CHARGER mac-address '98:ED:5C:CA:CC:60'

set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping TL_SG116E ip-address '10.130.1.250'
set service dhcp-server shared-network-name NEWCASTLE subnet 10.130.0.0/16 static-mapping TL_SG116E mac-address 'f0:09:0d:78:1e:c1'