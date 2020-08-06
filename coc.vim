" list of the extensions required
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-tsserver',
            \'coc-git',
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
nmap gr <Plug>(coc-refactor)
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
