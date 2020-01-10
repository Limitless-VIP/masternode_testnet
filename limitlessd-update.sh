#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/Limitless-VIP/masternode/master/limitlessd-update.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='Limitless-VIP/Limitless'
# Display Name.
DAEMON_NAME='Limitless Core'
# Coin Ticker.
TICKER='VIP'
# Binary base name.
BIN_BASE='limitless'
# Directory.
DIRECTORY='.Limitless'
# Conf File.
CONF='limitless.conf'
# Port.
DEFAULT_PORT=8007
# Amount of Collateral needed
COLLATERAL=4000000
# Fallback Blockcount
BLOCKCOUNT_FALLBACK_VALUE=0
# Multiple on single IP.
MULTI_IP_MODE=1
# Direct Daemon Download if github has no releases.
#DAEMON_DOWNLOAD='https://limitlessvip.co.za/wallets/limitless-v3.0.0-lin64.tar.gz'
# Daemon can use IPv4.
IPV4=1
# Daemon can use IPv6.
IPV6=0
# Daemon can use TOR.
TOR=0

# Tip Address
TIPS='UYFEvLMguJaLDXAZPtynAPKWC3hWh6vXKY'
# Dropbox Addnodes
DROPBOX_ADDNODES='9z0sxgdwt4i34lj'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap
DROPBOX_BOOTSTRAP='rm4iv5tsulu3wz4'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='3fbov51cxnn36mn'

# Mini Monitor check masternode list.
MINI_MONITOR_MN_LIST=1
# Mini Monitor Status to check for.
MINI_MONITOR_MN_STATUS='4'
# Mini Monitor masternode count is a json string.
MINI_MONITOR_MN_COUNT_JSON=1

ASCII_ART () {
echo -e "\\e[0m"
clear 2> /dev/null
cat << "LIMITLESS"

#                                                    
#       # #    # # ##### #      ######  ####   ####  
#       # ##  ## #   #   #      #      #      #      
#       # # ## # #   #   #      #####   ####   ####  
#       # #    # #   #   #      #           #      # 
#       # #    # #   #   #      #      #    # #    # 
####### # #    # #   #   ###### ######  ####   ####

LIMITLESS
}

cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- rawcdn.githack.com/Limitless-VIP/masternode/ecd398ddad8ccce963fe6e07facc94691f52df77/main.sh -O ~/___mn.sh
  COUNTER=$((COUNTER+1))
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
rm -rf /var/multi-masternode-data/limitless/
UPDATE_DAEMON_ADD_CRON "${BIN_BASE}" "${GITHUB_REPO}" "${CONF_FILE}" "${DAEMON_DOWNLOAD}" "${DIRECTORY}" "${DROPBOX_ADDNODES}" "${DROPBOX_BOOTSTRAP}" "${DROPBOX_BLOCKS_N_CHAINS}"
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane



