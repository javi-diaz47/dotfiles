if status is-interactive
    # Commands to run in interactive sessions can go here
    colorscript -r
    set fish_greeting
end

alias hs='home-manager switch'
alias nrs='nixos-rebuild switch'
alias nrsf='nixos-rebuild switch --flake .'

zoxide init fish | source
