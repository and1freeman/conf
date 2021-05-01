" press K on an option name to see help page

source ~/.vim/parts/autocmds.vim
source ~/.vim/parts/general.vim
source ~/.vim/parts/mappings.vim
source ~/.vim/parts/netrw.vim

" plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
" Plug 'lervag/vimtex'
" Plug 'vifm/vifm.vim'

" source ~/.vim/parts/lightline.vim
source ~/.vim/parts/javascript.vim

call plug#end()
" }}}

colorscheme gruvbox
set background=dark

" use 256 colors
set t_Co=256

source ~/.vim/parts/plugins.vim

" see ~/.ctags for exclusions and js patterns
command! MakeTags !ctags -R .

" " ctags{{{
" function! MakeTags(...)
"   let l:exclude = ['.git', 'node_modules', 'android', 'ios']

"   if len(a:000) > 0
"     let l:exclude += a:000
"   endif

"   let l:cmd = "ctags -R --exclude={" . join(l:exclude, ',') . "} ."

"   silent let output = system(l:cmd)

"   let l:error = v:shell_error

"   execute "redraw!"

"   if l:error != 0
"     echo output
"   endif

" endfunction
"}}}
