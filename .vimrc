syntax on

set nu
set rnu
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=999
set splitbelow
set splitright
set hidden
set noshowmode
set pastetoggle=<F3>


" plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'

call plug#end()


" colorscheme
colorscheme gruvbox
set background=dark
set completeopt-=preview
set cursorline
set colorcolumn=100
hi CursorLine ctermbg=0
hi ColorColumn ctermbg=0


" mappings
let mapleader = " "

nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>

nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>

" buffers nav
nnoremap <c-h> :bp<cr>
nnoremap <c-l> :bn<cr>

" fzf
nnoremap <c-p> :GFiles<cr>
nnoremap <leader>b :Buffers<cr>

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
nnoremap <F4> :set nu!<cr>


" copy to system clipboard
vmap <leader>c y:new ~/.vim/.vimbuffer<cr>VGp:x<cr> \| :!cat ~/.vim/.vimbuffer \| clip.exe <cr><cr>

" paste from buffer
map <leader>v :r ~/.vim/.vimbuffer<cr>


" Ycm
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd BufRead,BufNewFile *.scss set filetype=scss.css
nnoremap <leader>gd :YcmCompleter GoTo<cr>


" snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]
let g:UltiSnipsExpandTrigger="<c-e>"

" format on save
let g:prettier#autoformat=1
let g:prettier#autoformat_require_pragma=0


" netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=25 

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
