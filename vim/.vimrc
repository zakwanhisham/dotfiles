" ========================================
" Options
" ========================================

set encoding=UTF-8
set spelllang=en_us
set mouse=a " Enable mouse mode
set breakindent " Enable break indent
set undofile " Save undo history
set ignorecase " Case-insensitive searching unless \C or capital in search
set smartcase " Enable smart case
set updatetime=250 " Decrease update time
set timeoutlen=300 " Time to wait for a mapped sequence to complete (in milliseconds)
set nobackup " Don't create a backup file
set nowritebackup " Don't write backup before overwriting
set completeopt=menuone,noselect " Better completion experience
set whichwrap+=<,>,[,],h,l " Allow certain keys to move to the next line
set linebreak " Don't break words when wrapping
set scrolloff=8 " Keep 8 lines above/below cursor
set sidescrolloff=8 " Keep 8 columns to the left/right of cursor
set numberwidth=4 " Number column width
set shiftwidth=4 " Spaces per indentation
set tabstop=4 " Spaces per tab
set softtabstop=4 " Spaces per tab during editing ops
set expandtab " Convert tabs to spaces
set nocursorline " Don't highlight the current line
set splitbelow " Horizontal splits below current window
set splitright " Vertical splits to the right
set noswapfile " Don't use a swap file
set smartindent " Smart indentation
set backspace=indent,eol,start " Configurable backspace behavior
set pumheight=10 " Popup menu height
set conceallevel=0 " Make `` visible in markdown
set fileencoding=utf-8 " File encoding
set cmdheight=1 " Command line height
set autoindent " Auto-indent new lines
set iskeyword+=- " Treat hyphenated words as whole words
set showmatch " show the matching part of pairs [] {} and ()

" ========================================
" Keymaps
" ========================================

" Set leader key
let mapleader = " "
let maplocalleader = ";"

" Disable the spacebar key's default behavior in Normal and Visual modes
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>

" Allow moving the cursor through wrapped lines with j, k
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" clear highlights
nnoremap <Esc> :noh<CR>

" delete single character without copying into register
nnoremap x "_x

" Vertical scroll and center
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Find and center
nnoremap n nzzzv
nnoremap N Nzzzv

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Keep last yanked when pasting
vnoremap p "_dP

" Explicitly yank to system clipboard (highlighted and entire row)
noremap <leader>y "+y
noremap <leader>Y "+Y

" Open file explorer
noremap <silent> <leader>- :Ex<CR>


" ========================================
" Other
" ========================================

" Syntax highlighting
syntax on

" Colorscheme
colorscheme retrobox
set background=dark

set clipboard=unnamedplus

" True colors
if !has('gui_running') && &term =~ '\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
