let s:formated = ''

function GetFormated()
  return s:formated
endfun

set statusline=
set statusline+=%#LineNr#
set statusline+=\ %f\ 
set statusline+=%m
set statusline+=%=
set statusline+=\ %2l:%-2c\ 
set statusline+=/%{GetFormated()}\ 
set statusline+=%y\ 
set statusline+=%#Pmenu#
set statusline+=\ %{FugitiveHead()}\ 
