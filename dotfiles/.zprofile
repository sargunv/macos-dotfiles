# local bin path
export PATH="$HOME/.local/bin/:$PATH"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# gnu tooling
GNU_PATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
GNU_PATH=$GNU_PATH:$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin
GNU_PATH=$GNU_PATH:$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin
export PATH=$GNU_PATH:$PATH

GNU_MANPATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman
GNU_MANPATH=$GNU_MANPATH:$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnuman
GNU_MANPATH=$GNU_MANPATH:$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnuman
MANPATH=$GNU_MANPATH:$MANPATH

# cargo / rust
export PATH="$HOME/.cargo/bin:$PATH"

# asdf
source "$(brew --prefix asdf)/libexec/asdf.sh"
