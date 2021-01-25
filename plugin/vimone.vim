function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Generic
hi! EndOfBuffer guifg=#fbfbfb guibg=#fbfbfb
hi! StatusLineNC guibg=#fbfbfb guifg=#ccdbfd gui=none
hi! StatusLine guibg=#fbfbfb guifg=#abc4ff gui=none
hi! Folded guifg=#cccccc guibg=none
hi! Visual guifg=none guibg=#d0f5ec
hi! String guifg=#1ea896 guibg=none 
hi! Include guifg=none guibg=none 
hi! Structure guifg=#736ced guibg=none
hi! Conditional guifg=#1ea896 guibg=none gui=bold
hi! default link StorageClass Folded
hi! default link xmlAttrib Folded
hi! xmlTag guifg=none guibg=none gui=none
hi! default link Include Folded
hi! default link LineNr Folded
hi! DiffSign guifg=#fab005 guibg=none
hi! TabLineSel guifg=#fbfbfb guibg=#abc4ff gui=none

" remove statement bold
hi! default link Statement Normal

" help
hi! default link helpOption String

" Coc
hi! CocErrorFloat guifg=red guibg=none

nmap <leader>hg <cmd>call SynStack()<cr>
