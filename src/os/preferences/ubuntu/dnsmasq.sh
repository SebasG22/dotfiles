#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Dnsmasq\n\n"

if ! grep -q "listen-address=127.0.0.1" /etc/dnsmasq.conf; then
    execute "sudo tee -a /etc/dnsmasq.conf << ENDdm
interface=lo
bind-interfaces
listen-address=127.0.0.1
# DNS server from OpenDns. Use yours...
server=208.67.222.222
server=208.67.220.220
ENDdm" "setting up dnsmasq.conf"
fi


execute "sudo systemctl restart dnsmasq" "restart dnsmasq"
execute "sudo systemctl enable dnsmasq" "enable dnsmasq"
NetManProfile="$(nmcli -t -f uuid connection show --active | cut -f 01 -d ':')"
execute "nmcli con mod \"$NetManProfile\" ipv4.dns \"\"" "remove, if exists, current dns servers"
execute "nmcli con mod \"$NetManProfile\" ipv4.ignore-auto-dns yes" "set dnsmasq as dns server"
execute "nmcli con mod \"$NetManProfile\" ipv4.dns 127.0.0.1" "set 'manual' dns server"
execute "nmcli connection down \"$NetManProfile\"" "reconnect to take effect"
execute "nmcli connection up \"$NetManProfile\"" "reconnect to take effect"
