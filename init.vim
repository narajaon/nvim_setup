call plug#begin()
  " syntax HL
  Plug 'sheerun/vim-polyglot'

  " color theme
  Plug 'andreypopp/vim-colors-plain'

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
  Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }

  " use fzf preview for coc-vim
  Plug 'antoinemadec/coc-fzf'

  " auto pairs
  Plug 'jiangmiao/auto-pairs'

  " auto change root dir
  Plug 'airblade/vim-rooter'

  " use neovim in the browser
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" All of your Plugins must be added before the following line
call plug#end()

" basic conf
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set relativenumber number
set tabstop=2 shiftwidth=2 expandtab
set mouse=a
set tags=tags
set nohlsearch
set laststatus=1
set ttimeoutlen=0
set cedit=<c-y>
set noshowmode noruler
set nobackup nowritebackup
set shortmess+=c
set undofile
set thesaurus+=~/thesaurus.txt
set dictionary+=/usr/share/dict/words

" netrw config
let g:netrw_localrmdir='rm -rf'
let g:netrw_altfile = 1
let g:neovide_fullscreen=v:true

" python provider
set pyxversion=3

let test#javascript#jest#executable = "CI=true yarn jest" " no color characters for jest outputs

syntax on

filetype plugin on

" add one space after comment
let g:NERDSpaceDelims = 1

" default folding strategy
set foldcolumn=0 "defines 1 col at window left, to indicate folding

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
colorscheme plain
