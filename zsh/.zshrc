# If you come from bash you might have to change your $PATH.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='nvim'
export VISUAL='nvim'

# Unified & Deduped PATH
typeset -U path
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$HOME/.opencode/bin:$HOME/.cargo/bin:$PATH"

# Aliases
alias v="nvim"
alias nano="nvim"
alias g="git"
alias backup="git-master-backup"
alias c="clear"
alias ll="ls -lah"
alias atm="~/projects/java-project/run.sh"
alias dbms="~/projects/start-dbms.sh"
alias se="~/projects/start-se.sh"
alias obs-theme="obsidian-theme-sync"
alias ff-theme="firefox-theme-sync"
alias sdc="~/.local/bin/sdc"
alias sddms="~/.local/bin/sddms"
alias sdbms="~/.local/bin/sddms"

# Zoxide (smart directory jump)
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# Starship Prompt (Theme-Adaptive)
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

export PATH="$HOME/Softwares/flutter/bin:$PATH"
