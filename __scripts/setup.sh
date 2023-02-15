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
    elif [[ $OS =~ ]]; then
        # perform system upgrade
        pacman -Syu

        # install yay if not exist
        if ! test $(which yay); then 
            mkdir temp && cd temp
            git clone https://aur.archlinux.org/yay-git.git
            chown -R sung:sung ./yay-git
            cd yay-git
            makepkg -si
        fi
    else 
        echo "Unsupported OS!"
        exit 1
    fi
}

# Install appropriate packages for Arch Linux
function install_arch() {
    # display server & desktop environment
    xorg 
    sddm 
    plasma-desktop bismuth picom
    powerdevil
    ewww rofi dunst

    # apps & tools
    tableau

    yay -S 
        discord slack-desktop zoom
        firefox firefox-developer-edition tor
        thunderbird 
        python-gpgme dropbox dolphin-plugins dolphin
        onlyoffice-bin okular
        zotero obsidian ticktick
        insomnia figma-linux
        feh mpv
        spectacle gimp kdenlive obs-studio
        spotify zenity ffmpeg4.4

        wine wine-mono wine-gecko
            # wine for kakaotalk
        $ sudo pacman -S --asdeps --needed $(pacman -Si wine | sed -n '/^Opt/,/^Conf/p' | sed '$d' | sed 's/^Opt.*://g' | sed 's/^\s*//g' | tr '\n' ' ')
            # optional dependencies

        nerd-fonts-complete
        wezterm
        tmux zsh starhsip
        fzf ripgrep the_silver_searcher fd jq
        exa duf bat highlight git-delta zoxide

        procs htop pfetch
        nnn imagemagick
        xdg-ninja
        zip unzip gzip tar
        curl wget
        ping traceroute ip nmap ncat netstat nftables
        gnupg2 openssh sftp rsync qbittorrent
        testdisk safecopy
        pass hyperfine rmlint
        ffmpeg
        ventoy
        tldr cheat.sh
        neovim vscodium zathura
            # on x11, need 'xclip' for copy & paste in neovim
            # on wayland, 'wl-copy, wl-paste'
        github-cli lazygit
        pandoc texlive-most texlive-bibtexextra
        licenses
        borg vorta

        postgresql pgadmin4

        docker docker-compose
        kubectl helm
        kubeadm kind

        aws-cli-v2 aws-vault awless
        terraform 

        # for coding / neovim 
        gcc gdb clang lldb cmake # clangd, clang-format, lldb
        miniconda3 
        # nvm (managed by zsh), prettier

    # manual installation
    # go (gvm)
    zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

    # haskell (ghcup => ghc, cabal, hls, floskell)
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

    # rust (rustup => rust, cargo, asm-lsp)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # post configuration (for neovim)
    pip install pynvim
    npm i -g neovim

    lua: https://github.com/sumneko/lua-language-server
    pip install cmake-language-server

    cargo install asm-lsp
    yay -S shellcheck
    npm i -g bash-language-server
    npm i -g vscode-langservers-extracted
    npm i -g yaml-language-server
    npm i -g @ansible/ansible-language-server
    npm i -g dockerfile-language-server-nodejs
    npm i -g typescript typescript-language-server
    npm i -g pyright
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
    # compare if files are different; if same, do nothing; else recreate symlink
    if diff file1 file2 > /dev/null
    then
        echo "no difference"
    else
        echo "different"
    fi

    # ~/.config/: 
        # kitty, fish, htop, nnn, ncmpcpp, nvim 
    dirs=(dir1 dir2 etc)       
    for dir in "${dirs[@]}"; do    
        ln -s "$HOME/Dotfiles/$dir" "$HOME/.config/$dir"    
    done

    # ~/: 
        # tmux, bash, gitconfigs, vim
}

# ----------------------
#    start the script
# ----------------------
detect_os

