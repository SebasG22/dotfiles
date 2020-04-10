#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./dnsmasq.sh
./nginx.sh
./mysql.sh
./fonts.sh
./misc.sh
