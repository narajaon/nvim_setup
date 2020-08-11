" TODO : add default fzf cursor position

" change default layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }
let g:curPosition = 0

" files
map <C-P> :GFiles<CR>

function UpNTimes()
  let l:i = 0
  while i < g:curPosition
    call feedkeys("\<c-p>", 't')
    let l:i = l:i + 1
  endwhile
endfun

map <c-k> :w \| source $MYVIMRC<cr>

function CompareJumpLists(fzfList)
  let juList = filter(split(execute(':ju'), '\n')[1:], {_,v -> v != '>'})
  let jumpList = reverse(juList)
  let g:curPosition = match(jumpList, '^>') 
  let fzfList = reverse(a:fzfList)
  let formated = map(jumpList, {i,v -> printf('%3s %s', split(v)[0], split(fzfList[i])[0])})

  return reverse(formated)
endfun

function GenerateJump()
  let Bufpath = {v -> expand("#".v.":~")}
  let sanitized = copy(getjumplist()[0])
  let stringified = map(sanitized, 'printf("%s:%s:%s", Bufpath(v:val.bufnr), v:val.lnum, v:val.col)')
  let res = CompareJumpLists(stringified)

  call UpNTimes()

  return res
endfun

function GoToJump(line)
  let splited = split(split(a:line)[1], ':')

  try
    let [bno, lno, col] = splited
    let fullPath = expand(bno)
    let bufno = bufnr(fullPath)
    call assert_true(bufno != -1)
  catch /.*/
    echoer "GoToJump: invalid buffer"
  endtry

  exe "b " . bufno
  call setpos('.', [bufnr('%'), lno, col, 0])
endfun

function OpenJumps()
  let g:curPosition = 0
  call fzf#run(fzf#wrap({ 'source': GenerateJump(), 'sink': function('GoToJump'), 'options': ['--tac', '--preview', '$MYVIMDIR/plugged/fzf.vim/bin/preview.sh {2}', '--bind=ctrl-j:jump'] }))
endfun

" jumps
map <nowait><leader>j :call OpenJumps()<cr>
