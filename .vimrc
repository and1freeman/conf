syntax on

" from Primeagen video
set number
set noerrorbells
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" cursor line in the middle of the screen
set scrolloff=999
set splitbelow splitright
set hidden
set noshowmode showcmd
set pastetoggle=<F3>
set wildchar=<tab> wildmenu wildmode=full
set signcolumn=yes

" always show statusline
set laststatus=2
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬
set list

" make :find search recursively relative to the root folder
set path+=**
set wildignore=*/node_modules/*

" plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'tomasiser/vim-code-dark'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier'
Plug 'junegunn/goyo.vim'

call plug#end()


" colorschemes
colorscheme gruvbox
" colorscheme codedark
set background=dark
set cursorline

" fix tmux E254 error
set t_Co=256

let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'ShowBranch',
\   'fileformat': 'ShowFileFormat',
\   'fileencoding': 'ShowEncoding'
\ },
\ }

function! ShowBranch()
  return winwidth(0) > 70 ? FugitiveHead() : ''
endfunction

function! ShowFileFormat()
  return winwidth(0) > 90 ? &fileformat : ''
endfunction

function! ShowEncoding()
  return winwidth(0) > 90 ? &encoding : ''
endfunction

" function! Linter()
"   let current_buff=bufnr("%")

"   let error_count=ale#statusline#Count(current_buff).error
"   let warning_count=ale#statusline#Count(current_buff).warning
"   let info=""

"   if error_count
"     let info=info . "E:" . error_count
"   endif

"   if warning_count
"     let info=info . " W:" . warning_count
"   endif

"   return info
" endfunction


hi CursorLine ctermbg=0
hi SignColumn ctermbg=0

" remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" mappings
let mapleader = " "

" splits navigation
nnoremap <c-h> :wincmd h<cr>
nnoremap <c-j> :wincmd j<cr>
nnoremap <c-k> :wincmd k<cr>
nnoremap <c-l> :wincmd l<cr>

nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>

" buffers nav
" alt-key: ctrl-v
nnoremap h :bp<cr>
nnoremap l :bn<cr>

" fzf
nnoremap <c-p> :Files<cr>
nnoremap <leader>b :Buffers<cr>

" visual selection movements
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

nnoremap <F4> :set nu!<cr>

" search and replace
" all
nnoremap <leader>rr :%s///g<left><left><left>

" with confirmation menu
nnoremap <leader>rc :%s///gc<left><left><left><left>

" under cursor
nnoremap <leader>ru :%s/\<<C-r><C-w>\>//g<left><left>

" copy to system clipboard
vmap <leader>c y:new ~/.vim/.vimbuffer<cr>VGp:x<cr> \| :!cat ~/.vim/.vimbuffer \| clip.exe <cr><cr>

" paste from buffer
map <leader>v :r ~/.vim/.vimbuffer<cr>


" jsx, scss prettier fix
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd BufNewFile,BufRead *.scss set filetype=scss.css

" Goyo
nnoremap <leader>z :Goyo<cr>


" snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" format on save
let g:prettier#autoformat=1
let g:prettier#autoformat_require_pragma=0


" netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=25

" closetag plugin
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" ale
let g:ale_sign_error='|'
let g:ale_sign_warning='|'

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_javascript_eslint_executable='npx eslint'
let g:ale_completion_enabled=1
let g:ale_completion_autoimport=1

let g:ale_fixers={
\ 'javascript': ['eslint']
\ }

nnoremap <leader>gd :ALEGoToDefinition<cr>

" ale autoinserting fix
set completeopt+=noinsert


inoremap <silent><expr> <tab> pumvisible() ? "<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-tab> pumvisible() ? "<C-p>" : "\<S-TAB>"
