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
Plugin 'UltiSnips'
Plugin 'sheerun/vim-polyglot'
Plugin 'Shougo/deoplete.nvim'


call vundle#end()           
filetype plugin indent on   
syntax on
set cindent
set nu
set t_So=256
set paste
set encoding=utf-8
set laststatus=2
let g:nerdtree_tabs_open_on_console_startup = 1
let g:deoplete#enable_at_startup = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_synchronize_view = 1
colorscheme gruvbox
set background=dark
hi Normal ctermbg=NONE
