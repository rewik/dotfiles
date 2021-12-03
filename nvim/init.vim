"----------------------------------------------------------------------------------------
" General settings
"----------------------------------------------------------------------------------------
colorscheme molokai

set expandtab
set shiftwidth=4
set tabstop=4
set hidden

" vv ? vv
"set signcolumn=yes:2
set number
set termguicolors
set undofile
"set spell
set title

set ignorecase
set smartcase
set wildmode=longest:full,full
"set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=6
set sidescrolloff=6

" vv ? vv
set nojoinspaces
set splitright
set confirm
set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300
set redrawtime=10000

set modelines=0
set visualbell
set cursorline
set path+=**

set colorcolumn=90

"----------------------------------------------------------------------------------------
" Key maps
"----------------------------------------------------------------------------------------

let mapleader = "\<space>"

" gf: open file unser cursor (even if it doesn't exist)
map gf :edit <cfile><cr>
nnoremap <leader>/ :noh<cr>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap L :tabn<cr>
nnoremap H :tabp<cr>
nnoremap ; :

imap ;; <Esc>A;<Esc>


"----------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/which-key.vim
call plug#end()

doautocmd User PlugLoaded
