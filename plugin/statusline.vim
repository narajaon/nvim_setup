let s:formated = ''

function GetFormated()
  return s:formated
endfun

set statusline=
set statusline+=%#LineNr#
set statusline+=\ %F\ 
set statusline+=%m
set statusline+=%=
set statusline+=%y\ 
set statusline+=%#Pmenu#
