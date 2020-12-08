OS=$(uname)

. /Users/markmulder/.nix-profile/etc/profile.d/nix.sh

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

# Mac
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Linux
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
