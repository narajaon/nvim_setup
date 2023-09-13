" default layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.config/fzf-history'
