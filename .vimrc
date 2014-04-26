" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
set nocompatible

"NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"
"
"
"Bundles
"
"
"

NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'vim-scripts/SearchComplete'
NeoBundle 'boucherm/ShowMotion'
NeoBundle 'lfilho/cosco.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'joeytwiddle/sexy_scroller.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'coderifous/textobj-word-column.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'bling/vim-airline'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'skammer/vim-css-color'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'elzr/vim-json'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'qstrahl/vim-matchmaker'
NeoBundle 'matze/vim-move'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Julian/vim-textobj-brace'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'saihoooooooo/vim-textobj-space'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'Julian/vim-textobj-variable-segment'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'mattn/livestyle-vim'
" {
"   \ 'build': {
"   \     'windows': 'make -f make_mingw32.mak',
"   \     'cygwin': 'make -f make_cygwin.mak',
"   \     'mac': 'make -f make_mac.mak',
"   \     'unix': 'make -f make_unix.mak',
"   \   },
"   \ },
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'PeterRincker/vim-argumentative'
NeoBundle 'mbbill/undotree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'int3/vim-extradite'
NeoBundle 'gcmt/wildfire.vim.git'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'gregsexton/gitv'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'groenewege/vim-less'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'beloglazov/vim-textobj-quotes'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

"
"
"
"Bundles end
"
"
"

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

colorscheme smyck

"Remove gui elements
if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

"YouCompleteMe
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_min_num_identifier_candidate_chars = 0

"Vim javascript
let g:javascript_enable_domhtmlcss = 1

"Vim motion
:highlight MotionGroup term=bold cterm=bold ctermfg=15 ctermbg=2 guibg=DarkBlue

" Keymapping
:inoremap <C-Space> <C-x><C-l>
:nnoremap Q <nop>
:noremap Q @@
:nnoremap j gj
:nnoremap k gk
:let mapleader = " "

nnoremap J 5gj
nnoremap K 5gk
noremap H ^
noremap L $

map Y y$
nnoremap + <C-a>
nnoremap - <C-x>
imap <C-c> <CR><CR><Esc>kcc

"Problem when starting vim"
nnoremap <silent> <esc> :noh<return><esc>

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

cmap w!! %!sudo tee > /dev/null %

set timeout timeoutlen=3000 ttimeoutlen=100
" set autoindent
set tabstop=4
set incsearch
set noswapfile
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
set undofile
set history=1000
set cursorline
set ttyfast
set relativenumber
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
set backspace=indent,eol,start
set nrformats-=octal
set gdefault

filetype plugin on


"syntastic"
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_enable_highlighting=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_loc_list_height=3
set laststatus=2

"airline"
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_a = '%3l %3p%%'
let g:airline_section_b = '%{getcwd()}'
let g:tagbar_compact=1
let g:tagbar_width=30

"indent guide"
" set ts=4 sw=4 et
" let g:indent_guides_enable_on_vim_startup=1
"
" let g:indent_guides_auto_colors=1

" " brolink.js"
" au InsertLeave *.html :w | :BLReloadPage
" au InsertLeave *.css :BLReloadCSS
" let g:bl_no_implystart = 1

"cosco"
autocmd FileType javascript,css,php,html,YOUR_LANG nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,php,html,YOUR_LANG inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()"<CR>a"

"sexy scroller"
:let g:SexyScroller_ScrollTime = 2
:let g:SexyScroller_CursorTime = 0
:let g:SexyScroller_MaxTime = 400
:let g:SexyScroller_EasingStyle = 3

"UltiSnips
let g:UltiSnipsExpandTrigger = "¨"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

"Vim move"
let g:move_key_modifier = 'C'

"Vim matchmaker"
let g:matchmaker_enable_startup = 1
:highlight Matchmaker guibg=DarkMagenta ctermbg=239

" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc
"

"Tern for vim
let g:tern_show_argument_hints = 'on_hold'

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>g :<C-u>Unite -no-split -buffer-name=grep    -start-insert grep<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"Unite outline
let g:unite_source_outline_indent_width = 4

"argumentative.vim
nmap <Leader>; <Plug>Argumentative_Prev
nmap <Leader>, <Plug>Argumentative_Next
xmap <Leader>; <Plug>Argumentative_XPrev
xmap <Leader>, <Plug>Argumentative_XNext

"Undotree.vim
nnoremap <F5> :UndotreeToggle<cr>

"VCSCommand
:let g:VCSCommandSplit='vertical'

" nmap t <Plug>(easymotion-sn)
" map n <Plug>(easymotion-next)
" map N <Plug>(easymotion-prev)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1

"NERDTree
" autocmd vimenter * NERDTree
map <F3> :NERDTreeToggle<CR>

"wildfire.vim
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]
" emmet.vim
imap <S-Space> <C-y>,

NeoBundleCheck
