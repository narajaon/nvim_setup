let s:packagePath = "~/Code/zephyr/packages"
let s:packages = split(system("ls -1 " . s:packagePath), '\n')

fun s:launch(pckg, cmd)
  execute(printf(":Dispatch -dir=packages/%s yarn %s", a:pckg, a:cmd))
endfun

fun s:getPackages(A,L,P)
  return filter(s:packages, printf('v:val =~ "^%s"', a:A))
endfun

command! -nargs=+ -complete=customlist,s:getPackages Launch :call s:launch(<f-args>)
