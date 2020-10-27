command! -nargs=0 Ldev execute(printf('Dispatch -dir=%s yarn lint:dev %s', expand('%:p:h'), expand('%:p:h')))

" eurosport related
let s:packagePath = "~/Code/zephyr/packages"

fun s:launch(pckg, cmd)
  execute(printf(":Dispatch -dir=%s yarn %s", a:pckg, a:cmd))
endfun

fun s:getPackages(...)
  return system("ls -1 " . s:packagePath)
endfun

command! -nargs=* Launch :call s:launch(GetPackageName(), <q-args>)
