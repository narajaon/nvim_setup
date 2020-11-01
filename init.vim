call plug#begin()
" NERD commenter
Plug 'preservim/nerdcommenter'

" Make wildignore == .gitignore
Plug 'vim-scripts/gitignore'

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

" onestatus
Plug 'narajaon/onestatus', { 'branch': 'master' }

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

" one theme
Plug 'rakr/vim-one'

" gruvbox.vim theme
Plug 'morhetz/gruvbox'

" syntax HL
Plug 'sheerun/vim-polyglot'

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

set pyxversion=3

let test#javascript#jest#executable = "CI=true yarn jest" " no color characters for jest outputs

syntax on

filetype plugin on

" add one space after comment
let g:NERDSpaceDelims = 1

" default folding strategy
set foldmethod=indent "fold based on indent level
set foldcolumn=0 "defines 1 col at window left, to indicate folding
set foldopen=search,tag,insert

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

set background=light        " for the light version
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one
