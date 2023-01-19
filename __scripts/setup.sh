j!/bin/bash
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
        sudo softwareupdate -ir

        # install brew if not exist
        if ! test $(which brew); then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew doctor
        brew upgrade
    else 
        echo "Unsupported OS!"
        exit 1
    fi
}

# Install appropriate packages for Arch Linux
function install_arch() {
    # misc:
        # ping, traceroute, ip (iproute2mac)
        # scp, sftp, nordvpn

        # xdg-ninja

        # tldr
        # cheat.sh 
        # license (nishanths/license)


        # c / c++
        #     gcc / g++ 
        #     gdb 
        #     clang (=> clangd, clang-format, lldb)
        #     make, cmake
         
        # haskell
        #     ghcup (=> ghc, cabal, hls, floskell) 
         
        # python
        #     pyenv (manage python versions)
        #     pip3, python3 (=> black)
        #     poetry
        #     miniconda 
         
        # typescript & javascript
        #     nvm (installed by fish)
        #     node 
        #     yarn
        #     npm
        #     (=> prettier)
         
        # rust
        #     rustup (=> rust, cargo, stylua)
        # go
        # perl
        # lua
        # bash 
        #     shellcheck
     
        # SETUP
        #     - pip3 install pynvim
        #     - npm i -g neovim
         
        # LSP
        #     - cargo install asm-lsp
        #
        #     - lua: https://github.com/sumneko/lua-language-server
        #     - clangd: 
        #     - pip install cmake-language-server
        #     - hls: https://github.com/haskell/haskell-language-server
        #
        #     - npm i -g bash-language-server
        #         - yay -S shellcheck
        #     - npm i -g vscode-langservers-extracted
        #     - npm i -g yaml-language-server
        #     - npm i -g @ansible/ansible-language-server
        #     - npm i -g dockerfile-language-server-nodejs
        #     - npm i -g typescript typescript-language-server
        #     - npm i -g pyright
}

# Install appropriate packages for MacOS
function install_osx() {
    # subscription based apps from SetApp:
        # devutils, tableplus, 
        # margin note 3
        # Gemini, Yoink, CleanShotX, Elmedia player

    brew update
    brew tap homebrew/services

    # Homebrew casks (GUI apps)
    # yabai and skhd 
    # spacebar, simple-bar (ubersicht), simple-bar-lite (ubsersicht), 
    brew install --cask \ 
        ubsersicht  raycast \ 
        firefox min tor-browser \
        zoom slack discord element \ 
        fantastical cardhop \
        notion obsidian zotero microsoft-office \
        kitty visual-studio-code imsonia tableau \
        mactex-no-gui \
        figma gimp obs kdenlive \ 
        balenaetcher utm \
        aldente  vorta \ 
        kindle google-drive webull nordvpn

    # Mac App Store applications
    brew install mas
        appcleaner
        keka
        amphetamine
        utorrent-web

    # Homebrew formulas
    brew install \
        tmux bash fish terminal-notifier\
        gnu-sed gawk grep \
        rg fzf fd jq \
        exa duf bat highlight delta \
        zip unzip gzip gnu-tar curl wget \
        iproute2mac nmap netcat \
        gnupg openssh rsync \
        rmlint borgbackup \
        neofetch htop procs hyperfine \
        git git-lfs gh lazygit \
        vim neovim \
        nnn imagegick viu \
        pandoc ffmpeg \

        podman consul vault nomad terraform \
        awscli aws-vault \
    brew tap wallix/awless; brew install awless
}

# Remove & create symlinks to config folders
function remove_configs() {
}
function create_symlinks() {
    # ~/.config/: 
        # kitty, fish, htop, nnn, ncmpcpp, nvim 
    dirs=(dir1 dir2 etc)       
    for dir in "${dirs[@]}"; do    
        ln -s "$HOME/Dotfiles/$dir" "$HOME/.config/$dir"    
    done

    # ~/: 
        # tmux, bash, gitconfigs, vim
}

# Main
detect_os

