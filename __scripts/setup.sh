#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Detect OS 
function detect_os() {
    OS=$(uname -a)

    if [[  $OS =~ Darwin* ]]; then 
        # install xcode cli tools if not exists
        if ! test -d $(xcode-select -p); then 
            xcode-select --install
        fi
        # sudo softwareupdate -ir

        # install brew if not exist
        if ! test $(which brew); then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        # brew upgrade

        INSTALL='brew'
    elif [[ $OS =~ Linux* ]]; then 
        # install yay if not exist
        if ! test $(which yay); then
            git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
            cd .. & rm -rf yay
        fi
        # pacman -Syu

        INSTALL='pacman'
        INSTALL_AUR='yay'
    else 
        echo "Unsupported OS!"
        exit 1
    fi
}

# Install appropriate packages by reading .txt files
function install_osx() {
    echo "hi this is on mac"
}
function install_arch_linux() {
    echo "hi this is on linux"
}

# Main
detect_os
