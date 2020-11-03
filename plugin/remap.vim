" unmap digraphs
cmap <c-k> <Nop>

" remap enter
nnoremap <enter> @:

" remap leader
let g:mapleader = " "

" project wide search
let s:fzf_files_options = ["--layout=reverse", "--preview", "bat {} --theme=zenburn --color=always"]
command! -nargs=0 -bang GFiles call fzf#vim#gitfiles('', fzf#wrap({'options': s:fzf_files_options}), <bang>0)
nmap <c-p> <cmd>GFiles<cr>

" path wide search
fun Fzfiles()
  let fzf_dir_paths = ['$MYVIMDIR', '$GPDIR', '$HOME/.config/my_setup']
  let paths = join(map(fzf_dir_paths, {_,v -> expand(v)}))
  call fzf#run(fzf#wrap({'source': 'fdfind -t f . ' . paths, 'sink': 'e', 'options': s:fzf_files_options}))
endfun
nmap <leader>p <cmd>call Fzfiles()<cr>

" normal mode in term
tmap <C-o> <C-\><C-n>

" go directly to 5th line in fugitive
cmap G<cr> G<cr> \| ]]=

" remap CTRL-W
nmap <leader>w <C-W>

" search and replace with confirmation
nmap <leader>fw :%s/<C-R><C-W>/gc<left><left><left>
vmap <leader>fw :%s/<C-R><C-*>/gc<left><left><left>

" search occurence project wide
nmap <leader>fr :Rg 

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
nmap <silent> ]l <Cmd>execute v:count1 . " lnext"<cr>
nmap <silent> [l <Cmd>execute v:count1 . " lprev"<cr>

" go to prev/next quickfix
nmap <silent> ]q <Cmd>execute v:count1 . " cnext"<cr>
nmap <silent> [q <Cmd>execute v:count1 . " cprev"<cr>

" keep jumps
nnoremap <silent>n <Cmd>execute "keepjumps norm! " . v:count1 . "n"<CR>
nnoremap <silent>N <Cmd>execute "keepjumps norm! " . v:count1 . "N"<CR>
nnoremap <silent>} <Cmd>execute "keepjumps norm! " . v:count1 . "}"<CR>
noremap <silent>{ <Cmd>execute "keepjumps norm! " . v:count1 . "{"<CR>

" remap window switch
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" lists
nnoremap <leader>lg <cmd>CocList branches<cr>
nnoremap <leader>ld <cmd>CocList diagnostics<cr>
nnoremap <leader>lb <cmd>Buffers<cr>

" Save session
command! Ss mksession! $STPDIR/Session.vim

" open file explorer
map <silent><leader>xx <Cmd>Ex<cr>
map <silent><leader>xt <Cmd>Vex<cr>

" eurosport maps
noremap <silent><leader>xd <Cmd>Start -dir=packages/eurosport-toolkit-server yarn next:dev:hmr<cr>
noremap <silent><leader>xc <Cmd>Dispatch -dir=packages/core yarn build<cr>
noremap <silent><leader>xu <Cmd>Dispatch -dir=packages/ui yarn build<cr>
noremap <silent><leader>tf <Cmd>TestFile<cr>
noremap <silent><leader>tn <Cmd>TestNearest<cr>


" open jump fzf
nmap <leader>j <cmd>Jump<cr>
