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
    clean_state
    # create_links
    # change_shell
  else
    echo -e "Aborting..."
    exit
  fi
}

# Download packages
download_pkgs() {
  echo -e "Downloading packages..."
  make -f $DOT_DIR/__scripts__/ArchPkgs
}

# Remove any previous files
clean_state() {
  echo -e "Cleaning previous files..."
  sudo rm -rf $CONF_DIR/kitty/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/kitty

  sudo rm -rf ~/.gitconfig ~/.gitignore_global > /dev/null 2>&1

  sudo rm -rf $CONF_dir/htop/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/htop

  sudo rm -rf $CONF_DIR/bashtop/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/bashtop

  sudo rm -rf $CONF_DIR/neofetch/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/neofetch

  sudo rm -rf $CONF_DIR/tmux/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/tmux

  sudo rm -rf ~/.zshenv $CONF_DIR/zsh/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/zsh

  sudo rm -rf ~/.vim/* > /dev/null 2>&1
  mkdir -p ~/.vim

  sudo rm -rf $CONF_DIR/zathura/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/zathura

  sudo rm -rf $CONF_DIR/weechat/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/weechat

  sudo rm -rf $CONF_DIR/neomutt/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/neomutt

  sudo rm -rf $CONF_DIR/newsboat/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/newsboat

  sudo rm -rf $CONF_DIR/nvim/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/nvim

  sudo rm -rf $CONF_DIR/ranger/* > /dev/null 2>&1
  mkdir -p $CONF_DIR/ranger
}

# Create symlinks
create_links() {
  echo -e "Creating symlinks..."
  ln -sf $DOT_DIR/kitty $CONF_DIR/kitty

  ln -sf $DOT_DIR/gitconfig/gitconfig ~/.gitconfig
  ln -sf $DOT_DIR/gitconfig/gitignore ~/.gitignore_global

  ln -sf $DOT_DIR/tops/htoprc $CONF_DIR/htop/htoprc

  ln -sf $DOT_DIR/tops/bashtop.cfg $CONF_DIR/bashtop/bashtop.cfg

  ln -sf $DOT_DIR/neofetch $CONF_DIR/neofetch

  ln -sf $DOT_DIR/tmux $CONF_DIR/tmux

  ln -sf $DOT_DIR/zsh/zshenv ~/.zshenv
  ln -sf $DOT_DIR/zsh/zshrc $CONF_DIR/zsh/.zshrc
  ln -sf $DOT_DIR/zsh/zprofile $CONF_DIR/zsh/.zprofile
  ln -sf $DOT_DIR/zsh/p10k.zsh $CONF_DIR/zsh/.p10k.zsh

  ln -sf $DOT_DIR/vim ~/.vim

  ln -sf $DOT_DIR/zathura $CONF_DIR/zathura

  ln -sf $DOT_DIR/weechat/irc.conf ~/Programs/weechat/irc.conf

  ln -sf $DOT_DIR/neomutt $CONF_DIR/neomutt

  ln -sf $DOT_DIR/newsboat $CONF_DIR/newsboat

  ln -sf $DOT_DIR/nvim $CONF_DIR/nvim

  ln -sf $DOT_DIR/ranger $CONF_DIR/ranger
}

# Set default shell
change_shell () {
  echo -e "Changing default shell..."
  sudo chsh -s /usr/bin/zsh
}

# Start program
init_proc






