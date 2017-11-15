" don't rever to vi
set nocompatible

execute pathogen#infect()

set encoding=utf8
set ffs=unix

set nobackup
set nowritebackup
set noswapfile

filetype on
syntax on

if has("gui_running")
  set t_CO=256
endif
set background=dark
colorscheme molokai_dark

set nocursorline
set nocursorcolumn

filetype plugin on
filetype indent on

set autoindent
set smartindent

set smarttab
set expandtab

" How many spaces to use for >> commands
set shiftwidth=2
" How many spaces are in a Tab
set tabstop=2
" Only affects editing ?
" set softtabstop=2

""" Indentation specs
autocmd FileType python  setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType haskell setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType js      setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html    setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby    setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType go      setlocal noexpandtab shiftwidth=2 tabstop=2
autocmd FileType c       setlocal noexpandtab shiftwidth=2 tabstop=2
autocmd FileType objc    setlocal noexpandtab shiftwidth=2 tabstop=2

" break lines automatically
set linebreak
" But only for really long lines
set textwidth=100
" Show a line at 80 columns
set colorcolumn=+80
" Don't ever wrap lines
set nowrap

set mouse=a
" a mousy hack
set ttymouse=xterm2

set ruler
set cmdheight=1
set laststatus=1

" set number
" set relativenumber

set wildmenu

set ignorecase
set smartcase
set hlsearch
set lazyredraw
set magic

set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" go to last edited position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" delete trailing whitespace
func! DeleteTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" do it
autocmd BufWrite *.c :call DeleteTrailingWhitespace()
autocmd BufWrite *.cc :call DeleteTrailingWhitespace()
autocmd BufWrite *.cpp :call DeleteTrailingWhitespace()
autocmd BufWrite *.h :call DeleteTrailingWhitespace()
autocmd BufWrite *.cs :call DeleteTrailingWhitespace()
autocmd BufWrite *.rb :call DeleteTrailingWhitespace()
autocmd BufWrite *.go :call DeleteTrailingWhitespace()
autocmd BufWrite *.m :call DeleteTrailingWhitespace()
autocmd BufWrite *.mm :call DeleteTrailingWhitespace()
autocmd BufWrite *.hh :call DeleteTrailingWhitespace()
autocmd BufWrite *.hs :call DeleteTrailingWhitespace()
autocmd BufWrite *.elm :call DeleteTrailingWhitespace()
autocmd BufWrite *.hpp :call DeleteTrailingWhitespace()
autocmd BufWrite *.py :call DeleteTrailingWhitespace()
autocmd BufWrite *.js* :call DeleteTrailingWhitespace()
autocmd BufWrite *.css* :call DeleteTrailingWhitespace()
autocmd BufWrite *.html* :call DeleteTrailingWhitespace()
autocmd BufWrite *.java* :call DeleteTrailingWhitespace()

let mapleader=","

" redo
nnoremap <leader>u :redo

" write buffer
nnoremap <leader><leader> :w<Return>
nnoremap <leader>w :w<Return>
nnoremap <leader>W :w!<Return>

" kill buffer
nnoremap <leader>q :q<Return>
" super kill buffer
nnoremap <leader>Q :q!<Return>

" edit vimrc
nnoremap <leader>v :vsplit $MYVIMRC<Return>
" reload vimrc
nnoremap <leader>V :so $MYVIMRC<Return>

""" Panes
" focus
nnoremap <leader>a <C-W>h
nnoremap <leader>s <C-W>j
nnoremap <leader>d <C-W>k
nnoremap <leader>f <C-W>l

" move
nnoremap <leader>A <C-W>H
nnoremap <leader>S <C-W>J
nnoremap <leader>D <C-W>K
nnoremap <leader>F <C-W>L

" new above (blank, via edit, via ranger)
nnoremap <leader>G :split<Return><C-W>j
nnoremap <leader>ge :split<Return><C-W>j:e 
nnoremap <leader>gr :split<Return><C-W>j:Ranger<Return>

" new right (blank, via edit, via ranger)
nnoremap <leader>H :vsplit<Return><C-W>l
nnoremap <leader>he :vsplit<Return><C-W>l:e 
nnoremap <leader>hr :vsplit<Return><C-W>l:Ranger<Return>

""" Tabs
" focus
nnoremap <leader>. :tabnext<Return>
nnoremap <leader>m :tabprev<Return>

" new (blank, via edit, via ranger)
nnoremap <leader>N :tabnew<Return>
nnoremap <leader>ne :tabnew<Return>:e 
nnoremap <leader>nr :tabnew<Return>:Ranger<Return>

" create, open, close fold
vnoremap <leader>z :fold<Return>
vnoremap <leader>x :foldopen<Return>
vnoremap <leader>c :foldclose<Return>

" turn highlighting on and off
nnoremap <leader>3 :set hlsearch!<Return>
" turn list mode on and off
nnoremap <leader>4 :set list!<Return>
" turn number mode on and off
nnoremap <leader>1 :set number!<Return>
" turn relativenumber mode on and off
nnoremap <leader>2 :set relativenumber!<Return>
" turn expandtab on and off
nnoremap <leader><Tab> :set expandtab!<Return>
" show digraphs
nnoremap <leader>` :digraphs<Return>

" tcomment line
nnoremap <leader>/ :TComment<Return>
nnoremap <leader>? :TCommentBlock<Return>

" surround things
nnoremap <leader>"  viw<Esc>a"<Esc>bi"<Esc>lel
nnoremap <leader>'  viw<Esc>a'<Esc>bi'<Esc>lel
nnoremap <leader>;  viw<Esc>a)<Esc>bi(<Esc>lel
nnoremap <leader>:  viw<Esc>a]<Esc>bi[<Esc>lel
nnoremap <leader>\  viw<Esc>a><Esc>bi<<Esc>lel
nnoremap <leader>\| viw<Esc>a}<Esc>bi{<Esc>lel
nnoremap <leader>#  viw<Esc>a}<Esc>bi#{<Esc>lel

" move lines
nnoremap J <Esc>:m .+1<Return>==
nnoremap K <Esc>:m .-2<Return>==
vnoremap J <Esc>:m '>+1<Return>gv=gv
vnoremap K <Esc>:m '<-2<Return>gv=gv

" escape quickly
imap jj <Esc>

set noexpandtab
set listchars=tab:░▒,trail:·,eol:‾,nbsp:·
set laststatus=2
set list

let g:ranger_map_keys = 0
map <leader>r :Ranger<Return>
