" unmap digraphs
cmap <c-k> <Nop>

" save rebind
map <c-k> :w<cr>

" save rebind
inoremap <nowait><c-k> <esc>:w<cr>

" remap enter
nnoremap <enter> @:

" remap leader
let mapleader = " "

" files
let s:fzf_gfiles_options = ["--layout=reverse", "--preview", "bat {} --theme=TwoDark --color=always"]
command! -nargs=0 -bang GFiles call fzf#vim#gitfiles('', fzf#wrap({'options': s:fzf_gfiles_options}), <bang>0)
map <C-P> :GFiles<CR>

" normal mode in term
tnoremap <leader>n <c-\><c-n>

" go directly to 5th line in fugitive
cmap G<cr> G<cr> \| 5gg

" remap CTRL-W
nmap <leader>w <C-W>

" search and replace with confirmation
nmap <leader>fw :%s/<C-R><C-W>/gc<left><left><left>

" save with leader
nmap <leader>fs :w<cr>

" search and replace with confirmation
nmap <leader>fr :Ag<cr>

" Move across wrapped lines like regular lines
noremap 0 ^" Go to the first non-blank character of a line
noremap ^" 0 Just in case you need to go to the very beginning of a line

" EMACS STYLE COMMAND LINE
" start and end
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" ctrl p in command line to search in hist
cmap <C-P> <up>
cmap <C-N> <down>

" <- and ->
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

" delete character under cursor
cnoremap <C-D> <Del>

" back and forth one word
cmap <nowait><A-b> <S-Left>
cmap <nowait><A-f> <S-Right>

" go to prev/next quickfix
nmap <silent> ]q :cnext<cr>
nmap <silent> [q :cprev<cr>

" keep jumps
nnoremap <silent>n :<C-u>execute "keepjumps norm! " . v:count1 . "n"<CR>
nnoremap <silent>N :<C-u>execute "keepjumps norm! " . v:count1 . "N"<CR>
nnoremap <silent>} :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
noremap <silent>{ :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>

let s:exId = 0
function ToggleLex()
  if &ft == "netrw" || s:exId > 0
    let s:exId = 0
    exe "Lex"
  else
    let l:curdir=expand('%:p:h')
    let l:curfile=expand('%:t')
    exe "15Lex " . l:curdir
    let s:exId = win_getid()
    let l:line = search(l:curfile)
    call cursor(l:line, 0)
  endif
endfun

map <silent><leader>fx :call ToggleLex()<cr>
