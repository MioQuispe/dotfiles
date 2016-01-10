:let mapleader = " "

nnoremap J 5gj
nnoremap K 5gk
noremap H ^
noremap L $
:inoremap <C-Space> <C-x><C-l>
:nnoremap Q <nop>
:noremap Q @@
:nnoremap j gj
:nnoremap k gk
map Y y$
" no highlighting on esc
nnoremap <silent> <esc> :noh<return><esc>
" sudo save
cmap w!! %!sudo tee > /dev/null %

set tabstop=4
set incsearch
set noswapfile
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
set undodir=~/.vim/undo
set undofile
set history=1000
set cursorline
set number
set scrolloff=10
set wrap
set linebreak
set autoread
set iskeyword-=_
set ruler
set ignorecase
set smartcase
set showmatch
set showcmd
set noshowmode
set gdefault

call plug#begin('~/.config/nvim/plugged')

Plug 'bkad/CamelCaseMotion'
Plug 'vim-scripts/SearchComplete'
Plug 'cohama/lexima.vim'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'ap/vim-css-color'
Plug 'KabbAmine/vCoolor.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tmhedberg/matchit'
Plug 'matze/vim-move'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'ntpeters/vim-better-whitespace'
Plug 'PeterRincker/vim-argumentative'
Plug 'ternjs/tern_for_vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'gcmt/wildfire.vim'
Plug 'tommcdo/vim-exchange'
Plug 'gregsexton/gitv'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sleuth'
Plug 'heavenshell/vim-jsdoc'
Plug 'osyo-manga/vim-over'
Plug 'junegunn/limelight.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './Install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lfilho/cosco.vim'
" Plug 'francoiscabrol/ranger.vim'
Plug 'gregsexton/Muon'
Plug 'benekastah/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'kopischke/vim-stay'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim'
Plug 'ervandew/supertab'
Plug 'mhinz/vim-grepper'

call plug#end()

colorscheme muon

" CamelCaseMotion"
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" SearchComplete

" lexima.vim
let g:lexima_enable_basic_rules = 1
let g:lexima_enable_newline_rules = 1
let g:lexima_enable_endwise_rules = 1

" TODO: FIX
" emmet-vim
inoremap <S-Space> <C-Y>,
" let g:user_emmet_leader_key='<S-Space>'

" tcomment_vim

" TODO: FIX
" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" TODO: FIX?
" vim-autoformat
noremap <F3> :Autoformat<CR>

" TODO: FIX
" vCoolor
" let g:vcoolor_map = '<leader>g'

" vim-move
let g:move_key_modifier = 'C'

" tern_for_vim
let g:tern_show_argument_hints = 'on_hold'

"undotree
nnoremap <F5> :UndotreeToggle<cr>

"wildfire.vim
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

" fzf.vim
let g:fzf_nvim_statusline = 0 " disable statusline overwriting

" nnoremap <silent> <leader>r :Buffers<CR>
nnoremap <silent> <leader>f :GitFiles<CR>
nnoremap <silent> <leader>/ :BLines<CR>
" nnoremap <silent> <leader>. :Lines<CR>
" nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>; :Commands<CR>
nnoremap <silent> <leader>r :History<CR>
" nnoremap <silent> <leader>a :execute 'Ag ' . input('Ag/')<CR>
" nnoremap <silent> K :call SearchWordWithAg()<CR>
" vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
" nnoremap <silent> <leader>gl :Commits<CR>
" nnoremap <silent> <leader>ga :BCommits<CR>

" imap <C-x><C-f> <plug>(fzf-complete-file-ag)
" imap <C-x><C-l> <plug>(fzf-complete-line)

" function! SearchWordWithAg()
"   execute 'Ag' expand('<cword>')
" endfunction
"
" function! SearchVisualSelectionWithAg() range
"   let old_reg = getreg('"')
"   let old_regtype = getregtype('"')
"   let old_clipboard = &clipboard
"   set clipboard&
"   normal! ""gvy
"   let selection = getreg('"')
"   call setreg('"', old_reg, old_regtype)
"   let &clipboard = old_clipboard
"   execute 'Ag' selection
" endfunction

" vim-grepper
nnoremap <leader>a :Grepper! -tool ag -open -switch<CR>

" cosco"
autocmd FileType javascript,css,php,html,YOUR_LANG nmap <silent> ,, :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,php,html,YOUR_LANG inoremap <silent> ,, <ESC>:call cosco#commaOrSemiColon()"<CR>a"

" ranger.vim
" map <leader>e :call OpenRanger()<CR>

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs', 'eslint', 'flow']

"IndentLine
:set list lcs=tab:\|\
let g:indentLine_char = '┆'
let g:indentLine_color_term = 0

"vim-stay
set viewoptions=cursor,folds,slash,unix

"vim-buftabline
set hidden
nnoremap <C-E> :bnext<CR>
nnoremap <C-Q> :bprev<CR>

"deoplete
let g:deoplete#enable_at_startup = 1

