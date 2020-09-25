aug narajaon#aug
  au!
  au BufEnter,BufLeave * :OneStatus
  au FileType qf,help,fugitive,man wincmd L
  au BufEnter * let test#project_root=GetPackageName() " changes vim-test's root for monorepos

  if !exists('g:lastTab')
    let g:lastTab = 1
    let g:lastTab_backup = 1
  endif

  " go to last tab
  au TabLeave * let g:lastTab_backup = g:lastTab | let g:lastTab = tabpagenr()
  au TabClosed * let g:lastTab = g:lastTab_backup
  nmap <silent>gl :exe "tabn " . g:lastTab<cr>
aug END
