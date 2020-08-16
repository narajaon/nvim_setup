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

  let s:snapshot = a:line_settings
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
      echoer 'onestatus; no color schema found'
    endif
  endif

  let s:fmt = {i,m -> substitute(m, '\vcterm(fg|bg)\=(\d.+)',{v -> printf('%s=colour%s', v[1], v[2])}, "g")}
  let s:res = join(map(s:filterd, s:fmt), ',')
  return s:res
endfun

command! TestLine call s:apply(['set-option status-style ' . s:getColor('NERDTreeDir')])
