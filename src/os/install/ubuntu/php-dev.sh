#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PHP Dev\n\n"

install_package "python-software-properties"

if ! package_is_installed "php7.0"; then

    add_ppa "ondrej/php" \
        || print_error "PHP (add PPA)"

    update &> /dev/null \
        || print_error "PHP (resync package index files)"

fi

install_package "Nginx" "nginx"

execute "sudo apt install --allow-unauthenticated -qqy php5.6 php7.0 php7.1 php7.2 php7.3 'php.*-fpm' 'php.*-cli' 'php.*-sqlite3' 'php.*-common' 'php.*-curl' 'php.*-gd' 'php.*-json' 'php.*-mbstring' 'php.*-mysql' 'php.*-readline' 'php.*-xml' 'php.*-bcmath' 'php.*-gmp' 'php.*-intl' 'php.*-zip' zip unzip sqlite3 libsqlite3-dev" "install php 5.6, 7.0, 7.1, 7.2 and 7.3"

install_package "Composer" "composer"

execute "composer global require codeception/codeception flow/jsonpath codeception/mockery-module squizlabs/php_codesniffer greynoise-design/laravel-coding-standard laravel/installer laravel/envoy" "install global composer  packages"

install_package "Supervisor" "supervisor"
install_package "Mysql Server" "mysql-server"
