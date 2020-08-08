let g:testExt = "test"

function GetTestName()
  let l:fileName = expand('%:t:r')
  let l:extension = expand('%:e')
  let l:testExt = "." . g:testExt . "."

  return l:fileName . l:testExt . l:extension
endfunction

" open test file
nmap <silent> <leader>ft :execute "vs " . GetTestName()<cr>
