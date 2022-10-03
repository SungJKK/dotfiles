# Fisher commands: 
# $ fisher list 
# $ fisher update [<pkg>]
# $ fisher list | fisher remove # removes everything (including fisher)

if status is-interactive
    # suppress welcome
    set fish_greeting

    # fish vim bindings
    set -U fish_key_bindings fish_vi_key_bindings
    set fish_cursor_default underscore blink
    set fish_cursor_insert underscore blink
    set fish_cursor_replace_one blink
    set fish_cursor_visual block blink
end


### Tide prompt configuration
## Prompt config
# right prompt
set -g tide_left_prompt_frame_enabled false
set -g tide_left_prompt_prefix '  '
set -g tide_left_prompt_items pwd git newline vi_mode character

# left prompt
set -g tide_right_prompt_frame_enabled false
set -g tide_right_prompt_prefix '  '
set -g tide_right_prompt_items status newline cmd_duration 

## Items config
# context 
# pwd 
# git 
# status 
# jobs
# cmd_duration 
# vi_mode 
set -g tide_vi_mode_icon_default '[I]'
set -g tide_vi_mode_icon_replace '[R]'
set -g tide_vi_mode_icon_visual '[V]'
# character (prompt)

# docker 
# aws 
# go 
# kubectl
# nix_shell
# node
# rustc
# terraform

# custom items 





