if status is-interactive
    # Commands to run in interactive sessions can go here
    colorscript -r
    set fish_greeting
end

alias hs='home-manager switch'
alias nrs='nixos-rebuild switch'
alias nrsf='nixos-rebuild switch --flake .'


if ! type -q eza
    alias ls='ls --color=auto'
    alias la='ls -a'
    alias ll='ls -alFh'
    alias l='ls'
    alias l.="ls -A | egrep '^\.'"
else
    alias ls='eza --color=auto --icons'
    alias la='eza -a --icons'
    alias ll='eza -alFh --icons'
    alias l='eza --icons'
    alias l.="eza -A | egrep '^\.'"
    alias tree="eza --tree"
end


starship init fish | source
zoxide init fish | source
