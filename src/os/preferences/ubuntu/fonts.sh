#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Fonts\n\n"

mkd "~/.fonts/"

if [ ! -f ~/.cache/icon-cache.kcache ]; then
    execute "rm ~/.cache/icon-cache.kcache" "clean icons cache"
fi

if [ ! -f ~/.fonts/Hack_regular_nerd_font_complete.ttf ]; then
    execute "wget -O ~/.fonts/Hack_regular_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf" "installing Hack font"
fi

execute "mkdir -p ~/.fonts" "make fonts dir"
execute "wget https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Bold.ttf -O ~/.fonts/FiraCode-Bold.ttf" "download Fira Code Bold"
execute "wget https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Light.ttf -O ~/.fonts/FiraCode-Light.ttf" "download Fira Code Light"
execute "wget https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Medium.ttf -O ~/.fonts/FiraCode-Medium.ttf" "download Fira Code Medium"
execute "wget https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Regular.ttf -O ~/.fonts/FiraCode-Regular.ttf" "download Fira Code Regular"
execute "wget https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Retina.ttf -O ~/.fonts/FiraCode-Retina.ttf" "download Fira Code Retina"
execute "fc-cache -v"
