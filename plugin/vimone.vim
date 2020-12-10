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
hi Include guifg=none guibg=none 
hi Structure guifg=#008EC4 guibg=none
hi Conditional guifg=#43aa8b guibg=none gui=bold
hi default link StorageClass Folded
hi default link xmlAttrib Folded
hi xmlTag guifg=none guibg=none gui=none
hi default link Include Folded
hi default link Comment Folded

" help
hi default link helpOption String

" Coc
hi CocErrorFloat guifg=#C30771 guibg=none

" JS specific
hi default link jsArrowFunction Conditional
hi default link jsTry Conditional
hi default link jsCatch Conditional
hi default link jsReturn Conditional
hi default link jsFuncCall Structure
hi default link jsClassFuncName Structure

" TS specific
hi default link typescriptIdentifierName Structure
hi default link typescriptExport Folded
hi default link typescriptImport Folded
hi default link typescriptDefault Folded
hi default link typescriptVariable Folded
hi default link jsClassKeyword Folded
hi default link jsExtendsKeyword Folded
hi default link tsxAttrib Folded
hi default link typescriptDestructureVariable Folded
hi default link typescriptObjectLabel Folded
hi default link typescriptFuncCallArg Folded
hi default link typescriptStatementKeyword Conditional
hi default link typescriptArrowFunc Conditional

nmap <leader>hg <cmd>call SynStack()<cr>
