#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Mysql\n\n"

execute "sudo mysql -e \"CREATE USER IF NOT EXISTS 'homestead'@'localhost' IDENTIFIED BY 'secret';\"" "create homestead user"
execute "sudo mysql -e \"GRANT ALL PRIVILEGES ON *.* TO 'homestead'@'localhost' WITH GRANT OPTION;\"" "grant all privileges to homestead user"

dir="nginx-vhosts"

for filePath in "$dir"/*;
do
    if [ -f "$filePath" ];then
        databaseName="$(sed -e "s/^${dir}\///" <<< $filePath)"
        databaseName="$(sed -e "s/.test//" <<< $databaseName)"
        execute "sudo mysql -e \"CREATE DATABASE IF NOT EXISTS $databaseName;\"" "create $databaseName database"
    fi
done