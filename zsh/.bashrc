# .bashrc - Cleaned & Optimized

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User PATH
export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.npm-global/bin:$PATH"

# Defaults
export EDITOR="nvim"
export VISUAL="nvim"

# Aliases
alias v="nvim"
alias g="git"
alias backup="git-master-backup"
alias c="clear"
alias ll="ls -lah"

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        [ -f "$rc" ] && . "$rc"
    done
fi
