command! LogAutocmds call s:log_autocmds_toggle()
let s:activate = 0

function! s:log_autocmds_toggle()
  let s:activate = !s:activate
  augroup LogAutocmd
    autocmd!
  augroup END

  let l:date = strftime('%F', localtime())
  if s:activate == 0
    call s:log('Stopped autocmd log (' . l:date . ')')
    return
  endif

  call s:log('Started autocmd log (' . l:date . ')')
  augroup LogAutocmd
    for l:au in s:aulist
      call execute(printf("autocmd %s * call s:log('%s')", l:au, l:au))
    endfor
  augroup END
endfunction

function! s:log(message)
  echo a:message
  silent execute '!echo "'
        \ . strftime('%T', localtime()) . ' - ' . a:message . '"'
        \ '>> /tmp/vim_log_autocommands'
endfunction

" These are deliberately left out due to side effects
" - SourceCmd
" - FileAppendCmd
" - FileWriteCmd
" - BufWriteCmd
" - FileReadCmd
" - BufReadCmd
" - FuncUndefined

let s:aulist = [
      \ 'BufNewFile',
      \ 'BufReadPre',
      \ 'BufRead',
      \ 'BufReadPost',
      \ 'FileReadPre',
      \ 'FileReadPost',
      \ 'FilterReadPre',
      \ 'FilterReadPost',
      \ 'StdinReadPre',
      \ 'StdinReadPost',
      \ 'BufWrite',
      \ 'BufWritePre',
      \ 'BufWritePost',
      \ 'FileWritePre',
      \ 'FileWritePost',
      \ 'FileAppendPre',
      \ 'FileAppendPost',
      \ 'FilterWritePre',
      \ 'FilterWritePost',
      \ 'BufAdd',
      \ 'BufCreate',
      \ 'BufDelete',
      \ 'BufWipeout',
      \ 'BufFilePre',
      \ 'BufFilePost',
      \ 'BufEnter',
      \ 'BufLeave',
      \ 'BufWinEnter',
      \ 'BufWinLeave',
      \ 'BufUnload',
      \ 'BufHidden',
      \ 'BufNew',
      \ 'SwapExists',
      \ 'FileType',
      \ 'Syntax',
      \ 'EncodingChanged',
      \ 'TermChanged',
      \ 'VimEnter',
      \ 'GUIEnter',
      \ 'GUIFailed',
      \ 'TermResponse',
      \ 'QuitPre',
      \ 'VimLeavePre',
      \ 'VimLeave',
      \ 'FileChangedShell',
      \ 'FileChangedShellPost',
      \ 'FileChangedRO',
      \ 'ShellCmdPost',
      \ 'ShellFilterPost',
      \ 'CmdUndefined',
      \ 'SpellFileMissing',
      \ 'SourcePre',
      \ 'VimResized',
      \ 'FocusGained',
      \ 'FocusLost',
      \ 'CursorHold',
      \ 'CursorHoldI',
      \ 'CursorMoved',
      \ 'CursorMovedI',
      \ 'WinEnter',
      \ 'WinLeave',
      \ 'TabEnter',
      \ 'TabLeave',
      \ 'CmdwinEnter',
      \ 'CmdwinLeave',
      \ 'InsertEnter',
      \ 'InsertChange',
      \ 'InsertLeave',
      \ 'InsertCharPre',
      \ 'TextChanged',
      \ 'TextChangedI',
      \ 'ColorScheme',
      \ 'RemoteReply',
      \ 'QuickFixCmdPre',
      \ 'QuickFixCmdPost',
      \ 'SessionLoadPost',
      \ 'MenuPopup',
      \ 'CompleteDone',
      \ 'User',
      \ ]

aug narajaon#aug
  au!
  au BufEnter,BufLeave,FocusGained * :OneStatus
  au VimLeave * :OneStatusClean
  au FileType qf,help,fugitive,man wincmd L
  au BufEnter * let test#project_root=GetPackageName() " changes vim-test's root for monorepos
  au BufUnload,BufWrite * setlocal foldmethod=manual
  au BufWinEnter,BufWritePost * setlocal foldmethod=indent
  au FileType dirvish nnoremap <buffer><silent> <c-p> <cmd>GFiles<cr>

  if !exists('g:lastTab')
    let g:lastTab = 1
    let g:lastTab_backup = 1
  endif

  " go to last tab
  au TabLeave * let g:lastTab_backup = g:lastTab | let g:lastTab = tabpagenr()
  au TabClosed * let g:lastTab = g:lastTab_backup
  nmap <silent>gl :exe "tabn " . g:lastTab<cr>
aug END
