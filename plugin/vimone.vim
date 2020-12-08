function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Generic
hi Folded guifg=#cccccc guibg=none
hi Visual guifg=none guibg=#d0f5ec
hi String guifg=#43aa8b guibg=none 
hi String guifg=#43aa8b guibg=none 
hi Include guifg=none guibg=none 
hi StorageClass guifg=#cccccc guibg=none gui=none
hi Conditional guifg=#43aa8b guibg=none gui=bold
hi xmlAttrib guifg=#cccccc guibg=none gui=none
hi xmlTag guifg=none guibg=none gui=none
hi Include guifg=#cccccc guibg=none gui=none
hi Comment guifg=#cccccc guibg=none gui=none

" JS specific
hi jsArrowFunction guifg=#43aa8b guibg=none gui=bold
hi jsTry guifg=#43aa8b guibg=none gui=bold
hi jsCatch guifg=#43aa8b guibg=none gui=bold
hi jsReturn guifg=#43aa8b guibg=none gui=bold
hi jsFuncCall guifg=#008EC4 guibg=none gui=bold
hi jsClassFuncName guifg=#008EC4 guibg=none gui=bold

" TS specific
hi typescriptExport guifg=#cccccc guibg=none gui=none
hi typescriptImport guifg=#cccccc guibg=none gui=none
hi typescriptDefault guifg=#cccccc guibg=none gui=none
hi typescriptVariable guifg=#cccccc guibg=none gui=none
hi jsClassKeyword guifg=#cccccc guibg=none gui=none
hi jsExtendsKeyword guifg=#cccccc guibg=none gui=none
hi tsxAttrib guifg=#cccccc guibg=none gui=none
hi typescriptDestructureVariable guifg=#cccccc guibg=none gui=none
hi typescriptObjectLabel guifg=#cccccc guibg=none gui=none
hi typescriptStatementKeyword guifg=#43aa8b guibg=none gui=bold
hi typescriptArrowFunc guifg=#43aa8b guibg=none gui=bold
hi typescriptFuncCallArg guifg=#cccccc guibg=none gui=none

nmap <leader>hg <cmd>call SynStack()<cr>
