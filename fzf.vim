" change default layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }

" files
map <C-P> :GFiles<CR>

function NonNull(nu)
  return a:nu < 0 ? 0 : a:nu
endfun

function GenerateJump()
  echo getjumplist()
  let stringified = map(getjumplist()[0], {i, v -> 'bat '. bufname(v.bufnr) . ' -r ' . NonNull(str2nr(v.lnum) - 10) . ':' . (str2nr(v.lnum) + 10)})
  return stringified
endfun

function GoToJump(line)
endfun

" jumps

map <nowait><leader>j :call fzf#run(fzf#wrap({ 'source': GenerateJump(), 'sink': function('GoToJump'), 'options': [ '--preview', 'eval ${}']}))<cr> 
