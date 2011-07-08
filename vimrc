" Set leader to comma
let mapleader = ","

" Call pathogen
call pathogen#runtime_append_all_bundles()

set nocompatible      " no vi like behavior
set cf                                " Enable error files & error jumping.
set history=256                       " Number of things to remember in history.
set autowrite                         " Writes on make/shell commands
set ruler                             " Ruler on
set nu                                " Line numbers on
set nowrap                            " Line wrapping off
set timeoutlen=250                    " Time to wait after ESC (default causes an annoying delay)
set ignorecase                        " Ignore case when searching
set smartcase                         " Except when searchstring includes a capital letter
set autoread                          " Automatically pick up changes in files, like after git checkout
set scrolloff=9                       " Start scrolling 3 lines before edge of viewport
set sidescrolloff=3                   " Same, but for columns
set ttimeoutlen=50                    " Speed up O etc in the Terminal
set virtualedit=block                 " Allow cursor to move where there is no text in visual block mode
set showmatch                         " Show matching brackets.
set mat=5                             " Bracket blinking.
set wildignore+=*.o,.git,*tmp,*.png,*.jpg,*.log,*.sqlite3
set laststatus=2                      " Always show status line.
set lazyredraw                        " Don't redraw when it's not needed

set shiftwidth=2                      " Spaces per tab (when shifting)
set tabstop=2                         " Spaces per tab
set expandtab                         " Always use spaces instead of tabs
set smarttab                          " <tab>
set autoindent
set bs=2                              " Backspace over everything in insert mode

set guifont=Meslo\ LG\ S\ DZ:h14.00
syntax on                             " Syntax highlighting

" Disable visual and audio bells
set noerrorbells
set visualbell
set t_vb=
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent

" Disable backing up
set nobackup
set nowritebackup
set noswapfile

filetype on
filetype indent on
filetype plugin on
compiler ruby

" Ack
let g:ackprg="ack -H --nocolor --nogroup --column"
map <leader>a :Ack<space>

" NERDTree
:noremap ,n :NERDTreeToggle<CR>

" page through quickfix results
map <D-J> :cnext<CR>
map <D-K> :cprev<CR>

" Automatically remove trailing whitespace on save
autocmd BufWritePre *.{rb,php,erb,js,css,sass,html,htm,markdown,feature,haml} :%s/\s\+$//e

" Colors 
colorscheme sand
set cursorline                          " show the current line
if has("gui_macvim")
  set linespace=2
  set showtabline=1
  set guioptions-=m
  set guioptions-=T                       " Don't show toolbar"
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=r                       " Don't show right scrollbar
  set guioptions-=R
  set fuoptions=maxvert,maxhorz
  map <leader>f :set invfullscreen<CR>    " Switch to fullscreen
endif

" Tcomment
map <Leader>c :TComment<CR>

" Ragtag
let g:ragtag_global_maps = 1 

" Command + t
let g:CommandTMatchWindowAtTop = 1
let g:CommandTMaxHeight = 15
map <leader>p :CommandTFlush<CR>

" Shows what you are typing as a command
set showcmd

" Load matchit
runtime! plugins/matchit.vim

" Use O in insert mode
imap <C-O> <end><cr>

" Dont want to edit these files
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi

" Unbind the cursor keys in insert, normal and visual modes.
" still doesn't work in insert mode...
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Lusty Juggler
nmap <silent> <Leader>b :LustyJuggler<CR>
let g:LustyJugglerSuppressRubyWarning = 1

" fugitive
nmap <silent> <Leader>s :Gstatus<CR>

map <Leader>v :vsplit<CR>
map <Leader>s :split<CR>

:set splitright "open split on the right

" function to delete complete method
function! DeleteMethod()
  exe "norm \<esc>V"
  exe "norm %"
  exe "norm j"
  exe "norm D"
endfunction

map <Leader>d :call DeleteMethod()<CR>

" Rename :W to :w
cmap W w

let g:JSLintHighlightErrorLine = 1

set t_Co=256

" Indent and remember position
map   <silent> <F5> mmgg=G`m^
