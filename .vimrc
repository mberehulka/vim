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
set encoding=UTF-8
syntax on
filetype plugin indent on

imap <C-s> <ESC>:w<CR>a
imap <C-v> <ESC>pa
imap <C-x> <ESC>dda
imap <C-t> <ESC>:tabnew<CR>a
imap <C-w> <ESC>:tabclose<CR>a

" imap <M-r> <ESC>:so %<CR>a
imap <M-r> <ESC>:so ~/.vimrc<CR>a
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
imap <M-n> <ESC>^i

imap <c-i> <ESC>:wincmd k<CR>a
imap <c-j> <ESC>:wincmd h<CR>a
imap <c-k> <ESC>:wincmd j<CR>a
imap <c-l> <ESC>:wincmd l<CR>a

imap <M-i> <ESC>O
imap <M-k> <ESC>o

imap <M-q> <Backspace>
imap <M-e> <Delete>
imap <M-S-e> X<ESC>ce
imap <M-S-q> <C-\><C-O>db

imap <M-S-i> <ESC>:m -2<CR>a
imap <M-S-k> <ESC>:m +1<CR>a
imap <M-1> <ESC>v1gta
imap <M-2> <ESC>v2gta
imap <M-3> <ESC>v3gta
imap <M-4> <ESC>v4gta
imap <M-5> <ESC>v5gta
imap <M-6> <ESC>v6gta
imap <M-7> <ESC>v7gta
imap <M-8> <ESC>v8gta
imap <M-9> <ESC>v9gta
imap <M-0> <ESC>v10gta
imap <M-u> <ESC>:tabp<CR>a
imap <M-o> <ESC>:tabn<CR>a

" Multi cursor
imap <M-S-k> <ESC><C-DOWN>
imap <M-S-i> <ESC><C-UP>

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
" m to new file and other commands

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
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/vim-lsp-icons'

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

" Use <c-space> to trigger completion
imap <silent><expr> <c-space> coc#refresh()

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

imap <F2> <ESC><Plug>(coc-rename)
imap <silent> <F12> <ESC>:call CocAction('jumpDefinition', 'tabe')<CR>a

" CheckHealth
colorscheme onedark

" Code folding
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1
set foldlevelstart=99 "start file with all folds opened

" Actions
imap <silent> <F3> <ESC>:!cargo run<CR>