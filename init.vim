call plug#begin()
" NERD commenter
Plug 'preservim/nerdcommenter'

" surrounding
Plug 'tpope/vim-surround'

" Testing util
Plug 'vim-test/vim-test'

" quickscope
Plug 'unblevable/quick-scope'

" fugitive
Plug 'tpope/vim-fugitive'

" Async dispatch
Plug 'tpope/vim-dispatch'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" use fzf preview for coc-vim
Plug 'antoinemadec/coc-fzf'

" auto pairs
Plug 'jiangmiao/auto-pairs'

" onedark.vim theme
Plug 'joshdick/onedark.vim'

" gruvbox.vim theme
Plug 'morhetz/gruvbox'

" syntax HL
Plug 'sheerun/vim-polyglot'

" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'takac/vim-hardtime'

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
set laststatus=0
set ttimeoutlen=0

filetype plugin on

" add one space after comment
" let g:NERDSpaceDelims = 1
let g:netrw_liststyle = 3

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

" onedark theme
colorscheme gruvbox

source ~/.config/nvim/tweaks/onestatus.vim
source ~/.config/nvim/tweaks/autocmd.vim
source ~/.config/nvim/tweaks/remap.vim
source ~/.config/nvim/tweaks/fzf.vim
source ~/.config/nvim/tweaks/fzf_jump.vim
source ~/.config/nvim/tweaks/coc.vim
source ~/.config/nvim/tweaks/testName.vim
source ~/.config/nvim/tweaks/statusline.vim
source ~/.config/nvim/tweaks/hardtime.vim
