" list of the extensions required
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-tsserver',
            \'coc-git',
            \'coc-eslint',
            \'coc-react-refactor',
            \]

" go to next error
nmap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev)

" go to next quickfix
nmap <silent> ]g :cnext<cr>
nmap <silent> [g :cprev<cr>

" Show all diagnostics.
set signcolumn=yes
nmap <silent>ge :<C-u>CocFzfList diagnostics<cr>

" remap gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
