" lightline {{{

Plug 'itchyny/lightline.vim'



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

" let g:lightline.mode_map = {
"         \ 'n' : 'N',
"         \ 'i' : 'I',
"         \ 'R' : 'R',
"         \ 'v' : 'V',
"         \ 'V' : 'VL',
"         \ "\<C-v>": 'VB',
"         \ 'c' : 'C',
"         \ 's' : 'S',
"         \ 'S' : 'SL',
"         \ "\<C-s>": 'SB',
"         \ 't': 'T',
"         \ }
"}}}
