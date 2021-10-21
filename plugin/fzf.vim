" default layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.config/fzf-history'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'netrwComment'],
      \ 'border':  ['fg', 'PmenuThumb'],
      \ 'prompt':  ['fg', 'netrwDir'],
      \ 'pointer': ['fg', 'netrwDir'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \'preview-fg': ['fg', 'String'],
      \'preview-bg': ['bg', 'fzf1'],
      \ 'header':  ['fg', 'LineNr'] }
