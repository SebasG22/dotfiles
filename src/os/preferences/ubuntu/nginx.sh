#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Nginx\n\n"

HOST=hostname
dir="nginx-vhosts"

for filePath in "$dir"/*;
do
    if [ -f "$filePath" ];then
        fileName="$(sed -e "s/^${dir}\///" <<< $filePath)"
        targetPath="/etc/nginx/sites-enabled/$fileName"

        # check if file exists
        if [ ! \( -e "${targetPath}" \) ];then
            execute "sudo ln -fs $PWD/$filePath $targetPath" "symb-link $PWD/$fileName to sites-enabled"
        fi
        
        if ! grep -q "address=/$fileName/127.0.0.1" /etc/dnsmasq.conf; then
            execute "echo \"address=/$fileName/127.0.0.1\" | sudo tee -a /etc/dnsmasq.conf" "add $fileName to dnsmasq.conf"
        fi
    fi
done

systemdResolvedStatus=$(systemctl show -p SubState --value system-resolved);

if [ $systemdResolvedStatus == 'running' ] || [ $systemdResolvedStatus == 'active' ]; then
    execute "sudo systemctl disable systemd-resolved && sudo systemctl stop systemd-resolved" "disable systemd-resolved"
fi

if [ \( -e "/etc/resolv.conf" \) ]; then
    execute "sudo rm /etc/resolv.conf" "remove /etc/resolv.conf file"
fi

execute "echo -e \"$HOST 8.8.8.8\n$HOST 127.0.0.1\" | sudo tee /etc/resolv.conf" "set new /etc/resolv.conf"
execute "sudo service nginx restart" "restart nginx"
execute "sudo service dnsmasq restart" "restart dnsmasq"