" list of the extensions required
let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-json',
            \'coc-tsserver',
            \'coc-git',
            \'coc-eslint',
            \'coc-prettier',
            \'coc-react-refactor',
            \]

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_snippet_next = '<c-y>'
imap <C-y> <Plug>(coc-snippets-expand)

" Use K to show documentation in preview window.
nnoremap <silent> K <Cmd>call <SID>show_documentation()<CR>

" go to next error
nmap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev)

" Show all diagnostics.
nmap <silent>gq <Cmd><C-u>CocFzfList diagnostics<cr>

" show corresponding actions
nnoremap <silent>ga <cmd>CocAction<cr>
vnoremap <silent>ga  <cmd>'<,'>CocAction<cr>

" remap gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gc <Plug>(coc-refactor)
