set nocompatible              " be iMproved, required
filetype off                 " required

call plug#begin('~/.vim/plugged')

" Colorshemes
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5-syntax.vim'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'shime/vim-livedown'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" lazyredraw ( to fix stuttering )
set lazyredraw

" Color Settings
colorscheme solarized
set background=dark
set t_Co=256
set guioptions-=T
syntax enable
set hlsearch
set showmatch

" tab settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set number

" change directory when opening a file
set autochdir

" store swp files
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" airline modifications
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" airline fonts
if has('gui_running')
  set guifont=Hack\ 12
  set lines=45 columns=140
endif

" Custom keymappings
let mapleader = "\<Space>"
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>Q :q!<CR>
map <leader>e :e 
map <leader>l :NERDTreeToggle<CR>
map <leader>t :tabnew<CR>:NERDTreeToggle<CR>
map <leader>z <C-Z>
imap jj <Esc>
imap <leader><Tab> <C-z>,
map <leader>c "+y<CR>
map <leader>v "+gP<CR>
map <leader>g :Git 
map <leader>gs :Gstatus<CR>
map <leader>gpu :Git push<CR>
map <leader>gpl :Git pull<CR>
map <leader>so :so ~/.vimrc<CR>
map <leader>pi :PluginInstall<CR>
map <leader>pc :PluginClean<CR>
map <leader>o :CtrlP<CR>

" Splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" emmet mods
let g:user_emmet_leader_key="<C-z>"
