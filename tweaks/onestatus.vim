let s:formated = ''

function SetCurDir()
  let cwd = getcwd()
  let s:formated = get(split(cwd, '/')[-1:], 0, 'root')
endfun

function s:getFormated()
  return s:formated
endfun

fun! s:wrap_in_quotes(text)
  return '"' . escape(a:text, '"') . '"'
endfun

fun! s:apply(line_settings) abort
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
  let s:cols = map(s:filterd, s:fmt)
  let s:res = join(s:cols, ',')
  let s:fg = get(split(get(filter(copy(s:cols), {i,v -> strcharpart(v,0,2) == 'fg'}), 0, ''), '='), 1, '')
  let s:bg = get(split(get(filter(copy(s:cols), {i,v -> strcharpart(v,0,2) == 'bg'}), 0, ''), '='), 1, '')
  return 'set-option status-style ' . s:res
endfun

fun s:getRight() abort
  let s:cur = printf("set-option status-right \"#[fg=%s,bg=%s] %s \"", s:bg, s:fg, FugitiveHead())
  return s:cur
endfun

command! TestLine call s:apply([s:getColor('GruvboxRedSign'), s:getRight()])
