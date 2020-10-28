" press K on an option to see help page

" source config on file save {{{
augroup source_config
  autocmd!
  autocmd BufWritePost ~/.vimrc ++nested source $MYVIMRC
augroup END
" }}}

" vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

filetype plugin on
syntax on

" line numbers
set number
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
set scrolloff=999
set splitbelow splitright
set hidden
set noshowmode showcmd
set pastetoggle=<F3>
set wildchar=<tab> wildmenu wildmode=full
set signcolumn=yes
set omnifunc=syntaxcomplete#Complete
set completeopt+=noinsert,menuone

" always show statusline
set laststatus=2
set listchars=tab:вЂЈ\ ,trail:В·,precedes:В«,extends:В»,eol:В¬
set list

" make :find search recursively relative to the root folder
set path+=**
set wildignore=*/node_modules/*
set autoread

" plugins {{{
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
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'vifm/vifm.vim'
Plug 'ap/vim-css-color'


call plug#end()
" }}}

" colorschemes
colorscheme gruvbox

set background=dark
set cursorline

" use 256 colors
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


hi CursorLine ctermbg=0
hi SignColumn ctermbg=0

" remove trailing whitespaces on save
augroup remove_trailing_whitespaces
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END

" mappings
let mapleader=" "

" splits navigation
nnoremap <c-h> :wincmd h<cr>
nnoremap <c-j> :wincmd j<cr>
nnoremap <c-k> :wincmd k<cr>
nnoremap <c-l> :wincmd l<cr>

" go to next and previous split
nnoremap <leader>w :wincmd w<cr>
nnoremap <leader>W :wincmd W<cr>

nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>

" buffers nav
" alt-key: ctrl-v
nnoremap <c-h> :bp<cr>
nnoremap <c-l> :bn<cr>

" fzf
nnoremap <c-p> :Files<cr>
nnoremap <leader>l :Buffers<cr>

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

" copy to system clipboard (not exactly)
vmap <leader>c y:new ~/.vim/.vimbuffer<cr>VGp:x<cr> \| :!cat ~/.vim/.vimbuffer \| clip.exe <cr><cr>

" paste from buffer
map <leader>v :r ~/.vim/.vimbuffer<cr>

nnoremap <leader>z :Goyo<cr>

" jsx, scss prettier fix
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd BufNewFile,BufRead *.scss set filetype=scss.css

function Autocomplete()
  let l:previous_symbol=strpart(getline('.'),col('.')-2,1)
  let l:letter=matchstr(l:previous_symbol, '[a-zA-Z]')
  let l:popup_id=popup_findinfo()

  " echo !empty(l:letter)
  echom l:popup_id
  if (!empty(l:letter))
    call feedkeys("\<c-x>\<c-o>")
  else
    " if pumvisible()
    " call feedkeys("\<c-x>")
    " endif
  endif
endfunction

" function Surround()
"   let l:word_under_cursor=expand("<cword>")
"   echo l:word_under_cursor

"   call feedkeys("viw\<esc>a\"\<esc>bi\"\<esc>lel")
" endfunction

" nnoremap gs :call Surround()<cr>

" set updatetime=200
" augroup autocomplete
"   autocmd CursorHoldI * call Autocomplete()
" augroup END

" Goyo


" snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]
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
nnoremap <leader>e :Vifm<cr>

inoremap <silent><expr> <tab> pumvisible() ? "<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-tab> pumvisible() ? "<C-p>" : "\<S-TAB>"

" latex
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0


inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<cr> {<cr>}<esc>O
inoremap [<cr> [<cr>]<esc>O


" for cURL
command Exec new | r !sh #
autocmd BufRead *.rest set wrap

function RESTCall()
  let l:name=expand("%:t:r")
  let l:dir=expand("%:p:h")
  let l:ext=expand("%:e")
  echo l:dir l:name l:ext
endfunction
" command Exec call RESTCall()
nnoremap <c-e> :Exec<cr>

" ctags
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules .
