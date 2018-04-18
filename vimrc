" Set leader to comma
let mapleader = ","

" Call pathogen
execute pathogen#infect()
" call pathogen#runtime_append_all_bundles()

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

" page through quickfix results with cmd-J cmd-K
map <D-J> :cnext<CR>
map <D-K> :cprev<CR>

" Automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Set tabstop to 4 for JS
" autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" set Vim-specific sequences for RGB colors
" https://github.com/vim/vim/issues/993
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
set termguicolors
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
set t_Co=256

set cursorline

" Shows what you are typing as a command
set showcmd

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

" Binds for vertical and horizontal splits
map <Leader>v :vsplit<CR>
map <Leader>s :split<CR>

" Open split on the right
set splitright

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

set shiftround " Round indent to multiples of shiftwidth

" Toggle paste mode to copy+paste with F2
set pastetoggle=<F2>

" ================
" Custom functions
" ================

" function to delete complete method
function! DeleteMethod()
  exe "norm \<esc>V"
  exe "norm %"
  exe "norm j"
  exe "norm D"
endfunction
map <Leader>d :call DeleteMethod()<CR>

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

" FZF
nnoremap <silent> <Leader>t :GFiles<CR>

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

" function to fix double spaces (not at the start of the line)
" http://stackoverflow.com/questions/3860532/vim-regex-replace-multiple-consecutive-spaces-with-only-one-space
function! FixDoubleSpaces()
  silent! :%s/\v(^ *)@<! {2,}/ /g
endfunction

function! GHOpen()
  silent! :call system('ghopen ' . expand('%') . ' ' . line('.'))
endfunction
map <silent><F2> :call GHOpen()<return>

" Setup Turbux keybindings
map <leader>f <Plug>SendTestToTmux
map <leader>F <Plug>SendFocusedTestToTmux

au FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
" reset session:window:pane where commands are sent to
nmap <C-c>r <Plug>SetTmuxVars

" Rebind tmux key to run go tests
au FileType go nmap <leader>f :Tmux go test<CR>
au FileType go nmap <leader>F :Tmux go run <c-r>%<CR>
" explanation about <c-r>
" http://stackoverflow.com/questions/737083/vim-how-to-use-variables-in-vimrc

au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gs <Plug>(go-doc)

" Yaml
au BufNewFile,BufRead *.yaml,*.yml set filetype=ansible

" =============================
" Plugin specific configuration
" =============================

" Tcomment
map <leader>c :TComment<CR>

" Load matchit
runtime! plugins/matchit.vim

" Ack
map <leader>a :Ack<space>
let g:ackprg="ack -H --nocolor --nogroup --column"

" NERDTree
noremap ,n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=0

" run focussed tests
map <silent><F6> <Plug>SendTestToTmux
map <silent><F7> <Plug>SendFocusedTestToTmux

" Don't display full paths
let g:Powerline_stl_path_style = 'short'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

let g:rustfmt_autosave = 1
let g:syntastic_rust_checkers = ['rustc']

let g:slime_target = "tmux"
let g:no_turbux_mappings = 1
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:go_fmt_command = "goimports"
