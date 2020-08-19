aug narajaon#aug
  au!
  au WinEnter,WinLeave * call s:setCurDir()
  au FileType qf,help,fugitive,man wincmd L
  au WinEnter * OneStatusDefault

  if !exists('g:lastTab')
    let g:lastTab = 1
    let g:lastTab_backup = 1
  endif

  " go to last tab
  au TabLeave * let g:lastTab_backup = g:lastTab | let g:lastTab = tabpagenr()
  au TabClosed * let g:lastTab = g:lastTab_backup
  nmap <silent>gl :exe "tabn " . g:lastTab<cr>
aug END

function s:setCurDir()
  let cwd = getcwd()
  let g:cwd_formated = get(split(cwd, '/')[-1:], 0, 'root')
endfun
