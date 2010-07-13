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
set scrolloff=3                       " Start scrolling 3 lines before edge of viewport
set sidescrolloff=3                   " Same, but for columns
set ttimeoutlen=50                    " Speed up O etc in the Terminal
set virtualedit=block                 " Allow cursor to move where there is no text in visual block mode
set showmatch                         " Show matching brackets.
set mat=5                             " Bracket blinking.
set wildignore+=*.o,.git              " Patterns to ignore during file-navigation
set laststatus=2                      " Always show status line.
set lazyredraw                        " don't redraw when it's not needed

set shiftwidth=2                      " spaces per tab (when shifting)
set tabstop=2                         " spaces per tab
set expandtab                         " always use spaces instead of tabs
set smarttab                          " <tab>
set autoindent
set bs=2                              " Backspace over everything in insert mode

set guifont=Menlo\ Regular:h16.00
syntax on                             " syntax highlighting

set noerrorbells
set visualbell
set t_vb=
set shiftwidth=2  " Tabs under smart indent
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

let g:ackprg="ack -H --nocolor --nogroup --column"
map <leader>a :Ack<space>

" NERDTree
:noremap ,n :NERDTreeToggle<CR>

let VCSCommandGitExec='/usr/local/bin/git'

" scroll tabs
map <D-]> :tabnext<CR>
map <D-[> :tabprev<CR>

" Whitespace
autocmd BufWritePre *.{rb,php,erb,js,css,html,htm} :%s/\s\+$//e

" Colors 
set background=dark 
color mustang
if has("gui_macvim")
  colorscheme mustang
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

" highlight over 80 cols
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Shows what you are typing as a command
set showcmd

" Load matchit
runtime! plugins/matchit.vim

" Use O in insert mode
imap <C-O> <end><cr>

" Dont want to edit these files
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi

" Disable arrow keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" Ruby testing stuff
map <Leader>y <Plug>RubyTestRun
map <Leader>Y <Plug>RubyFileRun
let g:rubytest_in_quickfix = 1
let g:rubytest_cmd_test = "ruby -wW1 %p" 
let g:rubytest_cmd_testcase = "ruby -wW1 %p -n %c" 

augroup RUBY
  autocmd!
  autocmd BufNewFile,BufRead */test/**/*.rb,*_test.rb compiler ruby
augroup END

map <Leader>r <Plug>MakeGreen 
