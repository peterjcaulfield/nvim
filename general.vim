" needed for vim wiki
set nocompatible
filetype plugin on
syntax on
set redrawtime=10000
" needed for vim wiki
set guioptions-=T               " Removes top toolbar
set guioptions-=r               " Removes right hand scroll bar
set go-=L                       " Removes left hand scroll bar
set linespace=15
set clipboard=unnamed
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   "Save on buffer switch
set mouse=a
set wildmode=longest,list       "format wildmenu tab completion
set wildmenu                    "make tab completion for files/buffers act like bash
set foldmethod=syntax
set foldlevel=99
set wildignore+=*/vendor/**,*/node_modules/**,*/lib/**     " I don't want to pull up these folders/files when calling CtrlP
"" Make it obvious where 80 characters is
set colorcolumn=80
set textwidth=80
" Swap files out of the project root
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
highlight TermCursor ctermfg=red guifg=red
" split settings
set splitbelow
set splitright
" auto refresh files that change whilst editing
set autoread
set updatetime=300
" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType md setlocal shiftwidth=2 tabstop=2
autocmd BufWinEnter,WinEnter term://* startinsert

" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
" ensure syntax highlighting works on large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
