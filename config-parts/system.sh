#!/bin/vbash

# Hostname
set system host-name '$host_system_host_name'

set system time-zone 'Australia/Sydney'

# System DNS set to NextDNS
set system name-server '76.76.2.159'
set system name-server '76.76.10.159'
set system name-server '2606:1a40:0:e:d4c0:9e70:4818:0'
set system name-server '2606:1a40:1:e:d4c0:9e70:4818:0'

# Device requires this baud rate
# Set in bootloader
#set system console device ttyS0 speed '115200'

# Set welcome banner
set system login banner post-login "$\n                __\n               / _)\n      _.----._/ /\n     /         /\n  __/ (  | (  | Its a UNIX System!\n /__.-.|_|--|_|    I know this!\n>"

# Vyos keys
set system login user vyos authentication public-keys SK_LAN_LOCAL key 'AAAAC3NzaC1lZDI1NTE5AAAAIFWqGuDHjHW4DBzhvM1Zcww8fvDLZF3Wm+tyHIIXreJJ'
set system login user vyos authentication public-keys SK_LAN_LOCAL type 'ssh-ed25519'
set system login user vyos authentication public-keys YUBIKEY key 'AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIPOc+bvxJXokMvERTNCNj51vmmIdaL5zXjlw2m1NxPS3AAAAGHNzaDptYXJrLmhhaGxAc2lnYWludC5hdQ=='
set system login user vyos authentication public-keys YUBIKEY type 'sk-ssh-ed25519@openssh.com'

#set system login user vyos authentication encrypted-password $secret_system_encrypted_password
#set system login user vyos authentication encrypted-password '$6$rounds=656000$F98QG6us9c1OnAKx$an9CB8zjmwlnRdTKC7yp62kq1OSBu.fB6gyoYGjp4AcPduKCuM3.EL6dSUpsbscsSFf1pjjngKCUZZoEFTvsB0'


# User for myself
set system login user mhahl authentication public-keys SK_LAN_LOCAL key 'AAAAC3NzaC1lZDI1NTE5AAAAIFWqGuDHjHW4DBzhvM1Zcww8fvDLZF3Wm+tyHIIXreJJ'
set system login user mhahl authentication public-keys SK_LAN_LOCAL type 'ssh-ed25519'
set system login user mhahl authentication public-keys YUBIKEY key 'AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIPOc+bvxJXokMvERTNCNj51vmmIdaL5zXjlw2m1NxPS3AAAAGHNzaDptYXJrLmhhaGxAc2lnYWludC5hdQ=='
set system login user mhahl authentication public-keys YUBIKEY type 'sk-ssh-ed25519@openssh.com'
set system login user mhahl full-name "Mark Hahl"

# Conntrack modules
set system conntrack modules ftp
set system conntrack modules h323
set system conntrack modules nfs
set system conntrack modules pptp
set system conntrack modules sip
set system conntrack modules sqlnet
set system conntrack modules tftp