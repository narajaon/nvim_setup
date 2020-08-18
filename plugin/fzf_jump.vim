" Vim global plugin for correcting typing mistakes
" Maintainer: narajaon <fabienrajaonarison@gmail.com>
" License:	This file is placed in the public domain.

if exists("g:loaded_fzf_jump")
  finish
endif
let g:loaded_fzf_jump= 1

" change default layout
let g:fzf_jump_options = ["--prompt",  "Jumps>","--tac","--reverse", "--preview", "FZF_USE_DEFAULT='1' $MYVIMDIR/plugged/fzf.vim/bin/preview.sh {2}" ]

function <SID>FloatingFZF()
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

function s:UpNTimes(n)
  let l:i = 0

  " gives the popup time to load, autocmd isn't as reliable
  exe "sleep " . "15ms"

  while i < a:n
    call feedkeys("\<c-j>", 'n')
    let l:i = l:i + 1
  endwhile
endfun

function s:CompareJumpLists(fzfList)
  let juList = filter(split(execute(':ju'), '\n')[1:], {_,v -> v != '>'})
  let jumpList = reverse(juList)
  let s:curPosition = match(jumpList, '^>') 
  let fzfList = reverse(a:fzfList)
  let formated = map(jumpList, {i,v -> printf('%2s %s', split(v)[0], split(fzfList[i])[0])})
  return reverse(formated)
endfun

function s:GenerateJump()
  let Bufpath = {v -> expand("#".v.":~")}
  let sanitized = copy(getjumplist()[0])
  let stringified = map(sanitized, 'printf("%s:%s:%s", Bufpath(v:val.bufnr), v:val.lnum, v:val.col)')
  return s:CompareJumpLists(stringified)
endfun

function <SID>GoToJump(line)
  try
    let splited = split(split(a:line)[1], ':')
    let [bno, lno, col] = splited
    let fullPath = expand(bno)
    let bufno = bufnr(fullPath)
    exe "b " . bufno
    call setpos('.', [bufnr('%'), lno, col, 0])
  catch /.*/
    echoer 'oops'
    return
  endtry
endfun

function <SID>Fzf_jump(options, isFullscreen)
  let s:curPosition = 0

  let s:saved_layout = g:fzf_layout
  let g:fzf_layout = { 'window': 'FloatingFZF' }

  let s:save_cpo = &cpo
  set cpo&vim

  call fzf#run(fzf#wrap({ 'source': s:GenerateJump(), 'sink': function('<SID>GoToJump'), 'options': a:options }, a:isFullscreen))
  call s:UpNTimes(s:curPosition)

  let g:fzf_layout = s:saved_layout

  let &cpo = s:save_cpo
  unlet s:save_cpo
endfun

" jumps
if !exists(":Jump") && !exists(":FloatingFZF") && !hasmapto('<nowait><leader>j')
  command! -bang -nargs=0 Jump call <SID>Fzf_jump(fzf_jump_options, <bang>0)
  command! -nargs=0 FloatingFZF call <SID>FloatingFZF()

  " jump list
  noremap <unique> <nowait><leader>j :Jump<cr>
endif
