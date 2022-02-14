"""""""""
" setup "
"""""""""
if !filereadable($HOME . "/.config/nvim/autoload/plug.vim")
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

"""""""""""
" plugins "
"""""""""""
call plug#begin()
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'scrooloose/nerdtree' "File manager
Plug 'vim-syntastic/syntastic' "Syntax checking
Plug 'bling/vim-airline' "Tabbar light as air
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Syntax highlighter
Plug 'valloric/youcompleteme' "Code completion
Plug 'tpope/vim-surround' "Is all about 'surroundings'
call plug#end()

""""""""""""""""""
" plugins config "
""""""""""""""""""

