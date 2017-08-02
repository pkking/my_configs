set nocompatible

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Better file browser
Plugin 'scrooloose/nerdtree'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Better autocompletion
Plugin 'Shougo/neocomplcache.vim'
" awesome colorscheme
Plugin 'tomasr/molokai'
" Golang Plugins
Plugin 'fatih/vim-go'
" JSX syntax highlight.
Plugin 'mxw/vim-jsx'
Plugin 'sickill/vim-monokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" auto install plugins
if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

filetype plugin indent on    " required
syntax enable

"使用语法高亮定义代码折叠
set foldmethod=syntax
"打开文件是默认不折叠代码
set foldlevelstart=99
"set textwidth=80
"set wrap
set nu
let &t_Co=256
set encoding=utf-8
set laststatus=2

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" auto open or close NERDTree
autocmd vimenter * NERDTree
" focus on file buffer
autocmd VimEnter * wincmd p
" open nerdtree buffer on each tab
autocmd BufWinEnter * NERDTreeMirror
" auto close nerdtree buf when no file left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowFiles=1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1


" NERDTree ----------------------------- 
"
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let NERDTreeQuitOnOpen=1

if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
    let &t_Co=256
    colorscheme monokai
else
    colorscheme desert
endif

hi Normal ctermbg=NONE
