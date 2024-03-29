#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

./build-essentials.sh

./git.sh
./../nvm.sh
./browsers.sh
./compression_tools.sh
./fonts.sh
./misc_tools.sh
./../npm.sh
./code-editors.sh
./vim.sh
./zsh.sh

./cleanup.sh
