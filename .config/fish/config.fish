if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end
colorscript random

# nvm
set -xU NODE_OPTIONS --dns-result-order=ipv4first

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/jdiaz/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# zotero
alias zotero='~/Downloads/Zotero_linux-x86_64/zotero'


alias ls='lsd'
alias la='lsd -la'
