#### Put user aliases & abbreviations here

### Aliases 
alias v 'vim'
alias n 'nvim'
alias c 'code'
alias f 'fzf'
alias g 'git'

alias ls 'exa --icons'
alias ll 'exa --icons --long'
alias la 'exa --icons --header --long --all --all --group --links --inode --blocks'
alias lt 'exa --icons --long --tree --level=2'
alias lg 'exa --icons --long --group --all --git'

function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end

alias mkdir 'mkdir -pv'

alias rm 'rm -I'

alias wget 'wget -c'

alias ip 'ip --color=auto'

alias diff 'delta'
# delta is also automatically applied to grep outputs

alias cat 'bat'

alias df 'duf --sort size'


### Abbreviations 
abbr --add --global lman 'man $(find /usr/share/man/man1 -type f | shuf | head -1)'
  # generate random man pages to learn about linux 

abbr --add --global last 'exa --icons --long --sort=modified'
abbr --add --global lf 'du -sh * | sort -h'   # Only OSX. Show file by size

# make mount more readable 
abbr --add --global mount 'mount | column -t'
# view only mounted devices
abbr --add --global mnt "mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | grep -E /dev/ | sort"
  # in macOS : alias mnt='mount | grep -E ^/dev | column -t'

# find command in history
abbr --add --global h 'history'
abbr --add --global hg 'history | grep'
abbr --add --global hgi 'history | grep -i'

# copy using rsync. 
# Rsync is good for copying files both locally and remotely.
abbr --add --global cpv 'rsync -ah --info=progress2'

# safely remove files
abbr --add --global rmf 'rm -rfI'
function rms 
    # TODO: create cron job to clean Trash every interval
    if not test -d ~/.local/share/Trash
        mkdir ~/.local/share/Trash
    end

    mv --force $argv ~/.local/share/Trash
end

# find out whats running on port X
abbr --add --global port 'lsof -i'

# Better find
abbr --add --global find 'fd'

# Better ps
abbr --add --global ps 'procs'


