#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_ppa "universe"

update
upgrade

./build-essentials.sh
./git.sh
./../nvm.sh
./browsers.sh
#./compression_tools.sh
#./image_tools.sh
./misc_tools.sh
./../npm.sh
./code-editors.sh
./zsh.sh
#./php-dev.sh
./cleanup.sh
