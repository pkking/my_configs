set nocompatible            
filetype off               

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

call vundle#end()           
filetype plugin indent on   
syntax on
set nu
set paste
set laststatus=2
let g:nerdtree_tabs_open_on_console_startup=1
colorscheme gruvbox
"colorscheme xoria256
set background=dark
