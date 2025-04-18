#!/bin/vbash

# Allow NTP from all addresses
set service ntp allow-client address '0.0.0.0/0'
set service ntp allow-client address '::/0'

# Set the NTP servers to google.
set service ntp server time1.google.com
set service ntp server time2.google.com
set service ntp server time3.google.com