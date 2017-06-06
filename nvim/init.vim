if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/bundle/dein.vim

if dein#load_state('~/.config/nvim/bundle')
  call dein#begin('~/.config/nvim/bundle')

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/deoplete.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"set nocompatible            
"filetype off               
           
"set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/deoplete.vim
"filetype plugin indent on   
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
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:netrw_winsize = 20

colorscheme desert
hi Normal ctermbg=NONE
