set rtp+=~/Code/onestatus/

call plug#begin()
  " replacement for ntrw
  Plug 'justinmk/vim-dirvish'

  " syntax HL
  Plug 'sheerun/vim-polyglot'

  " color theme
  Plug 'andreypopp/vim-colors-plain'

  " NERD commenter
  Plug 'preservim/nerdcommenter'

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
  " Plug 'narajaon/onestatus', { 'branch': 'master' }

  " fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " auto completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " use fzf preview for coc-vim
  Plug 'antoinemadec/coc-fzf'

  " auto pairs
  Plug 'jiangmiao/auto-pairs'

  " auto change root dir
  Plug 'airblade/vim-rooter'

  " use neovim in the browser
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

  " vim theme
  Plug 'rakr/vim-one'

  Plug 'nicwest/vim-camelsnek'
call plug#end()

" basic conf
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set clipboard^=unnamed,unnamedplus
set relativenumber number

" tabsize
set tabstop=4
set shiftwidth=4
set expandtab

" Set the tab width
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

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
set inccommand=nosplit

" use ripgrep as vimgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m

" vim camelsnek
" :Camel  -> :Pascal
" :CamelB -> :Camel
let g:camelsnek_alternative_camel_commands = 1


" netrw config
let g:netrw_localrmdir='rm -rf'
let g:netrw_altfile = 1

" python provider
set pyxversion=3

let test#javascript#jest#executable = "CI=true yarn jest" " no color characters for jest outputs

filetype plugin indent on
syntax on

" add one space after comment
let g:NERDSpaceDelims = 1

" default folding strategy
set foldcolumn=0 "defines 1 col at window left, to indicate folding
set nofoldenable
set foldtext=v:folddashes

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

" project root finding strategy
let g:rooter_patterns = ['.git']

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

au ColorScheme * highlight QuickScopePrimary guifg='#00ff87' ctermfg=48 gui=underline
au ColorScheme * highlight QuickScopeSecondary guifg='#d700ff'ctermfg=165 gui=underline

set background=light        " for the light version

colorscheme plain
