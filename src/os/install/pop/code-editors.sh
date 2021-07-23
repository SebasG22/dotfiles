#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Code Editors\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "code"; then

    execute "curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg"
    execute "sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/"
    execute "sudo sh -c 'echo \"deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main\" > /etc/apt/sources.list.d/vscode.list'"

    update &> /dev/null \
        || print_error "VS Code (resync package index files)"

fi

install_package "VS Code" "code"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "code --install-extension durzn.brackethighlighter" "install brackethighlighter vscode extension"
execute "code --install-extension viablelab.bracket-padder" "install bracket-padder vscode extension"
execute "code --install-extension Angular.ng-template" "install ng-template vscode extention"
execute "code --install-extension mikestead.dotenv" "install dotenv vscode extention"
execute "code --install-extension eamodio.gitlens" "install gitlens vscode extention"
execute "code --install-extension graphql.vscode-graphql" "install graphql vscode extention"
execute "code --install-extension esbenp.prettier-vscode" "install prettier vscode extention"
execute "code --install-extension wallabyjs.quokka-vscode" "install quokka vscode extention"
execute "code --install-extension ms-vscode-remote.remote-ssh" "install remote-ssh vscode extention"
execute "code --install-extension ms-vscode-remote.remote-ssh-edit" "install remote-ssh-edit vscode extention"
execute "code --install-extension mtxr.sqltools" "install sqltools vscode extention"
execute "code --install-extension mtxr.sqltools-driver-pg" "install sqltools-pg-driver vscode extention"
execute "code --install-extension ms-azuretools.vscode-docker" "install docker vscode extention"
execute "code --install-extension daylerees.rainglow" "install rainglow vscode extention"
execute "code --install-extension vscode-icons-team.vscode-icons" "install vscode-icons vscode extention"
execute "code --install-extension patbenatar.advanced-new-file" "install advanced-new-file vscode extention"
execute "code --install-extension sleistner.vscode-fileutils" "install vscode-fileutils vscode extention"
execute "code --install-extension streetsidesoftware.code-spell-checker" "install code-spell-checker vscode extention"
execute "code --install-extension streetsidesoftware.code-spell-checker-spanish" "install code-spell-checker-spanish vscode extention"
execute "code --install-extension nrwl.angular-console" "install nx console extention"
execute "code --install-extension dbaeumer.vscode-eslint" "install eslint extention"
execute "code --install-extension bradlc.vscode-tailwindcss" "install tailwindcss intellisence extention"


execute "cp ../../../shell/vscode-settings.json ~/.config/Code/User/settings.json" "copy vscode user settings"
# execute "cp ../../../shell/vscode-keybindings.json ~/.config/Code/User/keybindings.json" "copy vscode user keybindings"
mkd "~/.config/Code/User/snippets"
execute "cp ../../../shell/vscode-doc-block-author.code-snippets ~/.config/Code/User/snippets/doc-block-author.code-snippets" "copy vscode snippets"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "sublime-text"; then

   add_key "https://download.sublimetext.com/sublimehq-pub.gpg" \
       || print_error "Sublime Text 3 (add key)"

   add_to_source_list "https://download.sublimetext.com/ apt/stable/" "sublime-text.list" \
       || print_error "Sublime Text 3 (add to package resource list)"

   update &> /dev/null \
       || print_error "Sublime Text 3 (resync package index files)"

fi

#install_package "Sublime Text 3 code editor" "sublime-text"
