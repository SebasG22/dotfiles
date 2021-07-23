#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "brave-browser"; then

    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - \
        || print_error "Chrome Canary (add key)"

    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

 sudo apt update

sudo apt install brave-browser

fi

if ! package_is_installed "google-chrome-unstable"; then

   add_key "https://dl-ssl.google.com/linux/linux_signing_key.pub" \
       || print_error "Chrome Canary (add key)"

   add_to_source_list "[arch=amd64] https://dl.google.com/linux/deb/ stable main" "google-chrome.list" \
       || print_error "Chrome Canary (add to package resource list)"

   update &> /dev/null \
       || print_error "Chrome Canary (resync package index files)"

fi

# install_package "Chrome Canary" "google-chrome-unstable"
# install_package "Chrome Stable" "google-chrome-stable"
# install_package "Chromium" "chromium-browser"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

if ! package_is_installed "firefox-trunk"; then

   add_ppa "ubuntu-mozilla-daily/ppa" \
       || print_error "Firefox Nightly (add PPA)"

   update &> /dev/null \
       || print_error "Firefox Nightly (resync package index files)"

fi

# install_package "Firefox Stable" "firefox"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#printf "\n"

# install_package "Flash" "flashplugin-installer"
