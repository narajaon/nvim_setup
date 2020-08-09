let s:formated = ''

function SetCurDir()
  let l:cwd = getcwd()
  let s:formated = get(split(l:cwd, '/')[-1:], 0, 'root')
endfun

function GetFormated()
  return s:formated
endfun

aug narajaon#aug
  au DirChanged,BufNew,BufEnter * call SetCurDir()
aug end

set statusline=
set statusline+=%#LineNr#
set statusline+=\ %f\ 
set statusline+=%m
set statusline+=%=
set statusline+=\ %2l:%-2c\ 
set statusline+=[%{GetFormated()}]\ 
set statusline+=%#Pmenu#
set statusline+=\ %{FugitiveHead()}\ 
