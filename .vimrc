
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

set nocompatible
filetype off

" include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/fugitive-vim'
Plugin 'klen/python-mode'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'tmsvg/pear-tree'

call vundle#end()
filetype plugin indent on

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

filetype on
filetype indent on
syntax on
set number

set cursorline

augroup python
    autocmd!
    au Bufread,BufNewFile *.py set expandtab
    au FileType python let g:pymode = 1
    au FileType python set expandtab
    au FileType python set tabstop=4
    au FileType python set shiftwidth=4
    au FileType python set softtabstop=4
    au FileType python set autoindent
    au FileType python set backspace=indent,eol,start
    au FileType python set ruler
    au FileType python set showcmd
augroup END

augroup ruby
    autocmd!
    au FileType ruby set ruler
    au FileType ruby set showcmd
    au FileType ruby set autoindent
    au FileType ruby set tabstop=2
    au FileType ruby set softtabstop=2
    au FileType ruby set shiftwidth=2
    au FileType ruby set backspace=indent,eol,start
    au FileType ruby set expandtab
set scrolljump=3
