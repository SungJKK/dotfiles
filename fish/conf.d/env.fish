### Environment variables
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

### Default applications
set -gx PAGER less
set -gx EDITOR nvim
set -gx TERMINAL kitty
set -gx BROWSER 
set -gx READER zathura
set -gx PLAYER spotify


### Path Environments
# ### Rust (cargo)

# ### Go

# ### Haskell (Ghcup)
# [ -f "/Users/sung/.ghcup/env" ] && source "/Users/sung/.ghcup/env" # ghcup-env
#
# # From: halostatue/fish-haskell 
# set -l ghcup $HOME/.ghcup
#
# set -q GHCUP_INSTALL_BASE_PREFIX
# and set ghcup $GHCUP_INSTALL_BASE_PREFIX/.ghcup
#
# if test -f $ghcup/env
#     contains -- $ghcup/bin
#     or fish_add_path -pmP $ghcup/bin
# end
#
# contains -- $HOME/.cabal/bin $fish_user_paths
# or fish_add_path -pmP $HOME/.cabal/bin
#
# contains -- $HOME/.local/bin $fish_user_paths
# or fish_add_path -pmP $HOME/.local/bin


# ### Python (Conda)
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#         . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # conda config --set auto_activate_base False
# # conda config --set changeps1 False

 
 
# ### PATH variable
# export PATH="$PATH:$HOME/scripts" 
fish_add_path -g  /opt/homebrew/bin
fish_add_path -g /Users/sung/.local/bin
fish_add_path -g /Applications/Firefox.app/Contents/MacOS

# Fish 3.1+ doesn't add binaries to the path autmatically anymore
# https://github.com/fish-shell/fish-shell/issues/6594
# contains /usr/local/bin $PATH
# or set PATH /usr/local/bin $PATH
# # On M1 Macs, homebrew installs things in /opt/homebrew
# contains /opt/homebrew/bin
# or set PATH /opt/homebrew/bin $PATH



