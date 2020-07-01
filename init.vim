call plug#begin()

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

" search and replace with confirmation
map <C-f> :%s//gc<left><left><left>

" FZF
map <C-P> :GFiles<CR>
imap <C-P> <esc> :GFiles<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" onedark theme
colorscheme onedark

source ~/.config/nvim/ftplugin/javascript.vim
source ~/.config/nvim/ftplugin/vue.vim
