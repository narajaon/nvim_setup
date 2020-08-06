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

" use fzf preview for coc-vim
Plug 'antoinemadec/coc-fzf'

" auto pairs
Plug 'jiangmiao/auto-pairs'

" onedark.vim theme
Plug 'joshdick/onedark.vim'

" syntax HL
Plug 'sheerun/vim-polyglot'

" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
call plug#end()            " required
" Put your non-Plugin stuff after this line


" basic conf
set relativenumber
set termguicolors
set number
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set tags=tags
syntax on
set nohlsearch

" go directly to 5th line in fugitive
cmap G<cr> G<cr> \| 5gg

" open help and fugitive in anover vertical split
autocmd FileType help,fugitive wincmd L

" remap leader
let mapleader = " "

" add one space after comment
let g:NERDSpaceDelims = 1

" change fzf default layout
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" open netrwhist
nmap <silent> <leader>ff :Ex<cr>

" open test file
nmap <silent> <leader>ft :vs %:h.test.js<cr>

" ctrl p in command line to search in hist
cmap <C-P> <up>
cmap <C-N> <down>

" Move across wrapped lines like regular lines
noremap 0 ^" Go to the first non-blank character of a line
noremap ^" 0 Just in case you need to go to the very beginning of a line

" search and replace with confirmation
nmap <leader>fw :%s/<C-R><C-W>/gc<left><left><left>

" FZF
map <C-P> :GFiles<CR>

" onedark theme
colorscheme onedark

source ~/.config/nvim/ftplugin/javascript.vim
source ~/.config/nvim/coc.vim
