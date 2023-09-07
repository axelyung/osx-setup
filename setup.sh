#!/bin/zsh

set -e

end="\033[0m"
green="\033[0;32m"
blue="\033[0;34m"

green() {
  echo -e "${green}${1}${end}"
  echo
}

blue() {
  echo -e "${blue}${1}${end}"
  echo
}

# ====================
# Prompt
# ====================

echo
echo "This guided installer is meant to quickly setup a new OSX environment. 💻"
echo
echo "We'll be installing a number of SDKs as well as recommended desktop productivity apps."
echo
read "?Press any key to continue..."
echo

# ====================
# Xcode
# ====================
if ! xcode-select --print-path &> /dev/null; then
	blue "Please follow the native prompt to install the command line developer tools..."
	xcode-select --install &> /dev/null
fi

# wait until installation has finished.
until $(xcode-select --print-path &> /dev/null); do
  sleep 1;
done

green "Xcode command line tools installed 🛠️"

# ====================
# Homebrew
# ====================

if [ ! -d "/opt/homebrew" ]; then
	blue "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

green "Homebrew installed 🍺"


# ====================
# Ansible
# ====================

# add python to PATH
PATH="$HOME/Library/Python/3.9/bin:$PATH"

if ! which ansible &> /dev/null; then
	blue "Installing Ansible..."
	pip3 install --force-reinstall ansible
fi

green "Ansible installed 🤖"

ansible-galaxy install -r requirements.yml
green "Ansible dependencies installed 📚"

blue "Ansible will now ask you for a \"BECOME\" password. Please enter your system password. 🔒"
ansible-playbook --ask-become-pass main.yml
