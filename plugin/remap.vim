" emacs style
" start of line
:cnoremap <C-A>		<Home>
" delete character under cursor
:cnoremap <C-D>		<Del>
" end of line
:cnoremap <C-E>		<End>
" recall newer command-line
:cnoremap <C-N>		<Down>
" recall previous (older) command-line
:cnoremap <C-P>		<Up>
" back one word
:cnoremap <M-b>	<S-Left>
" forward one word
:cnoremap <M-f>	<S-Right>

" unmap digraphs
cmap <c-k> <Nop>

" remap leader
let g:mapleader = " "

" project wide search
command! -nargs=0 -bang GFiles call fzf#vim#gitfiles('', fzf#vim#with_preview(), <bang>0)

nmap <c-p> <cmd>GFiles<cr>
nmap <leader>P <cmd>CocList commands<cr>

" normal mode in term
tmap <C-o> <C-\><C-n>

" open vertically fugitive
cnoremap G<cr> vertical rightbelow G<cr> \| ]]

" remap CTRL-W
nmap <leader>w <C-W>

" search and replace with confirmation
nmap <leader>fw :%s/<C-R><C-W>/gc<left><left><left>
vmap <leader>fw :%s/<C-R><C-W>/gc<left><left><left>

" search and replace in all the project
nmap <leader>gw :vim /<C-R><C-W>/ <C-E>`git ls-files`

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
command! Ss mksession! $HOME/Session.vim
command! Sr source $HOME/Session.vim

" eurosport maps
noremap <silent><leader>xd <Cmd>Start -dir=packages/renderer yarn dev<cr>
noremap <silent><leader>xc <Cmd>Dispatch -dir=packages/core yarn build<cr>
noremap <silent><leader>xr <Cmd>Dispatch -dir=packages/core yarn prepare<cr>
noremap <silent><leader>xu <Cmd>Dispatch -dir=packages/ui yarn build<cr>
noremap <silent><leader>tf <Cmd>TestFile<cr>
noremap <silent><leader>tn <Cmd>TestNearest<cr>

" dervish
noremap <leader>df :e %/
noremap <leader>dd :!mkdir %/
noremap <leader>dD :!rm -rf 
noremap <leader>dm :!mv  

" open jump fzf
nmap <leader>j <cmd>Jump<cr>
