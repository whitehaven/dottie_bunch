" Use vim settings, rather than Vi settings
set nocompatible

" Vundle plugins install section
" Install with :PluginInstall
" =============================
let has_vundle=1
if !filereadable(expand("~/.vim/bundle/Vundle.vim/README.md"))
    echo "Installing Vundle..."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
    let has_vundle=0
endif

filetype off " required for Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage itself

" color schemes
Plugin 'vim-scripts/wombat256.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rainux/vim-desert-warm-256'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'
Plugin 'jacoborus/tender'

" Filesystem
Plugin 'scrooloose/nerdtree' " filesystem explore (F12)
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim' " file/buffer fuzzy finder (Ctrl+F)

" Utilities
Plugin 'Townk/vim-autoclose' " autocomplete open-close pairs, e.g: () {} <> []
"Plugin 'vim-scripts/YankRing.vim' " access to yanked buffer (F3)
"Plugin 'ervandew/supertab' " <Tab> everything! (YCM handles tabs?)
"Plugin 'mhinz/vim-startify' " a start screen for vim!
Plugin 'Lokaltog/vim-easymotion' " Quickly jump to another place (,,w)
Plugin 'jeetsukumaran/vim-buffergator' " list & navigate buffers (,b)

" Git
Plugin 'tpope/vim-fugitive' " :G* git commands
Plugin 'airblade/vim-gitgutter' " show git diff signs in the gutter column

" Visuals
"Plugin 'powerline/powerline'
Plugin 'bling/vim-airline'
"Plugin 'itchyny/lightline.vim' " A light and configurable statusline/tabline

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Code
Plugin 'scrooloose/syntastic' " syntax checker
" Plugin 'Valloric/YouCompleteMe' " code completion engine for C-family/Python/etc.
"                                " https://github.com/Valloric/YouCompleteMe#installation
Plugin 'rdnetto/YCM-Generator' " :YcmGenerateConfig to generate a config in current folder
Plugin 'Valloric/ListToggle' " easily toggle the quickfix and location-list
Plugin 'scrooloose/nerdcommenter' " <,c> toggle comments

" TODO: decide if tags are worth including
" Plugin 'ludovicchabant/vim-gutentags' " A Vim plugin that manages your tag files
" Plugin 'majutsushi/tagbar' " tags window tree (F8) (definitions/function/etc.)

Plugin 'vimwiki/vimwiki'

Plugin 'BlindFS/vim-taskwarrior'

"Plugin 'Rip-Rip/clang_complete'
"Plugin 'nvie/vim-flake8'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'

call vundle#end()

" Install plugins for the first time (then quit)
if has_vundle == 0
    :silent! PluginInstall
    echo "Plugins installed! Restart vim."
    :qa
endif

" enable filetype detection features
filetype plugin indent on

" set utd-8 as the internal vim encoding
set encoding=utf-8

" Use unix as the standard file type
set fileformats=unix,dos

" Disable swap files - they trigger too many events for file system watchers
" Enable backup - better safe than sorry. Rolled every minute.

" use indentation from the previous line
set autoindent

" configure tab handling (spaces instead of tabs, etc.)
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab " Use spaces instead of tabs
set smarttab " smarter tabs

" maximum width of inserted text (80 is too small for modern displays)
set textwidth=100

" compact gvim UI
if has("gui_running")
    set guioptions-=m " remove menubar
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right scrollbar
    set lines=55
    set columns=125
    winpos 450 150 " center the window in my screen
    " first, try the Meslo font
    silent! set guifont=Meslo\ LG\ S\ 9
    if &guifont != 'Meslo LG S 9'
        " if not found, fallback to Monospace
        set guifont=Monospace\ 9
    endif
endif

" highlight group for wrong whitespace, must appear before the colorscheme
autocmd ColorScheme * highlight BadWhitespace ctermbg=red guibg=red

" color scheme
"set guicolors
set t_Co=256
colorscheme molokai
" let g:molokai_original=1 " original background, disable for darker
let g:rehash256=1 " better colors for 256-color terminals

"wombat256mod
"colorscheme jellybeans
"set background=dark
syntax on

" column margin line & cursor line
set colorcolumn=101
"highlight ColorColumn ctermbg=gray guibg=gray
set cursorline

" show line numbers
set number
set relativenumber

" intelligent c-style comments
set comments=sl:/*,mb:\ *,elx:\ */

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" history/undo settings
set history=2000
set undolevels=2000

" general settings
let mapleader="," " set <leader> to ,
set wildmenu " turn on wild menu
set wildmode=longest:full " TAB acts nicely (auto-complete and show the wildmenu)
set autoread " reload file when changes happen in other editors
set mouse=a " enable mouse support
set bs=indent,eol,start " make backspace behave like normal again
set lazyredraw " do not refresh screen while executing macros
set scrolloff=5 " always show 4 lines at the edge when moving the cursor
set sidescrolloff=7 " always show 7 columns at the edge when moving the cursor
set sidescroll=1 " for fast terminals
set magic " for regular expressions
set clipboard=unnamed " make yank copy to the global system clipboard (works?)
set completeopt=longest,menuone " Improving code completion
set splitbelow " split windows to the bottom (e.g, help)
set splitright " split windows to the right
set title " show window title, when possible (e.g, GVIM)
set ttyfast " improve redrawing smoothness
set showcmd " show the keys being entered in the status line
set tildeop " The tilde command ~ behaves like an operator
set shortmess+=I " disable the startup message of VIM
set hidden " open another file while current is yet saved (i.e, hide-don't-close)

" tags
set tags+=./tags
set tags+=/usr/include/tags
set tags+=/usr/lib/python2.7/tags
set tags+=tags; " search for tags in all of the parent folders of the current folder
set tags+=./tags; " search for tags in all of the parent folders of the current file

" search settings
set hlsearch " highlight search results
set incsearch " search as you type
set ignorecase " ignore case when searching
set smartcase " ignore ignorecase if the search contains uppercase characters

" auto-format settings
set formatoptions-=t " don't automatically wrap text when typing
set formatoptions+=j " when joining lines, smartly join their comments leader

" highlight bad whitespace matching rules (when leaving insert mode)
autocmd InsertLeave * match BadWhitespace /\t\|\s\+$/

" vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
set conceallevel=2


" ignore these files in the wildmenu
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*~
set wildignore+=*.a,*.o,*.so,*.obj,*.pyc
set wildignore+=*.jpg,*.jpeg,*.png,*.pdf
set wildignore+=*.git,*.swp,*.swo
set wildignore+=.git,.hg,.svn "

" sudo fix: force sudo write with w!!
cmap w!! w !sudo tee % >/dev/null

" enable omni-complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" enable omni-complete on filetypes without omni complete registered functions
autocmd Filetype *
            \   if &omnifunc == "" |
            \       setlocal omnifunc=syntaxcomplete#Complete |
            \   endif

"Python is handled by python-mode. Alternative:
" autocmd FileType python set omnifunc=pythoncomplete#Complete
"C/C++ is handled by clang-complete. Alternative:
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
" in case there is a problem with cpp, replace with:
" au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" Mappings - tabs/windows handling
" ================================
" CTRL+T to open new tabs
noremap <C-T> :tabnew<cr>
" Move between tabs
noremap <silent> <Leader>n <Esc>:tabprevious<CR>
noremap <silent> <Leader>m <Esc>:tabnext<CR>
noremap <silent> <C-Left> <Esc>:tabprevious<CR>
noremap <silent> <C-Right> <Esc>:tabnext<CR>
" Move between windows
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
noremap <silent> <c-l> <c-w>l
noremap <silent> <c-h> <c-w>h
noremap <silent> <c-Up> <c-w><c-w>
noremap <silent> <c-Down> <c-w><s-w>
" Resize windows
noremap <silent> + <c-w>+
noremap <silent> _ <c-w>-
noremap <silent> < <c-w><
noremap <silent> > <c-w>>

" Mappings - various shortcuts
" ============================
" faster command entering -now save/close/etc. will be faster
nnoremap ; :

" force myself to get used to h/j/k/l
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Quick save
"noremap <silent> <leader>s <Esc>:update<CR>
" Quick quit
"noremap <silent> <leader>q <Esc>:quit<CR>
" Spell-checking toggle
map <leader>sp :setlocal spell!<cr>
" Disable highlight with <leader><cr>
map <silent> <leader><cr> :nohlsearch<cr>
" CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Indentation of selected text
vnoremap < <gv
vnoremap > >gv
" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
" Select all
map <leader>a ggVG
" remove all end-of-line whitespaces
map <silent> <leader>w :%s/\s\+$//<cr>
" replace all tabs with spaces
map <leader><tab> :retab<cr>
" Git shortcuts (assuming available git aliases)
map <leader>gf :Git fetch --all<cr>
map <leader>gb :Git b<cr>
map <leader>gs :Gstatus<cr>
map <leader>ga :Gwrite<cr>
map <leader>gl :Git l<cr>
map <leader>gla :Git la<cr>
map <leader>gd :Gdiff<cr>
" Disable formatting when pasting (usually large chunks of code)
set pastetoggle=<F2>

" Use <C-Up>/<C-Down> to swap lines
map <C-k> dd<Up>P
map <C-j> ddp

" Workarounds
" ===========

" Can also use CTRL+j/k to move inside omnicomplete
"function! OmniPopup(action)
"    if pumvisible()
"        if a:action == 'j'
"            return "\<C-N>"
"        elseif a:action == 'k'
"            return "\<C-P>"
"        endif
"    endi    f
"    return a:action
"endfunction
"inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Automatically close the preview window of omnicomplete - disabled
" (preview does not behave nicely)
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" tmux fix
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif


" Plugins Settings
" ================

" python
" ======
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" lightline
" =========
set laststatus=2 " always show the statusline
set noshowmode " don't show '-- INSERT --' too
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" syntastic
" =========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++1z'
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes':
        \ ['c', 'cpp', 'python', 'sh'] }

" YouCompleteMe
" =============

" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_always_populate_location_list = 1
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" ListToggle
" ==========
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

" ctrlp
" =====
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_clear_cache_on_exit = 0 " don't recalc after restart
let g:ctrlp_show_hidden = 1 " also look for hidden files
let g:ctrlp_open_new_file = 'v' " <C-y> to open in a vertical split
let g:ctrlp_map = '<c-p>' " <c-p> is reserved for YankRink
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'rw'

" NERDTree
" ========
let NERDTreeShowHidden=1 " show hidden files by default
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <silent> <F12> :NERDTreeToggle<cr>
map <silent> <S-F12> :NERDTreeFind<cr>
" closes vim if the only buffer left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" starts nerdtree if no files specified when vim opened (disabled)
"autocmd vimenter * if !argc() | NERDTree | endif

" clang_complete
" ==============
let g:clang_complete_auto=1 " automatically complete after ->, ., ::
let g:clang_complete_copen=0 " open quickfix window on error.
let g:clang_hl_errors=1 " highlight the warnings and errors the same way clang does it.
let g:clang_periodic_quickfix=0 " periodically update the quickfix window. - disabled (clears the make output)
let g:clang_snippets=1 " do some snippets magic after a ( or a , inside function call. Not currently fully working.
let g:clang_snippets_engine="clang_complete" " The snippets engine (clang_complete, snipmate, ultisnips... see the snippets subdirectory).
let g:clang_conceal_snippets=1 " clang_complete will use vim 7.3 conceal feature to hide <# and #> which delimit snippet placeholders.
let g:clang_close_preview=1 " the preview window will be close automatically after a completion.
let g:clang_exec="/usr/bin/clang++" " Name or path of clang executable.
let g:clang_user_options="" " Add this value at the end of the clang command
let g:clang_auto_user_options="path, .clang_complete" " use path for include dirs, use .clang_complete for extra settings
let g:clang_use_library=1 " Use libclang directly
let g:clang_library_path="" " The path to libclang.so
let g:clang_complete_macros=0 " If clang should complete preprocessor macros and constants.
let g:clang_complete_patterns=0 " If clang should complete code patterns, i.e loop constructs etc.
" Update and show the quickfix window
nnoremap <F9> :call g:ClangUpdateQuickFix()<CR>:copen<CR>

" tagbar
" ======
let g:tagbar_autoshowtag=1 " unfold as needed to show a tag
" Open a tagbar window that closes when jumped from
nmap <F8> :TagbarOpenAutoClose<cr>
" Open/Close the tagbar window (but leave it open when jumped from)
nmap <S-F8> :TagbarToggle<cr>

" autoclose
" =========
let g:AutoClosePreserveDotReg=0 " fix a bug (movement keys in insert mode write random text)

" YankRink
" ========
"map <F3> :YRShow<cr>
"imap <F3> <C-O>:YRShow<cr>

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>

let g:vimwiki_list = [{'path': '~/ac_wiki/', 'syntax': 'markdown', 'ext': '.md'}]

" ======================================================================
" below: stuff that need to be arranged/checked/deleted

" Windows like copy/paste shortcuts (CTRL+X/C/V, etc.) - disabled
"vnoremap <C-X> "+x
"vnoremap <S-Del> "+x
"vnoremap <C-C> "+y
"vnoremap <C-Insert> "+y
"map <C-V> "+gP
"map <S-Insert> "+gP
"cmap <C-V> <C-R>+
"cmap <S-Insert> <C-R>+
"noremap <C-Q> <C-V> " Use CTRL-Q to do what CTRL-V used to do

" easier formatting of paragraphs
"vmap Q gq
"nmap Q gqap

" Fixing the copy & paste madness
" ================================
"vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
"nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
"imap <C-v> <Esc><C-v>a

" ======================================================================
" reload .vimrc when it changed
" because the settings are not reset, I prefer to disable it until I find a better approach
"autocmd! bufwritepost .vimrc source %
"
let g:task_rc_override = 'rc.defaultwidth=0'
