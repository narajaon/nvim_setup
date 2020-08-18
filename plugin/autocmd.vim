aug narajaon#aug
  au WinEnter,WinLeave * call s:setCurDir()
  au FileType qf,help,fugitive,man wincmd L

  if !exists('g:lastTab')
    let g:lastTab = 1
    let g:lastTab_backup = 1
  endif

  " go to last tab
  autocmd! TabLeave * let g:lastTab_backup = g:lastTab | let g:lastTab = tabpagenr()
  autocmd! TabClosed * let g:lastTab = g:lastTab_backup
  nmap <silent>gl :exe "tabn " . g:lastTab<cr>
aug end

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#00ff87' ctermfg=48 gui=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#d700ff'ctermfg=165 gui=underline
augroup END

function s:setCurDir()
  let cwd = getcwd()
  let g:cwd_formated = get(split(cwd, '/')[-1:], 0, 'root')
endfun
