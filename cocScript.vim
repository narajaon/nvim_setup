" calls commands in a right terminal
command! -nargs=* -complete=file Script :call CocAction('runCommand', 'script.run', <q-args>)
command! -nargs=* -complete=file Test :call CocAction('runCommand', 'script.run', 'yarn test:unit '.<q-args>)

function s:formatLine(_, val)
  if match(a:val, 'PASS\|FAIL')
    return trim(a:val)
  endif
  return ''
endfun

function FormatErrors(ars)
  let l:lines = split(execute(':!yarn test:unit '.a:ars), '\n')
  let l:formatedLines = map(l:lines, function('s:formatLine'))

  return formatedLines
endfun

" wrap in FZF
command! -nargs=* -complete=file Ftest :call fzf#run(fzf#wrap({'source' : FormatErrors(<q-args>), 'sink': 'e'}))
