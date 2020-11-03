" eurosport related
let s:packagePath = "~/Code/zephyr/packages"

fun GetPackageName()
  let cwd = expand('%')
  let currentPackage = matchstr(cwd, '\vpackages/[^/]+')
  return currentPackage
endfun

fun s:launch(pckg, cmd, bang)
  let dispatch = a:bang ? 'Dispatch' : 'Start'
  execute(printf(":%s -dir=%s yarn %s", dispatch, a:pckg, a:cmd))
endfun

command! -nargs=* -bang Launch :call s:launch(GetPackageName(), <q-args>, <bang>1)
