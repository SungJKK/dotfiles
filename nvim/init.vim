" plugins
source $HOME/.config/nvim/vim-plug/plugins.vim

" general settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/plug-config/nerd-commenter.vim
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/keys/mappings.vim

" plug configsj
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/emmet.vim

luafile $HOME/.config/nvim/lua/plug-colorizer.lua
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/floaterm.vim

" themes
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/nvcode.vim
