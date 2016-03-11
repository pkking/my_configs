set nocompatible            
filetype off               

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'


call vundle#end()           
filetype plugin indent on   
syntax on
set paste
set t_Co=256
set laststatus=2
let g:airline_theme="base16_3024"
colorscheme gruvbox
set background=dark
