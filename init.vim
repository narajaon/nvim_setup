call plug#begin()

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" multi cursors
Plug 'terryma/vim-multiple-cursors'

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
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a

" FZF
map <C-P> :Files
imap <C-P> <esc> :Files

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" onedark theme
colorscheme onedark

source ~/.config/nvim/ftplugin/javascript.vim
source ~/.config/nvim/ftplugin/vue.vim
