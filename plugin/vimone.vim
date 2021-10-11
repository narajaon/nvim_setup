function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Generic
hi! EndOfBuffer guifg=#ffffff guibg=#ffffff
hi! Folded guifg=#cccccc guibg=none
hi! Visual guifg=none guibg=#ccff33
hi! String guifg=#1ea896 guibg=none 
hi! Include guifg=none guibg=none 
hi! Structure guifg=#8338ec guibg=none
hi! Conditional guifg=#1ea896 guibg=none gui=bold
hi! default link StorageClass Folded
hi! default link xmlAttrib Folded
hi! xmlTag guifg=none guibg=none gui=none
hi! default link Include Folded
hi! default link LineNr Folded
hi! DiffSign guifg=#ffbd00 guibg=none
hi! TabLineSel guifg=#fbfbfb guibg=#8338ec gui=none
hi! StatusLine guifg=#fbfbfb guibg=#8338ec gui=none
hi! StatusLineNC guifg=#fbfbfb guibg=#e9ecef gui=none
hi! default link VertSplit StatusLineNC
hi! default link CocUnusedHighlight WarningMsg
" remove statement bold
hi! default link Statement Normal

" help
hi! default link helpOption String

" Coc
hi! CocErrorFloat guifg=red guibg=none

nmap <leader>hg <cmd>call SynStack()<cr>
