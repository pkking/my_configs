" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath+=~/.config/nvim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.config/nvim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'vim-airline/vim-airline'
NeoBundleFetch 'vim-airline/vim-airline-themes'
NeoBundleFetch 'scrooloose/nerdtree'
NeoBundleFetch 'jistr/vim-nerdtree-tabs'
NeoBundleFetch 'Shougo/deoplete.nvim'


 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

 " Required:
filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
NeoBundleCheck

set nocompatible            
filetype off               
           
set runtimepath+=~/.config/nvim/bundle/deoplete.nvim/
map <F2> :NERDTreeToggle<CR>
filetype plugin indent on   
"使用语法高亮定义代码折叠
set foldmethod=syntax
"打开文件是默认不折叠代码
set foldlevelstart=99
"set textwidth=80
"set wrap
set nu
set t_So=256
set encoding=utf-8
set laststatus=2
set paste
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_synchronize_view = 1

colorscheme desert
hi Normal ctermbg=NONE
