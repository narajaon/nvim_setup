let s:formated = ''

function SetCurDir()
  let cwd = getcwd()
  let s:formated = get(split(cwd, '/')[-1:], 0, 'root')
endfun

function s:getFormated()
  return s:formated
endfun

fun s:wrap_in_quotes(text)
  return '"' . escape(a:text, '"') . '"'
endfun

fun s:apply(line_settings) abort
  let temp_file = tempname()

  try
    call writefile(a:line_settings, temp_file)
    call system("tmux source ". s:wrap_in_quotes(temp_file))
  finally
    call delete(temp_file)
  endtry
endfun

fun s:getColor(colSchem) abort
  try
    let s:hires = execute('hi ' . a:colSchem)
  catch 'E411'
    echoer 'onestatus: no color schema found'
  endtry

  let s:shires = split(s:hires)
  let s:filterd = filter(copy(s:shires), {i,v -> v =~ '\vcterm.+'})

  if (s:filterd == [])
    if (len(s:shires) > 1)
      return s:getColor(s:shires[-1])
    else
      echoer 'onestatus: no color schema found'
    endif
  endif

  let s:fmt = {i,m -> substitute(m, '\vcterm(fg|bg)\=(\d.+)',{v -> printf('%s=colour%s', v[1], v[2])}, "g")}
  let s:cols = filter(map(s:filterd, s:fmt), {i,v -> v =~ '\v^(bg|fg).+'})
  let s:res = join(s:cols, ',')
  let s:fg = get(split(get(filter(copy(s:cols), {i,v -> strcharpart(v,0,2) == 'fg'}), 0, 'fg=black'), '='), 1, '')
  let s:bg = get(split(get(filter(copy(s:cols), {i,v -> strcharpart(v,0,2) == 'bg'}), 0, 'bg=black'), '='), 1, '')
  return 'set-option status-style ' . s:res
endfun

fun s:getCwd()
  let s:cur = printf("\\~/%s", s:getFormated())
  return s:cur
endfun

fun s:getHead()
  let s:cur = printf("#[fg=%s,bg=%s] \uE0B3 %s", s:bg, s:fg, FugitiveHead())
  return s:cur
endfun

fun s:getRight() abort
  let s:cur = printf("set-option status-right \"%s %s \"", s:getCwd(), s:getHead())
  return s:cur
endfun

" TODO:
" - add cwd
" - add cfile
" - add ctime
" - add autocmd
command! TestLine call s:apply([s:getColor('CursorLineNr'), s:getRight()])
au BufEnter * TestLine
