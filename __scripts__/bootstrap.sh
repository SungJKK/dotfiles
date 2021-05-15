#!/usr/bin/env bash

# Exit if any error happens
set -e

# Variables
DOT_DIR=~/dotfiles
CONF_DIR=~/.config

# Initial check
init_proc() {
  echo -e "##############################################################"
  echo -e "# WARNING: This will delete existing configuration files"
  echo -e "# Be sure to back up your files before running this script"
  read -p "# Do you wish to continue? (y/n) " -r CONTINUE

  if [[ $CONTINUE = 'y' ]];then
    download_pkgs
    remove_prev_files
    create_links
    change_shell
  else
    echo -e "Aborting..."
    exit
  fi
}

# Download packages
download_pkgs() {
  echo -e "Downloading packages..."
  make -f $DOT_DIR/__scripts__/InstallPkgs.mk
}

# Remove any previous files
remove_prev_files() {
  echo -e "Removing previous files..."
  sudo rm -rf ~/.gitconfig ~/.gitignore_global > /dev/null 2>&1
  sudo rm -rf ~/.config/kitty/* > /dev/null 2>&1
  sudo rm -rf ~/.config/htop/* > /dev/null 2>&1
  sudo rm -rf ~/.config/bashtop/* > /dev/null 2>&1
  sudo rm -rf ~/.config/neofetch/* > /dev/null 2>&1
  sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
  sudo rm -rf ~/.zshenv ~/.config/zsh/* > /dev/null 2>&1
  sudo rm -rf ~/.vim/* > /dev/null 2>&1
  sudo rm -rf ~/.zathura/* > /dev/null 2>&1
  sudo rm -rf ~/Programs/weechat/* > /dev/null 2>&1
  sudo rm -rf ~/.config/neomutt/* > /dev/null 2>&1
  sudo rm -rf ~/.newsboat/* > /dev/null 2>&1
  sudo rm -rf ~/.config/nvim/* > /dev/null 2>&1
  sudo rm -rf ~/.config/ranger/* > /dev/null 2>&1
}

# Create symlinks
create_links() {
  echo -e "Creating symlinks..."
  ln -sf $DOT_DIR/kitty/* $CONF_DIR/kitty/

  ln -sf $DOT_DIR/gitconfig/gitconfig ~/.gitconfig
  ln -sf $DOT_DIR/gitconfig/gitignore ~/.gitignore_global

  ln -sf $DOT_DIR/tops/htoprc $CONF_DIR/htop/htoprc
  ln -sf $DOT_DIR/tops/bashtop.cfg $CONF_DIR/bashtop/bashtop.cfg

  ln -sf $DOT_DIR/neofetch $CONF_DIR/neofetch

  ln -sf $DOT_DIR/tmux/tmux.conf ~/.tmux.conf

  ln -sf $DOT_DIR/zsh/zshenv ~/.zshenv
  ln -sf $DOT_DIR/zsh/zshrc $CONF_DIR/zsh/.zshrc
  ln -sf $DOT_DIR/zsh/zprofile $CONF_DIR/zsh/.zprofile
  ln -sf $DOT_DIR/zsh/p10k.zsh $CONF_DIR/zsh/.p10k.zsh

  ln -sf $DOT_DIR/vim ~/.vim

  ln -sf $DOT_DIR/zathura $CONF_DIR/zathura
}

# Set default shell
change_shell () {
  echo -e "Changing default shell..."
  sudo chsh -s /usr/bin/zsh
}

# Start program
init_proc


# ==> gitconfig
  # path : ~/.gitconfig & ~/.gitignore_global

# ==> kitty
  # path : ~/.config/kitty/*

# ==> tops
  # path : ~/.config/htop/htoprc
  # path : ~/.config/bashtop/bashtop.cfg

# ==> neofetch
  # path : ~/.config/neofetch/config.conf

# ==> tmux 
  # path : ~/.tmux.conf

# ==> zsh   
  # path : ~/.zshenv
  #      : ~/.config/zsh/{.zshrc,.zprofile,.p10k.zsh}

# ==> vim 
  # path : ~/.vim/*

# ==> zathura
  # path : ~/.config/zathura/zathurarc

# ==> weechat
  # path : ~/Programs/weechat/

# ==> neomutt
  # path : ~/.config/neomutt/

# ==> newsboat
  # path : ~/.newsboat/

# ==> neovim
  # path : ~/.config/nvim/*

# ==> ranger
  # path : ~/.config/ranger/rc.conf





