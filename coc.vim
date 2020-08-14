" list of the extensions required
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-tsserver',
            \'coc-git',
            \'coc-eslint',
            \'coc-react-refactor',
            \]

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" go to next error
nmap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev)

" go to next quickfix
nmap <silent> ]q :cnext<cr>
nmap <silent> [q :cprev<cr>

" Show all diagnostics.
nmap <silent>ge :<C-u>CocFzfList diagnostics<cr>

" remap gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gc <Plug>(coc-refactor)

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
