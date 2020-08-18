" TODO:
" - add ctime
" - refacto before publish
command! -nargs=* OneStatus :call s:apply(s:buildLine([ s:right(), s:curwin(), s:winlist(), s:left()]))

if exists('g:loaded_onestatus')
  finish
endif

let g:cwd_formated = ''
let s:cur = ""
let s:loaded_onestatus = 1

function s:getFormated()
  return g:cwd_formated
endfun

function s:getHead()
  let s:head = FugitiveHead()
  if (s:head == "")
    return ""
  endif
  return printf("  %s ", s:head)
endfun

fun s:wrap_in_quotes(text)
  return '"' . escape(a:text, '"') . '"'
endfun

fun s:apply(line_settings) abort
  try
    let s:save_cpo = &cpo
    set cpo&vim
    let temp_file = tempname()
    call writefile(add(a:line_settings, s:getColor('NvimOperator')), temp_file)
    call system("tmux source ". s:wrap_in_quotes(temp_file))
  finally
    let &cpo = s:save_cpo
    unlet s:save_cpo
    call delete(temp_file)
  endtry
endfun

fun s:getColor(colSchem) abort
  try
    let s:hires = execute('hi ' . a:colSchem)
  catch 'E411'
  endtry
  let s:shires = split(s:hires)
  let s:filterd = filter(copy(s:shires), {i,v -> v =~ '\vcterm.+'})
  if (s:filterd == [])
    if (len(s:shires) > 1)
      return s:getColor(s:shires[-1])
    else
    endif
  endif
  let s:fmt = {i,m -> substitute(m, '\vcterm(fg|bg)\=(\d.+)',{v -> printf('%s=colour%s', v[1], v[2])}, "g")}
  let s:cols = filter(map(s:filterd, s:fmt), {i,v -> v =~ '\v^(bg|fg).+'})
  let s:res = join(s:cols, ',')
  let s:fg = get(split(get(filter(copy(s:cols), {i,v -> strcharpart(v,0,2) == 'fg'}), 0, 'fg=black'), '='), 1, '')
  let s:bg = get(split(get(filter(copy(s:cols), {i,v -> strcharpart(v,0,2) == 'bg'}), 0, 'bg=black'), '='), 1, '')
  return 'set-option status-style ' . s:res
endfun

fun s:buildSection(attrs)
  let s:bg = get(a:attrs, 'bg', '')
  let s:fg = get(a:attrs, 'fg', '')
  let s:label = get(a:attrs, 'label', '')
  let s:parts = printf('#[fg=%s,bg=%s]%s', s:fg, s:bg, s:label ? s:label : ' '.s:label)
  return s:parts
endfun

fun s:buildPart(sections)
  let s:part = [] 
  for sect in a:sections.attributes
    call add(s:part, s:buildSection(sect))
  endfor
  let s:res =  printf('%s "%s"', a:sections.command, join(s:part, ''))
  return s:res
endfun

fun s:buildLine(parts)
  let s:status = []
  for sections in a:parts
    call add(s:status, s:buildPart(sections))
  endfor
  return s:status
endfun

"set-option -g status-right
let s:right = { -> {'command': 'set-option -g status-right', 'attributes': [{"fg": "#ffd166", "bg": "default", "label": ""},{"fg": "#26547c", "bg": "#ffd166", "label": "~/" . s:getFormated()}, {"fg": "#26547c","bg": "#ffd166", "label": ""}, {"fg": "#fcfcfc", "bg": "#26547c", "label": printf('[%s]', &filetype)}, {"fg": "#218380","bg": "#26547c", "label": ""}, {"fg": "#fcfcfc", "bg": "#218380", "label": s:getHead()}]}} 

" set-window-option -g window-status-current-style 
let s:curwin = { -> {'command': 'set-window-option -g window-status-current-style ', 'attributes': [{"fg": '#6c757d', "bg": 'default'}]}}

" set-window-option -g window-status-style
let s:winlist = { -> {'command': 'set-window-option -g window-status-style', 'attributes': [{"fg": '#fcfcfc', "bg": 'default'}]}}

"set-option -g status-left
let s:left = { -> {'command': 'set-option -g status-left', 'attributes': [{"fg": "#6c757d", "label": "#H"}]}}
