aug narajaon#aug
  au BufWritePost,DirChanged,BufNew,BufEnter * call SetCurDir()
  au FileType qf,help,fugitive,man wincmd L

  " go to last tab
  if !exists('g:lastTab')
    let g:lastTab = 1
    let g:lastTab_backup = 1
  endif

  " go to last tab
  autocmd! TabLeave * let g:lastTab_backup = g:lastTab | let g:lastTab = tabpagenr()
  autocmd! TabClosed * let g:lastTab = g:lastTab_backup
  nmap <silent>gl :exe "tabn " . g:lastTab<cr>
aug end
