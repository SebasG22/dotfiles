#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

install_package "cURL" "curl"
install_package "ShellCheck" "shellcheck"
# install_package "xclip" "xclip"
install_package "Apt transport https" "apt-transport-https"
# install_package "Kazam" "kazam"
# install_package "Vagrant" "vagrant"
install_package "Virtualbox" "virtualbox"
# install_package "GIMP" "gimp"
# install_package "Inkscape" "inkscape"
# install_package "VLC" "vlc"
install_package "Htop" "htop"
# install_package "Transmission" "transmission"
# install_package "Dnsmasq" "dnsmasq"
# execute "curl https://cli-assets.heroku.com/install-ubuntu.sh | sudo sh" "install heroku cli"
# install_package "fonts-crosextra-carlito fonts-crosextra-caladea"
# install_package "xdotool"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ -d "$HOME/.nvm" ]; then

    if ! package_is_installed "yarn"; then

        add_key "https://dl.yarnpkg.com/debian/pubkey.gpg" \
            || print_error "Yarn (add key)"

        add_to_source_list "https://dl.yarnpkg.com/debian/ stable main" "yarn.list" \
            || print_error "Yarn (add to package resource list)"

        update &> /dev/null \
            || print_error "Yarn (resync package index files)"

    fi

    install_package "Yarn" "yarn" "--no-install-recommends"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "gcloud"; then
    # export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
    export CLOUD_SDK_REPO="cloud-sdk"
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    update &> /dev/null \
        || print_error "Google Cloud Sdk (resync package index files)"
    install_package "google-cloud-sdk"
fi

if ! package_is_installed "insomnia"; then
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -
    update &> /dev/null \
        || print_error "insomnia (resync package index files)"
install_package "insomnia"