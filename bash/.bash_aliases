
alias mkdir='mkdir -p'
alias ls='eza --git'
alias ll='eza -l --git'

# rgrc colorizer
if [[ -x "$(command -v rgrc)" ]]; then
    alias ping='rgrc ping'
    alias netstat='rgrc netstat'
    alias make='rgrc make'
    alias diff='rgrc diff'
fi
