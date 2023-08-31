#!/bin/zsh

set -eu

check() {
	eval $1 >/dev/null 2>&1 && echo 0 || echo 1
}

# install xcode
if [[ $(check "xcode-select -p") ]]
then
	echo "Xcode command line tools already installed"
else
	echo "Installing Xcode command line tools"
	xcode-select --install
fi

# install Homebrew
if [[ $(check "which brew") ]]
then
	echo "Homebrew already installed"
else
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew upgrade

# install Python
if [[ $(check "which python3") ]]
then
	echo "Python already installed"
else
	echo "Installing Python..."
	brew install python@3.11
fi

# install Ansible
if [[ $(check "which ansible") ]]
then
	echo "Ansible already installed"
else
	echo "Installing Ansible..."
	brew install ansible
fi

