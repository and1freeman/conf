Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier'
Plug 'ap/vim-css-color'
Plug 'alvan/vim-closetag'

" jsx, scss prettier fix
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd BufNewFile,BufRead *.scss set filetype=scss.css

" format on save
let g:prettier#autoformat=1
let g:prettier#autoformat_require_pragma=0

" closetag plugin
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.phtml,*.jsx,*.js'

" ale{{{
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
"}}}
