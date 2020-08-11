" TODO : add default fzf cursor position

" change default layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }

" files
map <C-P> :GFiles<CR>

function CompareJumpLists(fzfList)
  let juList = filter(split(execute(':ju'), '\n')[1:], {i,v -> v != '>'})
  let jumpList = reverse(juList)
  let fzfList = reverse(a:fzfList)
  echo len(jumpList)
  echo len(fzfList)
  let formated = map(jumpList, {i,v -> printf('%3s %s', split(v)[0], split(fzfList[i])[0])})

  return reverse(formated)
endfun

function GenerateJump()
  let Bufpath = {v -> expand("#".v.":p")}
  let sanitized = copy(getjumplist()[0])
  let stringified = map(sanitized, 'printf("%s:%s:%s", Bufpath(v:val.bufnr), v:val.lnum, v:val.col)')

  return CompareJumpLists(stringified)
endfun

function GoToJump(line)
  let splited = split(a:line, ':')

  try
    let [bno, lno, col] = splited
    let bufno = bufnr(bno)
    assert_true(bufno != -1)
  catch /.*/
    echoer "GoToJump: invalid buffer"
  endtry

  exe "b " . bufno
  call setpos('.', [bufnr('%'), lno, col, 0])
endfun

" jumps
map <nowait><leader>j :call fzf#run(fzf#vim#with_preview(fzf#wrap({ 'source': GenerateJump(), 'sink': function('GoToJump'), 'options': '--tac' })))<cr>
" map <nowait><leader>j :call GenerateJump()<cr>
