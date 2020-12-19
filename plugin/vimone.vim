function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Generic
hi! EndOfBuffer guifg=#fbfbfb guibg=#fbfbfb
hi! Folded guifg=#cccccc guibg=none
hi! Visual guifg=none guibg=#d0f5ec
hi! String guifg=#43aa8b guibg=none 
hi! Include guifg=none guibg=none 
hi! Structure guifg=#008EC4 guibg=none
hi! Conditional guifg=#43aa8b guibg=none gui=bold
hi! default link StorageClass Folded
hi! default link xmlAttrib Folded
hi! xmlTag guifg=none guibg=none gui=none
hi! default link Include Folded
hi! default link Comment Folded
hi! DiffSign guifg=#fab005 guibg=none

" help
hi! default link helpOption String

" Coc
hi! CocErrorFloat guifg=red guibg=none

nmap <leader>hg <cmd>call SynStack()<cr>
