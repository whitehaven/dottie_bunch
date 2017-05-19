set nocompatible              " be iMproved, required
filetype off                  " required
filetype indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'

Plugin 'ervandew/supertab'

Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-fugitive'

Plugin 'airblade/vim-gitgutter'
set updatetime=250

Plugin 'ntpeters/vim-better-whitespace'

Bundle 'farseer90718/vim-taskwarrior'

" atypical install, note manual install in .vim/ :
" I ran git clone --branch=dev git@github.com:vimwiki/vimwiki.git vim/.vim/bundle
Plugin 'https://github.com/vimwiki/vimwiki.git'

Plugin 'tbabej/taskwiki'
" supposed color enhancement for taskwiki and tw in general
Plugin 'powerman/vim-plugin-AnsiEsc'
" supposed file navigation helper for taskwiki
Plugin 'majutsushi/tagbar'

Plugin 'pseewald/vim-anyfold'

Plugin 'tpope/vim-surround'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" per anyfold docs:
let anyfold_activate=1
set foldlevel=0

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

colorscheme slate

" syntax highlighting
syntax on

set encoding=utf-8

" show line number
set number
" while showing relative line numbers everywhere else
set relativenumber

" leave margin
set scrolloff=7

let python_highlight_all=1
syntax on

" airline stuff
set laststatus=2
set ttimeoutlen=50

let g:airline_theme='powerlineish'
