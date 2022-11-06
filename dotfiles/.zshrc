# zsh plugin manager
if [ ! -f ~/.zsh_addons/zsh-znap/znap.zsh ]; then
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.zsh_addons/zsh-znap
fi
source ~/.zsh_addons/zsh-znap/znap.zsh

# starship prompt
jq -s '.[0] * .[1]' \
    <(starship preset nerd-font-symbols | yj -tj) \
    <(yj -tj <"$HOME/.config/starship_user.toml") |
    yj -jt >"$HOME/.config/starship.toml"

export ITERM2_SQUELCH_MARK=1
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
znap eval starship 'starship init zsh --print-full-init'
znap prompt

# zsh history tweaks
export HISTSIZE=100000   # macOS default is 2000
setopt HIST_IGNORE_SPACE # don't enter into history if command starts with space
setopt HIST_IGNORE_DUPS  # don't enter into history if duplicate of previous command
setopt SHARE_HISTORY     # write to history file after every command, and import into other zsh instances

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# all completions should be sourced after this.
autoload -Uz compinit
compinit

# zsh plugins
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source homebrew/homebrew-command-not-found handler.sh
znap eval zoxide 'zoxide init zsh'

# extras
source ~/.iterm2_shell_integration.zsh
