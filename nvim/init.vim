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
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()           
set runtimepath+=~/.config/nvim/bundle/deoplete.nvim/
map <F2> :NERDTreeToggle<CR>
filetype plugin indent on   
"使用语法高亮定义代码折叠
set foldmethod=syntax
"打开文件是默认不折叠代码
set foldlevelstart=99
set nu
set t_So=256
set encoding=utf-8
set laststatus=2
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_synchronize_view = 1

colorscheme gruvbox
set background=dark
hi Normal ctermbg=NONE
