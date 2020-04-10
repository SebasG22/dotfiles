#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   ZSH\n\n"

install_package "ZSH" "zsh"

#if ! package_is_installed "zsh"; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#fi

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
    execute "git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k" "installing powerlevel9k"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/git-flow-completion ]; then
    execute "git clone https://github.com/bobthecow/git-flow-completion ~/.oh-my-zsh/custom/plugins/git-flow-completion" "make zsh git flow compatible"
fi
