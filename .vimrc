set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'mxw/vim-jsx'
Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'mrtazz/simplenote.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

" For vim-move
let g:move_key_modifier = 'C'

" System to vim copy/paste and vice versa
set clipboard=unnamed

" Run a given vim command on the results of fuzzy selecting from
" a given shell command. See usage below. Credit: Gary Bernhardt
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens
    " otherwise, there will be leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
let fileCommand = 'find * -type f | grep -v "\(node_modules\|vendor\|tmp\|git\|public\)"'
nnoremap <leader>f :call SelectaCommand(fileCommand, "", ":e")<cr>
nnoremap <leader>h :call SelectaCommand(fileCommand, "", ":split")<cr>
nnoremap <leader>v :call SelectaCommand(fileCommand, "", ":vsplit")<cr>

set paste

syntax enable

" Search with selected text
vnoremap // y/<C-R>"<CR>

"Backup & undo - https://coderwall.com/p/sdhfug/vim-swap-backup-and-undo-files
set directory=~/.vim/.swp//

" Show trailing whitespace
set listchars=tab:>-,trail:-
set list

" Indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
vnoremap > >gv
vnoremap < <gv
set expandtab ts=2 sw=2 ai
"Window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set number
set nowrap 
set backspace=indent,eol,start

" Search
set incsearch
set hlsearch

set clipboard=unnamed

let CoVim_default_name = "oscar"
let CoVim_default_port = "1111"

"Cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

nnoremap <CR> :nohlsearch<CR>

" Always show file name in footer
set laststatus=2

let g:syntastic_javascript_checkers = ['eslint']
" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif

" Search in files
map <leader>a :Ack! <c-r><c-w>

" paste from  any mode
set clipboard=unnamed

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Because I often accidentally :W when I mean to :w.
command! W w

" Because I often accidentally :Q when I mean to :q.
command! Q q

" Simple note
source ~/.simplenoterc
