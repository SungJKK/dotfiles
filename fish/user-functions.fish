
### colored output for better readability
function diff 
  command diff --color=auto $argv
end
function grep  
  command  grep --color=auto $argv
end
function ip
  command ip --color=auto $argv
end
function ccat
  command highlight --out-format=ansi $argv
end
function man 
  set -x LESS_TERMCAP_mb (set_color --bold --underline brblue)
  set -x LESS_TERMCAP_md (set_color --bold --underline brblue)
  set -x LESS_TERMCAP_me (set_color normal)
  set -x LESS_TERMCAP_se (set_color normal)
  set -x LESS_TERMCAP_so (set_color brred)
  set -x LESS_TERMCAP_ue (set_color normal)
  set -x LESS_TERMCAP_us (set_color --bold bryellow)
  set -x GROFF_NO_SGR 1

  command man $argv
end

### command aliases 
# set default vim to neovim
alias vim=nvim

# list
# function ls
#   command ls -hN --color=auto --group-directories-first $argv
# end
# alias ll='ls -l'
# alias la='ls -al'
# alias ld='ls --human-readable --size -1 -S --clasify'

# list with exa
alias ls='exa --icons'
alias ll='exa --icons --long --all'
alias la='exa --icons --header --long --all --all --group --links --inode --blocks'
alias lt='exa --icons --long --tree --level=2'
alias lg='exa --icons --long --group --all --git'

# mkdir show
alias mkdir='mkdir -pv'

# make mount more readable 
alias mount='mount | column -t'

# view only mounted devices
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | grep -E /dev/ | sort"
  # in macOS : alias mnt='mount | grep -E ^/dev | column -t'

# generate tags
function gc 
  command ctags -R -f ./.git/tags . $argv
end

# find command in history
alias gh='history | grep'

# last files edited
alias left='ls -t -1'

# copy using rsync. 
# Rsync is good for copying files both locally and remotely.
alias cpv='rsync -ah --info=progress2'

# safely remove files
alias rm='rm -i'
alias rms='mv --force -t ~/.local/share/Trash/files'
alias rmf='rm -rf'

# resume wget by default
alias wget='wget -c'

# show processes
alias paux='ps aux | less'

# exit command like vim
alias :q='exit'

# change dir, and show contents
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end


