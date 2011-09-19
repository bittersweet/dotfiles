" This opens a new 'normal' buffer so Command-T can use the current buffer for
" opening files instead of having to resort to opening a new buffer in a split
"
" see https://wincent.com/forums/command-t/topics/435

function OpenEmptyBuffer()
  if argc() == 1 && isdirectory(argv(0))
    " replace the directory browser with an empty buffer
    enew
  end
endfunction

augroup NERDTreeHijackNetrw
  au VimEnter * call OpenEmptyBuffer()
augroup END
