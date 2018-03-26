OS=$(uname)

. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

if test "$OS" = "Linux"; then
  # SSH password manager
  eval $(keychain --eval --quiet id_rsa ~/.ssh/id_rsa)
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
