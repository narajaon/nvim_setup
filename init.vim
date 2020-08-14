call plug#begin()
" NERD commenter
Plug 'preservim/nerdcommenter'

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

" default layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['fg', 'GruvboxBg1'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'netrwComment'],
      \ 'border':  ['fg', 'GruvboxBg4'],
      \ 'prompt':  ['fg', 'netrwDir'],
      \ 'pointer': ['fg', 'netrwDir'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" keep jumps
nnoremap <silent>n :<C-u>execute "keepjumps norm! " . v:count1 . "n"<CR>
nnoremap <silent>N :<C-u>execute "keepjumps norm! " . v:count1 . "N"<CR>
nnoremap <silent>} :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent>{ :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>

" go to last tab
if !exists('g:Lasttab')
  let g:Lasttab = 1
  let g:Lasttab_backup = 1
endif

aug narajaon#aug
  au BufWritePost,DirChanged,BufNew,BufEnter * call SetCurDir()
  au FileType qf,help,fugitive wincmd L

  " go to last tab
  autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
  autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
  nmap <silent>gl :exe "tabn " . g:Lasttab<cr>
aug end

" add one space after comment
let g:NERDSpaceDelims = 1

" netrw doesn't affect jumps
let g:netrw_keepj = ""

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

" onedark theme
colorscheme gruvbox

source ~/.config/nvim/remap.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/fzf_jump.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/testName.vim
source ~/.config/nvim/statusline.vim
