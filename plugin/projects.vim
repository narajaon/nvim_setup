" eurosport related
let s:packagePath = '~/Code/zephyr/packages'
let s:bin = 'yarn'
let s:packageDirectory = 'packages'

fun GetPackageName()
  let cwd = expand('%')
  let currentPackage = matchstr(cwd, printf('\v%s/[^/]+', s:packageDirectory))
  return currentPackage
endfun

fun s:launch(pckg, cmd, bang)
  let dispatch = a:bang ? 'Dispatch' : 'Start'
  execute(printf(":%s -dir=%s %s %s", dispatch, a:pckg, s:bin, a:cmd))
endfun

fun Transf(path)
  let res = split(a:path, '/')[-1]
  let p = join(split(a:path, '/')[3:], '/')
  return printf("import %s from \'@eurosport/web-toolkit/%s\'", res, p)
endfun

let s:imps = { "breakpoints" : "import breakpoints from '@eurosport/web-toolkit/breakpoints';",
      \"colors": "import colors from '@eurosport/web-toolkit/colors';",
      \"ThemeWrapper": "import ThemeWrapper from '@eurosport/web-toolkit/theme.wrapper';",
      \"typography": "import typography from '@eurosport/web-toolkit/typography';",
      \"types": "import types from '@eurosport/web-toolkit/types';",
      \}

fun Tool(wor)
  let current = a:wor
  let path = split(system(printf("cat ./packages/web-toolkit/src/index.js | grep %s", current)), "\n")[0]
  let fpath = split(path, '')[-1]
  let ffpath = substitute(join(split(fpath, '/')[1:], '/'), "'", '', 'g')
  return printf("import %s from \'@eurosport/web-toolkit/%s\'", current, substitute(ffpath, ";", '', 'g'))
endfun

fun Stool()
  execute(':.norm f{yi{dd')
  let imps = split(@0, ',')

  for imp in imps
    call append(line('.'), Tool(imp))
  endfor
endfun

command! -nargs=* -bang Launch :call s:launch(GetPackageName(), <q-args>, <bang>1)
