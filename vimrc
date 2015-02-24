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
set nofoldenable                      " disable folding"

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
let NERDTreeHijackNetrw=0

" page through quickfix results with cmd-J cmd-K
map <D-J> :cnext<CR>
map <D-K> :cprev<CR>

" Automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Set tabstop to 4 for JS
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" Colors
" let g:hybrid_use_iTerm_colors = 1
" colorscheme hybrid
" set background=dark
let g:lucius_style='light'
let g:lucius_contrast='high'
let g:lucius_contrast_bg='high'
colorscheme lucius
" colorscheme seoul256
" colorscheme hemisu
" colorscheme smyck

set cursorline                          " show the current line

" Tcomment
map <leader>c :TComment<CR>

" Ragtag
let g:ragtag_global_maps = 1

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

" run focussed tests
map <silent><F6> <Plug>SendTestToTmux
map <silent><F7> <Plug>SendFocusedTestToTmux

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

" Disable Ex mode
map Q <nop

" Handle often made typing errors
command W w
command Wq wq
command Q q
command Qa qa

" Don't display full paths
let g:Powerline_stl_path_style = 'short'

set shiftround " Round indent to multiples of shiftwidth

" Tslime setup
let g:slime_target = "tmux"

" Ctrl-P setup
" Uses matcher for the same fuzzy-find algorithm as Command-T
" https://github.com/burke/matcher

let g:ctrlp_map = '<leader>t'
map <leader>p :CtrlPClearCache<CR>

" Open file even if it's opened in another buffer already
let g:ctrlp_jump_to_buffer = 1

let g:path_to_matcher = "/usr/local/bin/matcher"
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_match_func = { 'match': 'GoodMatch' }

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
  " Create a cache file if not yet exists
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")
endfunction

" Quick function to place after the first occurence of a = or -.
" This fixes a pet peeve of mine that there should be a space after it in HAML
" /e is to silence the output if no match is found
function! FixHaml()
  :%s/^\(\s*\)\(=\)\(\S\)/\1\2 \3/e
  :%s/^\(\s*\)\(-\)\(\S\)/\1\2 \3/e
endfunction

" Same but for ERB, could package this into a plugin of some sort
function! FixErb()
  :%s/^\(\s*\)\(<%=\)\(\S\)/\1\2 \3/e
  :%s/^\(\s*\)\(<%-\)\(\S\)/\1\2 \3/e
  :%s/^\(\s*\)\(<%\)\(\S\)/\1\2 \3/e
endfunction

" Setup Turbux keybindings
let g:no_turbux_mappings = 1
map <leader>f <Plug>SendTestToTmux
map <leader>F <Plug>SendFocusedTestToTmux

au FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
" reset session:window:pane where commands are sent to
nmap <C-c>r <Plug>SetTmuxVars

" Rebind tmux key to run go tests
au FileType go nmap <leader>f :Tmux go test<CR>

" function to fix double spaces (not at the start of the line)
" http://stackoverflow.com/questions/3860532/vim-regex-replace-multiple-consecutive-spaces-with-only-one-space
function! FixDoubleSpaces()
  silent! :%s/\v(^ *)@<! {2,}/ /g
endfunction
