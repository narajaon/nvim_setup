" list of the extensions required
let g:coc_global_extensions = [
      \'coc-snippets',
      \'coc-json',
      \'coc-tsserver',
      \'coc-git',
      \'coc-eslint',
      \'coc-prettier',
      \'coc-react-refactor',
      \'coc-graphql'
      \]

let g:coc_node_path = '~/.nvm/versions/node/v14.15.0/bin/node'

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

let g:coc_snippet_next = '<c-y>'

inoremap <silent><expr> <c-y>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<c-y>" :
      \ coc#refresh()

" go to next error
nmap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev)

" search occurence project wide
nmap <leader>fr :CocSearch 

" Show all diagnostics.
nmap <silent>gq <Cmd><C-u>CocFzfList diagnostics<cr>

" show corresponding actions
nnoremap <silent>ga <cmd>CocAction<cr>
vnoremap <silent>ga  <cmd>'<,'>CocAction<cr>

" remap gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gc <Plug>(coc-refactor)
