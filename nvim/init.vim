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
set paste
set t_Co=256
set laststatus=2
let g:airline_theme="base16_3024"
let g:nerdtree_tabs_open_on_console_startup=1
colorscheme gruvbox
set background=dark
