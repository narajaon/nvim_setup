let g:testExt = "test"

function GetTestName()
  let l:fileName = expand('%:p:r:r')
  let l:extension = expand('%:e')
  let l:testExt = "." . g:testExt . "."

  return l:fileName. l:testExt . l:extension
endfunction

" open test file
nmap <silent> <leader>ft <Cmd>execute "vs " . GetTestName()<cr>
