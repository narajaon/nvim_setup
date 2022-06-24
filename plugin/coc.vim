" list of the extensions required
let g:coc_global_extensions = [
      \'coc-tabnine',
      \'coc-snippets',
      \'coc-json',
      \'coc-tsserver',
      \'coc-git',
      \'coc-eslint',
      \'coc-prettier',
      \'coc-react-refactor',
      \'coc-graphql',
      \'coc-tailwindcss',
      \'coc-yaml'
      \]

let g:coc_node_path = '~/.nvm/versions/node/v14.17.1/bin/node'
let g:coc_snippet_next = '<c-y>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K <Cmd>call <SID>show_documentation()<CR>

" Make <c-y> used for trigger completion, completion confirm, snippet expand and jump
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Select first selection
inoremap <silent><expr> <c-y> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" go to next error
nmap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev)

" search occurence project wide
nnoremap g/ :CocSearch 

" show corresponding actions
nmap <silent>ga <Plug>(coc-codeaction)

" remap gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gn <Plug>(coc-rename)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gc <Plug>(coc-refactor)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
