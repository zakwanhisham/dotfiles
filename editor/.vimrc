set encoding=UTF-8
set spelllang=en_us
set mouse=a
set breakindent
set undofile
set ignorecase
set smartcase
set updatetime=250
set timeoutlen=300
set nobackup
set nowritebackup
set completeopt=menuone,noselect
set whichwrap+=<,>,[,],h,l
set linebreak
set scrolloff=8
set sidescrolloff=8
set numberwidth=4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set nocursorline
set splitbelow
set splitright
set noswapfile
set smartindent
set backspace=indent,eol,start
set pumheight=10
set conceallevel=0
set fileencoding=utf-8
set cmdheight=1
set autoindent
set iskeyword+=-
set showmatch
set number
set relativenumber
set hlsearch
set incsearch
let mapleader = " "
let maplocalleader = ";"
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <Esc> :noh<CR>
nnoremap x "_x
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
vnoremap < <gv
vnoremap > >gv
vnoremap p "_dP
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <silent> <leader>- :Ex<CR>
syntax on
colorscheme retrobox
set background=dark
set clipboard=unnamedplus
if !has('gui_running') && &term =~ '\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
