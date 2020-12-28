" press K on an option name to see help page

" source config on file save {{{
augroup source_config
  autocmd!
  autocmd BufWritePost ~/.vimrc nested source $MYVIMRC
augroup END
" }}}
" vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

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
set showcmd noshowmode
set pastetoggle=<F3>
set wildchar=<tab> wildmenu wildmode=full
set signcolumn=yes
set omnifunc=syntaxcomplete#Complete
set completeopt+=noinsert,menuone

set laststatus=2
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬
set list

" make :find search recursively relative to the root folder
set path+=**
set wildignore=*/node_modules/*
set autoread

" plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
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
Plug 'jiangmiao/auto-pairs'
Plug 'glepnir/oceanic-material'

call plug#end()
" }}}

" colorschemes
let g:oceanic_material_allow_bold = 1
let g:oceanic_material_allow_italic = 1


colorscheme oceanic_material
set background=dark

" use 256 colors
set t_Co=256

" highlight Normal guibg=NONE ctermbg=NONE

function! LightLineBranch()
  let l:symbol = '[git]: '
  " let l:symbol = '⎇  '
  " let l:symbol = ''
  if &buftype ==# 'terminal'
    return ''
  endif

  if exists('*FugitiveHead')
    let l:branchname = FugitiveHead()

    if len(l:branchname) ==# 0
      return ''
    endif

    return l:symbol . l:branchname
  endif

  return ''
endfunction

let g:lightline = {
        \'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'LightLineBranch',
        \ },
        \ }

let g:lightline.mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ }

" remove trailing whitespaces on save
augroup remove_trailing_whitespaces
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END

" mappings
let mapleader=" "

nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <silent> <leader>x :b #<cr>:bd #<cr>

" buffers nav
nnoremap <c-h> :bp<cr>
nnoremap <c-l> :bn<cr>
tnoremap <c-h> <c-w>:bp<cr>
tnoremap <c-l> <c-w>:bn<cr>

" enter normal mode in terminal buffer
tnoremap <c-u> <c-w>N<cr>

" fzf
nnoremap <c-p> :Files<cr>
nnoremap <leader>l :Buffers<cr>

" visual selection movements
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

vnoremap < <gv
vnoremap > >gv

nnoremap <F4> :set nu!<cr>

" search and replace
" all
nnoremap <leader>rr :%s///g<left><left><left>

" with confirmation menu
nnoremap <leader>rc :%s///gc<left><left><left><left>

" under cursor
nnoremap <leader>ru :%s/\<<C-r><C-w>\>//g<left><left>

nnoremap <leader>z :Goyo<cr>
nnoremap <leader>tt :vert terminal<cr>

" jsx, scss prettier fix
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd BufNewFile,BufRead *.scss set filetype=scss.css


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
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" closetag plugin
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.phtml,*.jsx,*.js'

" ale
let g:ale_sign_error='!'
let g:ale_sign_warning='?'

let g:ale_fix_on_save = 0
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

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

map <silent> <leader>\ :call ToggleVExplorer()<CR>


" python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
