" eurosport related
let s:packagePath = '~/Code/zephyr/packages'
let s:bin = 'yarn'
let s:packageDirectory = 'packages'

fun GetPackageName()
  let cwd = expand('%')
  let currentPackage = matchstr(cwd, printf('\v%s/[^/]+', s:packageDirectory))
  return currentPackage
  
  " let filePath = expand('%')
  " let packagePath = printf('\v%s/[^/]+', s:packageDirectory)
  " let currentPackage = matchstr(filePath, packagePath)
  
  " if packagePath =~ ''
    " return getcwd()
  " endif

  " return currentPackage
endfun

fun s:launch(pckg, cmd, bang)
  let dispatch = a:bang ? 'Dispatch' : 'Start'
  let cmd = printf(":%s -dir=%s %s %s", dispatch, a:pckg, s:bin, a:cmd)
  echo cmd
  execute(cmd)
endfun

fun Transf(path)
  let res = split(a:path, '/')[-1]
  let p = join(split(a:path, '/')[3:], '/')
  return printf("import %s from \'@eurosport/web-toolkit/%s\'", res, p)
endfun

fun Tool(wor)
  let current = a:wor
  let path = split(system(printf("cat ./packages/core/src/index.js | grep %s", current)), "\n")[0]
  let fpath = split(path, '')[-1]
  let ffpath = substitute(join(split(fpath, '/')[1:], '/'), "'", '', 'g')
  return printf("import %s from \'@core/%s\'", current, substitute(ffpath, ";", '', 'g'))
endfun

fun Stool()
  execute(':.norm f{yi{dd')
  let imps = split(@0, ',')

  for imp in imps
    call append(line('.'), Tool(imp))
  endfor
endfun

nmap <silent><leader>tx :call Stool()<cr>
nmap <silent><leader>tt :call Transf(getline('.'))<cr>

command! -nargs=* -bang Launch :call s:launch(GetPackageName(), <q-args>, <bang>1)
