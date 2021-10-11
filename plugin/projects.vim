" eurosport related
" let s:packagePath = '~/Code/zephyr/packages'
let s:bin = 'yarn'
let s:packageDirectory = 'packages'

fun GetPackageName()
  let cwd = expand('%')
  let currentPackage = matchstr(cwd, printf('\v%s/[^/]+', s:packageDirectory))
  return currentPackage
endfun

fun s:launch(pckg, cmd, bang)
  let dispatch = a:bang ? 'Dispatch' : 'Start'
  let cmd = printf(":%s -dir=%s %s %s", dispatch, a:pckg, s:bin, a:cmd)
  echo cmd
  execute(cmd)
endfun

command! -nargs=* -bang Launch :call s:launch(GetPackageName(), <q-args>, <bang>1)
