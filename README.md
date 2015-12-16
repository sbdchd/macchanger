# macchanger

A Bash implimentation of a MAC address changer.

Based off [acrogenesis](https://github.com/acrogenesis/macchanger)' ruby implimentation.


## Usage

```
usage: macchanger [options] [device]

options:
-m, --mac MAC             Set the MAC address,    macchanger -m XX:XX:XX:XX:XX:XX en0
-r, --random              Set random MAC address, macchanger -r en0
-s, --show                Show the MAC address,   macchanger -s en0
```

## Setup

Homebrew

```
brew install sbdchd/macchanger/macchanger
```
