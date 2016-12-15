set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'

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

set number
set tabstop=2

