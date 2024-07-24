" map                             All maps
" nmap, nnoremap, nunmap          Normal mode
" imap, inoremap, iunmap          Insert and Replace mode
" vmap, vnoremap, vunmap          Visual and Select mode
" xmap, xnoremap, xunmap          Visual mode
" smap, snoremap, sunmap          Select mode
" cmap, cnoremap, cunmap          Command-line mode
" omap, onoremap, ounmap          Operator pending mode

set clipboard=unnamed
set backspace=indent,eol,start
set number
set scrolloff=999
set guicursor+=a:blinkon0
syntax on
filetype plugin indent on

imap <C-s> <ESC>:w<CR>a
imap <C-v> <ESC>pa
imap <C-x> <ESC>dda
imap <C-t> <ESC>:tabnew<CR>a
imap <C-w> <ESC>:tabclose<CR>a

imap <M-r> <ESC>:so %<CR>a
imap <M-z> <ESC>ua
imap <M-S-z> <ESC><C-r>a

map <M-w> <UP>
map <M-s> <DOWN>
map <M-a> <LEFT>
map <M-d> <RIGHT>
map <M-S-a> <C-LEFT>
map <M-S-d> <C-RIGHT>
map <M-m> <END>
map <M-n> <HOME>

imap <M-w> <UP>
imap <M-s> <DOWN>
imap <M-a> <LEFT>
imap <M-d> <RIGHT>
imap <M-S-a> <C-LEFT>
imap <M-S-d> <C-RIGHT>
imap <M-m> <END>
imap <M-n> <HOME>

imap <M-i> <ESC>O
imap <M-k> <ESC>o

imap <M-q> <Backspace>
imap <M-e> <Delete>
imap <M-S-e> X<ESC>ce
imap <M-S-q> <ESC>ldbi

imap <M-u> <ESC>:tabp<CR>a
imap <M-o> <ESC>:tabn<CR>a

imap <M-S-i> <ESC>:m -2<CR>a
imap <M-S-j> <ESC>:m +1<CR>a

" Visual mode
imap <M-v> <ESC>v
imap <M-S-v> <ESC>V

vmap i <ESC><ESC>a
vmap w <UP>
vmap a <LEFT>
vmap d <RIGHT>
vmap s <DOWN>
vmap <M-a> <C-LEFT>
vmap <M-d> <C-RIGHT>
vmap n <HOME>
vmap m <END>

" U -> Text to uppercase
" u -> Text to lowercase

vmap c ya
vmap x :d<CR>

" NERDTree
imap <M-f> <ESC>:NERDTreeFocus<CR>

" Plugins
" install vim-plug: https://github.com/junegunn/vim-plug
" :PlugInstall to install the plugins
" :PlugUpdate to install or update the plugins
" :PlugDiff to review the changes from the last update
" :PlugClean to remove plugins no longer in the list

call plug#begin()

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'

call plug#end()

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

" CheckHealth
