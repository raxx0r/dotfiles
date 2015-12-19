" Syntax-specific settings
source ~/.vim/startup/color.vim

execute pathogen#infect()
syntax on
filetype plugin indent on

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>


syntax enable
let g:molokai_original = 1
let g:rehash256 = 1
set vb
set background=dark
" colorscheme solarized

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

set tabstop=4

" Forbidden to use arrow keys!

no <right> <Nop>
no <left> <Nop>
no <up> <Nop>
no <down> <Nop>

ino <right> <Nop>
ino <left> <Nop>
ino <up> <Nop>
ino <down> <Nop>