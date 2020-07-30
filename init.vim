call plug#begin()
" NERD commenter
Plug 'preservim/nerdcommenter'

" quickscope
Plug 'unblevable/quick-scope'

" fugitive
Plug 'tpope/vim-fugitive'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" auto pairs
Plug 'jiangmiao/auto-pairs'

" vim-polyglot for more syntax hl
Plug 'sheerun/vim-polyglot'

" onedark.vim theme
Plug 'joshdick/onedark.vim'

" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" linting
Plug 'dense-analysis/ale'

" vim vue
Plug 'posva/vim-vue'

" All of your Plugins must be added before the following line
call plug#end()            " required
" Put your non-Plugin stuff after this line


" basic conf
set relativenumber
set number
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a

" remap leader
let mapleader = " "

" go to next error
nmap <silent> <leader>ge <Plug>(ale_next_wrap)

" open netrwhist
nmap <silent> <leader>ff :Ex<cr>

" open test file
nmap <silent> <leader>ft :vs %:h.test.js<cr>

" search recurrence in files
let wordUnderCursor=expand("<cword>")
nmap <leader>fr :Ag <C-R><C-W>

" remap jump to def and jump to ref
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" ctrl p in command line to search in hist
cmap <C-P> <up>
cmap <C-N> <down>

" save on ctrl-s
nmap <leader>ss :w<CR>

" save on ctrl-s
nmap <leader>sq :wq<CR>

" Move across wrapped lines like regular lines
noremap 0 ^" Go to the first non-blank character of a line
noremap ^" 0 Just in case you need to go to the very beginning of a line

" search and replace with confirmation
nmap <leader>fw :%s//gc<left><left><left>

" FZF
map <C-P> :GFiles<CR>
imap <C-P> <esc> :GFiles<CR>

" onedark theme
colorscheme onedark

source ~/.config/nvim/ftplugin/javascript.vim
