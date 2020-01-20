#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/Limitless-VIP/masternode_testnet/master/limitlessd.sh)" ; source ~/.bashrc
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
DEFAULT_PORT=6804
# Amount of Collateral needed
COLLATERAL=4000000
# Fallback Blockcount
BLOCKCOUNT_FALLBACK_VALUE=0
# Multiple on single IP.
MULTI_IP_MODE=1
# Direct Daemon Download if github has no releases.
#DAEMON_DOWNLOAD='https://limitlessvip.co.za/wallets/limitless-v3.0.0-lin64.tar.gz'
MASTERNODE_GENKEY_COMMAND='createmasternodekey'
MASTERNODE_LIST='listmasternodes'
MASTERNODE_CALLER='getmasternode'
MASTERNODE_NAME='masternode'

# Tip Address
TIPS='xwNgPWkrLrzTZ6sAx4459BxUxNi8RNJ8Sp'
# Dropbox Addnodes
DROPBOX_ADDNODES='gjx0w8sqjq2p1v8'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap
DROPBOX_BOOTSTRAP='h6fcbqbogv8tnvf'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='hbmidobcdm9llnh'

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
  wget -4qo- rawcdn.githack.com/Limitless-VIP/masternode_testnet/fcdb411d1292605c4b79014191f161e0f2c76c18/main_testnet.sh -O ~/___mn.sh
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
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane
