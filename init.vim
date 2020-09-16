set rtp+=/home/fabien/Code/onestatus

call plug#begin()
" NERD commenter
Plug 'preservim/nerdcommenter'

" zen mode
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" note taking and stuff
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" css color highlight
Plug 'ap/vim-css-color'

" add custom text objects
Plug 'kana/vim-textobj-user'

" surrounding
Plug 'tpope/vim-surround'

" Testing util
Plug 'vim-test/vim-test'

" quickscope
Plug 'unblevable/quick-scope'

" file explorer
Plug 'tpope/vim-vinegar'

" fugitive
Plug 'tpope/vim-fugitive'

" Async dispatch
Plug 'tpope/vim-dispatch'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" use fzf preview for coc-vim
Plug 'antoinemadec/coc-fzf'

" auto pairs
Plug 'jiangmiao/auto-pairs'

" onedark.vim theme
Plug 'joshdick/onedark.vim'

" onehalf.vim theme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" gruvbox.vim theme
Plug 'morhetz/gruvbox'

" syntax HL
Plug 'sheerun/vim-polyglot'

" puts a timer on hjkl
Plug 'takac/vim-hardtime'

" auto change root dir
Plug 'airblade/vim-rooter'

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
set nohlsearch
set laststatus=1
set ttimeoutlen=0
set cedit=<c-y>
set noshowmode noruler
set clipboard+=unnamedplus

syntax on

filetype plugin on

" add one space after comment
let g:NERDSpaceDelims = 1

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

" project root finding strategy
let g:rooter_patterns = ['.git', 'Makefile']

" vimwiki path
let g:vimwiki_list = [{'path': '~/.config/my_setup/wiki', 'path_html': '~/public_html/'}]

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

au ColorScheme * highlight QuickScopePrimary guifg='#00ff87' ctermfg=48 gui=underline
au ColorScheme * highlight QuickScopeSecondary guifg='#d700ff'ctermfg=165 gui=underline

" onedark theme
" colorscheme onehalflight
colorscheme onehalflight
