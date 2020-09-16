let s:packagePath = "~/Code/zephyr/packages"

fun s:launch(pckg, cmd)
  execute(printf(":Dispatch -dir=packages/%s yarn %s", a:pckg, a:cmd))
endfun

fun s:getPackages(...)
  return system("ls -1 " . s:packagePath)
endfun

command! -nargs=+ -complete=custom,s:getPackages Launch :call s:launch(<f-args>)

nnoremap <leader>xd <cmd>Start -dir=packages/eurosport-toolkit-server yarn next:dev<cr>
nnoremap <leader>xc <cmd>Dispatch -dir=packages/core yarn build<cr>
nnoremap <leader>xu <cmd>Dispatch -dir=packages/ui yarn build<cr>
