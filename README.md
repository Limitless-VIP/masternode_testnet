
Copyright (c)
All rights reserved.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

What the Masternode Script does:
- Works on Ubuntu 16.04, 18.04, or 18.10 (better chance of working on any VPS).
- Allows for multiple masternodes on one IP (configurable if not desired).
- The masternode doesn't run as the root user (more secure).
- Daemon will auto update to the latest github release (less chaos around wallet updates).
- Auto updating of ubuntu security packages.
- Swap added to VPS if VPS allows it.
- Uses systemd to register the masternode as a service that auto starts.
- Uses denyhosts to block bad SSH attempts to login.
- Verifies the collateral on the block explorer.
- Auto configures the masternode daemon.
- Has quick sync functionality to get masternodes up and running quickly.
- Ends with a mini monitor that'll let the end user know it started correctly.

# Installation
```bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/Limitless-VIP/masternode_testnet/master/limitlessd.sh)" ; source ~/.bashrc```
