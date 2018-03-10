OS=$(uname)

. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="./bin:$PATH" # for binstubs, had to load it here otherwise rbenv path stuff gets precedence, eventhough I loaded the ./bin first

export PATH="/usr/local/bin:$PATH" >> ~/.zshrc

if test "$OS" = "Linux"; then
  # SSH password manager
  eval $(keychain --eval --quiet id_rsa ~/.ssh/id_rsa)
fi
