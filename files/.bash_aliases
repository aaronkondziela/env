# AKA

# ls
alias ls='ls -F'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd)%C(cyan) %an%Creset' --abbrev-commit --date=format:'%Y-%b-%d %H:%m'"
alias gs="git status"
alias gco="git checkout"
alias gcm="git commit"
alias gb="git branch"
alias gba="git branch -a"

# util
alias rot13="tr a-zA-Z n-za-mN-ZA-M"

alias aliases='vi ~/.bash_aliases_private && . ~/.bash_aliases_private && echo Aliases updated.'
