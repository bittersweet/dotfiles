" Set leader to comma
let mapleader = ","

" Call pathogen
call pathogen#runtime_append_all_bundles()

set nocompatible                      " No vi like behavior
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
set scrolloff=9                       " Start scrolling 9 lines before edge of viewport
set sidescrolloff=3                   " Same, but for columns
set ttimeoutlen=50                    " Speed up O etc in the Terminal
set virtualedit=block                 " Allow cursor to move where there is no text in visual block mode
set showmatch                         " Show matching brackets.
set mat=5                             " Bracket blinking.
set laststatus=2                      " Always show status line.
set lazyredraw                        " Don't redraw when it's not needed
set wildmenu
set wildignore+=*.o,.git,*tmp,*.png,*.jpg,*.log,*.sqlite3

set shiftwidth=2                      " Spaces per tab (when shifting)
set tabstop=2                         " Spaces per tab
set expandtab                         " Always use spaces instead of tabs
set smarttab                          " <tab>
set bs=2                              " Backspace over everything in insert mode

set guifont=Meslo\ LG\ S\ DZ:h14.00
syntax on                             " Syntax highlighting

" Disable visual and audio bells
set noerrorbells
set visualbell
set t_vb=
set nocp incsearch

" Formatting and indentation options
set autoindent
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
noremap ,n :NERDTreeToggle<CR>

" page through quickfix results with cmd-J cmd-K
map <D-J> :cnext<CR>
map <D-K> :cprev<CR>

" Automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Colors
colorscheme Zenburn
set cursorline                          " show the current line
if has("gui_macvim")
  colorscheme Espresso
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
map <leader>c :TComment<CR>

" Ragtag
let g:ragtag_global_maps = 1

" Ctrl-P
let g:ctrlp_map = '<leader>t'
map <leader>p :CtrlPClearCache<CR>

" Shows what you are typing as a command
set showcmd

" Load matchit
runtime! plugins/matchit.vim

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

" Binds for vertical and horizontal splits
map <Leader>v :vsplit<CR>
map <Leader>s :split<CR>

" Open split on the right
set splitright

" function to delete complete method
function! DeleteMethod()
  exe "norm \<esc>V"
  exe "norm %"
  exe "norm j"
  exe "norm D"
endfunction

map <Leader>d :call DeleteMethod()<CR>

" Set colors to 256
set t_Co=256

" Indent and remember position
map <silent><F5> mmgg=G`m^

" Toggle the quickfix window
function! QfToggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor

  copen
endfunction

map <Leader>q :call QfToggle()<CR>

" Disable manual key
nnoremap K <nop>
vnoremap K <nop>

" Handle often made typing errors
command W w
command Wq wq
command Q q
command Qa qa

" Don't display full paths
let g:Powerline_stl_path_style = 'short'
