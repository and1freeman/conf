" general settings

filetype plugin on
syntax enable

" line numbers
set number relativenumber
set noerrorbells

" use spaces instead of tabs
set expandtab

" spaces in tab
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" cursor line in the middle of the screen
set scrolloff=10
set splitbelow splitright
set hidden
set showcmd
set pastetoggle=<F3>
set wildchar=<tab> wildmenu wildmode=full
set omnifunc=syntaxcomplete#Complete
set completeopt+=noinsert,menuone
set showmode
" set signcolumn=yes
set laststatus=1

set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬
set list

" make :find search recursively relative to the root folder
set path+=**
set wildignore=*/node_modules/*

" ignore case in :edit, :find
set wildignorecase
set autoread
