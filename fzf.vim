" TODO : add default fzf cursor position

" change default layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }

" files
map <C-P> :GFiles<CR>

function NonNull(nu)
  return a:nu < 0 ? 0 : a:nu
endfun

function GenerateJump()
  let Bufpath = {v -> expand("#".v.":p")}
  let sanitized = filter(copy(getjumplist()[0]), {i,v -> filereadable(bufname(v.bufnr))})
  let stringified = map(sanitized, 'printf("%s:%s:%s", Bufpath(v:val.bufnr), v:val.lnum, v:val.col)')
  return stringified
endfun

function GoToJump(line)
  let splited = split(a:line, ':')
  exe "e " . splited[0]
  call setpos('.', [bufnr('%'), splited[1], splited[2], 0])
endfun

" jumps
map <nowait><leader>j :call fzf#run(fzf#vim#with_preview(fzf#wrap({ 'source': GenerateJump(), 'sink': function('GoToJump'), 'options': '--tac' })))<cr>
