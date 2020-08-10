" change default layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }

" files
map <C-P> :GFiles<CR>

function NonNull(nu)
  return a:nu < 0 ? 0 : a:nu
endfun
 
function GenerateJump()
  echo getjumplist()
  let Bufpath = {v -> expand("#".v.":p")}
  let stringified = map(getjumplist()[0], 'printf("%s -H %s", Bufpath(v:val.bufnr), v:val.lnum)')
  return reverse(stringified)
endfun

function BatPreview(arg)
  call bat a:arg
endfun

function GoToJump(line)
endfun

" jumps

map <nowait><leader>j :call fzf#run(fzf#wrap({ 'source': GenerateJump(), 'sink': function('GoToJump'), 'options': ['--preview', "bat '{}' --color always --theme='OneHalfDark'"]}))<cr> 
