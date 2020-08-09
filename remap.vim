" remap enter
nnoremap <enter> @@

" remap leader
let mapleader = " "

" go directly to 5th line in fugitive
cmap G<cr> G<cr> \| 5gg

" remap CTRL-W
nmap <leader>w <C-W>

" open netrwhist
nmap <silent> <leader>ff :Ex<cr>

" search and replace with confirmation
nmap <leader>fw :%s/<C-R><C-W>/gc<left><left><left>

" save with leader
nmap <leader>fs :w<cr>

" search and replace with confirmation
nmap <leader>fr :Ag<cr>

" ctrl p in command line to search in hist
cmap <C-P> <up>
cmap <C-N> <down>

" Move across wrapped lines like regular lines
noremap 0 ^" Go to the first non-blank character of a line
noremap ^" 0 Just in case you need to go to the very beginning of a line

" Switch to last-active tab
if !exists('g:Lasttab')
    let g:Lasttab = 1
    let g:Lasttab_backup = 1
endif
autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
nmap <silent>gl :exe "tabn " . g:Lasttab<cr>

" FZF
map <C-P> :GFiles<CR>
