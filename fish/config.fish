# Fish shell is not POSIX compliant.
# Work arounds : 
# 1. Use bash -c
  # function sdk 
  #   bash -c "...bash commands"
  # end 
# 2. Or just type in bash to use bash, then exit out.

# suppress welcome
set fish_greeting

# fish vim settings
set -U fish_key_bindings fish_vi_key_bindings
set fish_cursor_default underscore blink
set fish_cursor_insert underscore blink
set fish_cursor_replace_one blink
set fish_cursor_visual block blink

# user aliases and functions 
source ~/.config/fish/functions/user-functions.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/sung/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# >>> go gvm >>>
function gvm
  bash -c '. ~/.gvm/bin/gvm-init.sh; gvm "$@"' gvm $argv
end

# >>> haskell ghc >>
set PATH $PATH ~/.ghcup/bin/
