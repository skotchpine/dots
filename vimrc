" don't revert to vi
set nocompatible

set viminfo+=n~/.config/viminfo

execute pathogen#infect()

set encoding=utf8
set ffs=unix

set nobackup
set nowritebackup
set noswapfile

filetype on
syntax on

"set t_CO=256
set background=dark
"colorscheme apprentice
colorscheme blaquemagick
"colorscheme 0x7A69_dark
"color blackboard
"color base16-railscasts

set re=0

set cursorline
set cursorcolumn
hi clear CursorLine
hi clear CursorColumn
hi CursorLine term=reverse ctermbg=234
hi CursorColumn term=reverse ctermbg=234

if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  " let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  " let &t_EI = "\<Esc>]12;red\x7"
  " silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  " autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

"set noshowmode
"set laststatus=0
"set noshowcmd

set showmode
set laststatus=1
set showcmd

filetype plugin on
filetype indent on

set autoindent
set smartindent

set smarttab
set expandtab

set backspace=2

" How many spaces to use for >> commands
set shiftwidth=2
" How many spaces are in a Tab
set tabstop=2
" Only affects editing ?
" set softtabstop=2

""" Swap filetypes
call jspretmpl#register_tag('pug', 'pug')
augroup filetypedetect
  autocmd BufNewFile,BufRead,BufReadPost *.jsx set filetype=javascript
  autocmd BufNewFile,BufRead,BufReadPost *.jsx JsPreTmpl
augroup END

""" Indentation specs
autocmd FileType sh              setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType bash            setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType python          setlocal expandtab   shiftwidth=4 tabstop=4
autocmd FileType haskell         setlocal expandtab   shiftwidth=4 tabstop=4
autocmd FileType js              setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType json            setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType javascript      setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType javascript.jsx  setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType javascriptreact setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType typescript      setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType typescript.jsx  setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType pug             setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType sass            setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType html            setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType ruby            setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType go              setlocal noexpandtab shiftwidth=2 tabstop=2
autocmd FileType c               setlocal noexpandtab shiftwidth=2 tabstop=2
autocmd FileType make            setlocal noexpandtab shiftwidth=2 tabstop=2
autocmd FileType objc            setlocal noexpandtab shiftwidth=2 tabstop=2
autocmd FileType scala           setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType sbt             setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType yaml            setlocal expandtab   shiftwidth=2 tabstop=2
autocmd FileType docker-compose  setlocal expandtab   shiftwidth=2 tabstop=2

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
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

set ruler
set cmdheight=1

"set nonumber
" set relativenumber

set wildmenu

set ignorecase
set smartcase
set hlsearch
set incsearch
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

" add another CtrlP binding
nnoremap <leader>t :CtrlP<Return>

" new above (blank, via edit, ranger, ctrlp)
nnoremap <leader>G :split<Return><C-W>j
nnoremap <leader>ge :split<Return><C-W>j:e 
nnoremap <leader>gr :split<Return><C-W>j:Ranger<Return>
nnoremap <leader>gt :split<Return><C-W>j:CtrlP<Return>

" new right (blank, via edit, ranger, ctrlp)
nnoremap <leader>H :vsplit<Return><C-W>l
nnoremap <leader>he :vsplit<Return><C-W>l:e 
nnoremap <leader>hr :vsplit<Return><C-W>l:Ranger<Return>
nnoremap <leader>ht :vsplit<Return><C-W>l:CtrlP<Return>

""" Tabs
" focus
nnoremap <leader>. :tabnext<Return>
nnoremap <leader>m :tabprev<Return>

" new (blank, via edit, ranger, ctrlp)
nnoremap <leader>N :tabnew<Return>
nnoremap <leader>ne :tabnew<Return>:e 
nnoremap <leader>nr :tabnew<Return>:Ranger<Return>
nnoremap <leader>nt :tabnew<Return>:CtrlP<Return>

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

" nerd comment line / block
nnoremap <leader>/ :call NERDComment('', 'toggle')<Return>
vnoremap <leader>/ :call NERDComment('', 'toggle')<Return>
nnoremap <leader>? vip:call NERDComment('', 'toggle')<Return>
noremap <leader>? ip:call NERDComment('', 'toggle')<Return>

" surround things
nnoremap <leader>"  viw<Esc>a"<Esc>bi"<Esc>lel
nnoremap <leader>'  viw<Esc>a'<Esc>bi'<Esc>lel
nnoremap <leader>;  viw<Esc>a)<Esc>bi(<Esc>lel
nnoremap <leader>:  viw<Esc>a]<Esc>bi[<Esc>lel
nnoremap <leader>\  viw<Esc>a><Esc>bi<<Esc>lel
nnoremap <leader>\| viw<Esc>a}<Esc>bi{<Esc>lel
nnoremap <leader>#  viw<Esc>a}<Esc>bi#{<Esc>lel
nnoremap <leader><  viw<Esc>a`<Esc>bi`<Esc>lel

" move lines
nnoremap <C-j> <Esc>:m .+1<Return>==
nnoremap <C-k> <Esc>:m .-2<Return>==
vnoremap <C-j> <Esc>:m '>+1<Return>gv=gv
vnoremap <C-k> <Esc>:m '<-2<Return>gv=gv

" escape quickly
imap jj <Esc>

" Require clojure namespace
nnoremap <leader>R :Require<Return>
nnoremap <leader><C-r> :Require!<Return>

set expandtab
set listchars=tab:░▒,trail:·,eol:‾,nbsp:·
"set laststatus=2
set list

nnoremap <leader>P :Piggieback (figwheel-sidecar.repl-api/repl-env)<Return>

let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
map <leader>r :Ranger<Return>

"
" NERDComment
"
" Don't suggest opening some files
let g:ctrlp_custom_ignore = 'node_modules\|compiled'

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"
" Pug in React
"
autocmd FileType jsx JsPreTmpl
autocmd FileType typescript syn clear foldBraces
autocmd FileType typescript JsPreTmpl
