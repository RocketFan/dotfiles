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
" general
Plug 'tpope/vim-fugitive'
call plug#end()
