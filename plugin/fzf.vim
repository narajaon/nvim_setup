" default layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'netrwComment'],
      \ 'border':  ['fg', 'StatusLineNC'],
      \ 'prompt':  ['fg', 'netrwDir'],
      \ 'pointer': ['fg', 'netrwDir'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \'preview-fg': ['fg', 'Title'],
      \'preview-bg': ['fg', 'CocFloating'],
      \ 'header':  ['fg', 'Comment'] }
