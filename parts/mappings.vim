" mappings

let mapleader=" "

" basic
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>

" DeleteCurrentlyOpenBuffer function{{{
function! DeleteCurrentlyOpenBuffer()"
  let l:buffers_number =  len(getbufinfo({ 'buflisted': 1 }))
  if l:buffers_number > 1
    exec ":bp"
    exec ":bdelete #"
  endif
endfunction
"}}}

" delete current buffer and remove from buffers list
nnoremap <leader>x :call DeleteCurrentlyOpenBuffer()<cr>

nnoremap <leader>f :e **/

" buffers nav
nnoremap <c-h> :bp<cr>
nnoremap <c-l> :bn<cr>
tnoremap <c-h> <c-w>:bp<cr>
tnoremap <c-l> <c-w>:bn<cr>

" terminal
nnoremap <leader>t :terminal<cr>

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
nnoremap <F5> :set rnu!<cr>

" search and replace
" all
nnoremap <leader>rr :%s///g<left><left><left>

" under cursor
nnoremap <leader>ru :%s/\<<C-r><C-w>\>//g<left><left>

" with confirmation menu
nnoremap <leader>rc :%s/\<<C-r><C-w>\>//gc<left><left><left>

inoremap <silent><expr> <tab> pumvisible() ? "<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-tab> pumvisible() ? "<C-p>" : "\<S-TAB>"

" SaveCurrentSession function{{{
function! SaveCurrentSession()
  if strlen(v:this_session) > 0
    let l:session_name = v:this_session
  else
    let l:session_name = input('Enter new session filename: ')
  endif

  exec ":wa"
  exec ":mksession! " . l:session_name
endfunction
"}}}

" save current session or create new one
nnoremap <F2> :call SaveCurrentSession()<cr>
nnoremap <F3> :source ~/.vimrc<cr>
