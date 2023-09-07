# OSX Setup

Automated OSX environment setup 🚀

## Setup

This installer assumes a brand new OSX environment. In fact, you don't even need `git` installed on your machine to run this installer. Assuming you've logged into GitHub and are reading this, simply copy the following in the default terminal:

```zsh
open -a Safari https://github.com/axelyung/osx-setup/archive/main.zip
until [ -f $HOME/Downloads/osx-setup-main/install ]; do sleep 1; done
open -a Terminal
cd $HOME/Downloads/osx-setup-main
. ./install
```

Follow the instructions as they appear. You'll be asked for your system password a number of times during the installation.

