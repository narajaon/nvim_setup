" remap enter
nnoremap <enter> @:

" remap leader
let mapleader = " "

" files
let s:fzf_gfiles_options = ["--layout=reverse", "--preview", "bat {} --theme=TwoDark --color=always"]
command! -nargs=0 -bang GFiles call fzf#vim#gitfiles('', fzf#wrap({'options': s:fzf_gfiles_options}), <bang>0)
map <C-P> :GFiles<CR>

" save rebind
map <c-k> :w<cr>

" save rebind
inoremap <nowait><c-k> <esc>:w<cr>

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
cmap <A-b> <S-Left>
cmap <A-f> <S-Right>

" view current folder
map <silent><leader>cd :let @a=expand("%:h") \| 20Lex \| /%<cr>

" go to prev/next quickfix
nmap <silent> ]q :cnext<cr>
nmap <silent> [q :cprev<cr>

" keep jumps
nnoremap <silent>n :<C-u>execute "keepjumps norm! " . v:count1 . "n"<CR>
nnoremap <silent>N :<C-u>execute "keepjumps norm! " . v:count1 . "N"<CR>
nnoremap <silent>} :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent>{ :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>
