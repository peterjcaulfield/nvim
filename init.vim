call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhartington/oceanic-next'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
"Plug 'mhartington/nvim-typescript', { 'do': './install' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'do': 'brew install rg' }
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'hashivim/vim-terraform'
Plug 'mattn/emmet-vim'
Plug 'wincent/terminus'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'shumphrey/fugitive-gitlab.vim'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load config modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim
" load local.vim environment specific config if it exists
if !empty(glob("~/.local.vim"))
    source $HOME/.local.vim
endif
