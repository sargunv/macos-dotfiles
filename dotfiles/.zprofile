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

# jetbrains toolbox
export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

# stuff for Headway

export LOCAL_DATA_SOURCE=fixtures

eval "$(fnm env --use-on-cd)"

export PYCURL_SSL_LIBRARY=openssl
export LDFLAGS="-L$(brew --prefix)/opt/openssl/lib"
export CPPFLAGS="-I/$(brew --prefix)/opt/openssl/include"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

plugin=(
  pyenv
)

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
