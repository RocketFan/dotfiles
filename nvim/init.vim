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
" Git wrapper
Plug 'tpope/vim-fugitive'

" File manager
Plug 'scrooloose/nerdtree'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Tabbar light as air
Plug 'bling/vim-airline'

" Syntax highlighter
Plug 'sheerun/vim-polyglot'

" Code completion
Plug 'valloric/youcompleteme'
call plug#end()
