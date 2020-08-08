" calls commands in a right terminal
command! -nargs=* -complete=file Script :call CocAction('runCommand', 'script.run', <q-args>)
command! -nargs=* -complete=file Test :call CocAction('runCommand', 'script.run', 'yarn test:unit '.<q-args>)

" wrap in FZF
command! -nargs=* -complete=file Ftest :call fzf#run(fzf#wrap({'source' : split(execute(':!yarn test:unit '.<q-args>), '\(PASS|FAIL)'), 'sink': 'e'}))
