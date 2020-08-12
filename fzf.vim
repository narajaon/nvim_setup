" Vim global plugin for correcting typing mistakes
" Last Change:  2000 Oct 15
" Maintainer: narajaon <fabienrajaonarison@gmail.com>
" License:	This file is placed in the public domain.

" change default layout
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

let s:fzf_jump_options = ["--prompt",  "Jumps>","--tac","--reverse", "--preview", "FZF_USE_DEFAULT='1' $MYVIMDIR/plugged/fzf.vim/bin/preview.sh {2}" ]
let s:curPosition = 0

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
 
  let height = 20
  let width = 120
  let horizontal = 1
  let vertical = 1
 
  let opts = {
        \ 'relative': 'cursor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
 
  call nvim_open_win(buf, v:true, opts)
endfunction

function UpNTimes(n)
  let l:i = 0
  
  " gives the popup time to load, autocmd isn't as reliable
  exe "sleep " . "15ms"

  while i < a:n
    call feedkeys("\<c-j>", 'n')
    let l:i = l:i + 1
  endwhile
endfun

function CompareJumpLists(fzfList)
  let juList = filter(split(execute(':ju'), '\n')[1:], {_,v -> v != '>'})
  let jumpList = reverse(juList)
  let s:curPosition = match(jumpList, '^>') 
  let fzfList = reverse(a:fzfList)
  let formated = map(jumpList, {i,v -> printf('%2s %s', split(v)[0], split(fzfList[i])[0])})
  return reverse(formated)
endfun

function GenerateJump()
  let Bufpath = {v -> expand("#".v.":~")}
  let sanitized = copy(getjumplist()[0])
  let stringified = map(sanitized, 'printf("%s:%s:%s", Bufpath(v:val.bufnr), v:val.lnum, v:val.col)')
  return CompareJumpLists(stringified)
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

function fzf#jump(options, isFullscreen)
  let s:curPosition = 0
  let s:saved_layout = g:fzf_layout
  let s:save_cpo = &cpo
  set cpo&vim

  call fzf#run(fzf#wrap({ 'source': GenerateJump(), 'sink': function('GoToJump'), 'options': a:options }, a:isFullscreen))
  call UpNTimes(s:curPosition)

  let g:fzf_layout = s:saved_layout
  let &cpo = s:save_cpo
  unlet s:save_cpo
endfun

" jumps
command! -bang -nargs=0 Jump call fzf#jump(s:fzf_jump_options, <bang>0)
map <nowait><leader>j :Jump<cr>
