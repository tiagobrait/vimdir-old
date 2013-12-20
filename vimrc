"vimrc
"2012,2013 tiagobrait
" (with some stuff borrowed from https://github.com/haridas/Dotfiles)

"ok, let's organize this stuff now


"-PATHOGEN----------------------------------------------------------------------
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on
"-------------------------------------------------------------------------------

"-OPTIONS-----------------------------------------------------------------------
"use vim settings instead of vi
set nocompatible
"disable modelines (yuck!)
set modelines=0
"much better identation settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
"show next 3 lines below the current one when scrolling
set scrolloff=3
set autoindent
"show what mode we're in
set showmode
"show command in the last line
set showcmd
"hide buffers
set hidden
"set cursorline
set ttyfast
"show 'line,column percetage' in the statusline
set ruler
"we can backspace over everything in insert mode
set backspace=indent,eol,start
" always show a statusline
set laststatus=2
"and what a nice statusline
set statusline=%1*[%n]%<%f\ %r%m                           "buffn,name,RO,change
set statusline+=%2*%y[%{&ff}][%{&fenc!=''?&fenc:&enc}]     "type,format,encoding
set statusline+=%6*%=                                      "L/R separator
set statusline+=%3*[ln:\ %l\ of\ %L\ (%03p%%)]%4*[cl:\ %c] "lines and columns
set statusline+=%5*[%P]%*                                  "percent
"show linenumber
set number
"but not relative numbers though
set norelativenumber
set shell=/bin/bash
"do not redraw when running automatic stuff
set lazyredraw
"go back to a matching bracket for a bit
set showmatch
set matchtime=3
set dictionary=/usr/share/dict/words
"shortcut key to toggle pasting mode
set pastetoggle=<F3>
set backupskip=/tmp/*,/private/tmp/*
"everyone has a mouse these days...
set mouse=a
"nice searching options
set ignorecase
set smartcase
set incsearch
set hlsearch
"line wrapping
set wrap
"wrapping limit
set textwidth=0
"highlight column 81
set colorcolumn=81
"formatting stuff, go see the online help
set formatoptions+=rqn1
"set clipboard
set clipboard=unnamed
"disable those annoying backups
set nobackup
"where to start wrapping (# of chars from right margin)
set wrapmargin=0
"we don't want linebreaks...
set nolinebreak
" Removing scrollbars from gui mode
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions+=m
    set listchars=tab:▸\ ,eol:¬
else
    set t_Co=256
endif
"-------------------------------------------------------------------------------
"-HIGHLIGHTS--------------------------------------------------------------------
"UserX highligths for statusbar
hi User1 ctermfg=White ctermbg=DarkRed cterm=bold
hi User2 ctermfg=White ctermbg=DarkYellow cterm=bold
hi User3 ctermfg=White ctermbg=DarkBlue cterm=bold
hi User4 ctermfg=White ctermbg=DarkMagenta cterm=bold
hi User5 ctermfg=White ctermbg=DarkCyan cterm=bold
hi User6 ctermfg=White ctermbg=DarkGrey cterm=bold
"hi User7 ctermfg=White ctermbg=DarkGrey cterm=bold
"hi User8 ctermfg=White ctermbg=DarkGrey cterm=bold
"hi User9 ctermfg=White ctermbg=DarkGrey cterm=bold
"-------------------------------------------------------------------------------

"-MAPPINGS----------------------------------------------------------------------
"turn off highlighting
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
nnoremap g; g;zz
nnoremap / /\v
vnoremap / /\v
" <leader>ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
"NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>
vnoremap <tab> %
"TagBar
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i
"-------------------------------------------------------------------------------

"-AUTOCOMMANDS------------------------------------------------------------------
au FocusLost * :wa
" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =
" Wildmenu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
"Rebember the last cursor position
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END
"-------------------------------------------------------------------------------

"-VARS--------------------------------------------------------------------------
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']
"disable Syntastic active checking for python:
let g:syntastic_mode_map = { 'mode': 'active','passive_filetypes': ['python'] }
"disable python-mode folding
let g:pymode_folding=0
"snippets information
let g:snips_author='Tiago Polizelli Brait'
let g:snips_company='Tiago Polizelli Brait'
let g:snips_email='tiagobrait@gmail.com'
let g:snips_github='https://github.com/tiagobrait'
let g:author='Tiago Polizelli Brait'
let g:company='Tiago Polizelli Brait'
let g:email='tiagobrait@gmail.com'
let g:github='https://github.com/tiagobrait'
"-------------------------------------------------------------------------------
